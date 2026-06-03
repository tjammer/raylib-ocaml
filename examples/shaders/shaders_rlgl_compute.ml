(* Note that this example needs raylib to be built with opengl 4.3 as its
   graphics API. This can be configured by setting the environment variable
   'GRAPHICS' when building raylib (not only when building the examples), like
   so: export GRAPHICS=GRAPHICS_API_OPENGL_43. *)

open Raylib

let gol_width = 768
let max_buffered_transferts = 48

(* Luckily, the update command is 4 tightly packed unsigned ints, so padding and
   alignment is not an issue and we can just use a bigarray *)
let cmd_size = 4

let () =
  init_window gol_width gol_width "raylib [shaders] example - rlgl compute";
  set_target_fps 60;

  let resolution =
    Vector2.create (float_of_int gol_width) (float_of_int gol_width)
  in
  let brush_size = ref 8 in

  (* game of life logic compute shader *)
  let gol_logic_code =
    In_channel.(with_open_bin "resources/glsl430/gol.glsl" input_all)
  in
  let gol_logic_shader =
    Rlgl.(load_shader gol_logic_code Shader.compute_shader)
  in
  let gol_logic_program = Rlgl.load_shader_program_compute gol_logic_shader in

  (* game of life logic render shader *)
  let gol_render_shader = load_shader "" "resources/glsl430/gol_render.glsl" in
  let res_loc = get_shader_location gol_render_shader "resolution" in

  (* game of life transfert shader (CPU <-> GPU download and upload) *)
  let gol_transfert_code =
    In_channel.(with_open_bin "resources/glsl430/gol_transfert.glsl" input_all)
  in
  let gol_tranfert_shader =
    Rlgl.(load_shader gol_transfert_code Shader.compute_shader)
  in
  let gol_transfert_program =
    Rlgl.load_shader_program_compute gol_tranfert_shader
  in

  (* load shader storage buffer object (ssbo), id returned *)
  let uint = Unsigned.UInt.of_int in
  let ssbo_a =
    ref
      Rlgl.(
        load_shader_buffer
          (uint (gol_width * gol_width * 4))
          Ctypes.null BufferUsage.dynamic_draw)
  in
  let ssbo_b =
    ref
      Rlgl.(
        load_shader_buffer
          (uint (gol_width * gol_width * 4))
          Ctypes.null BufferUsage.dynamic_draw)
  in

  let transfert_buffer =
    Bigarray.(
      Array1.create Int32 c_layout ((max_buffered_transferts * cmd_size) + 1))
  in
  (* Count is zero *)
  transfert_buffer.{0} <- 0l;
  let transfert_size = uint (Bigarray.Array1.size_in_bytes transfert_buffer) in

  let ssbo_transfert =
    Rlgl.(
      load_shader_buffer transfert_size Ctypes.null BufferUsage.dynamic_draw)
  in

  (* Create a white texture of the size of the window to update each pixel of
     the window using the fragment shader: golRenderShader *)
  let white_image = gen_image_color gol_width gol_width Color.white in
  let white_tex = load_texture_from_image white_image in
  unload_image white_image;

  while not (window_should_close ()) do
    brush_size := (get_mouse_wheel_move () |> int_of_float) + !brush_size;

    let count = transfert_buffer.{0} |> Int32.to_int in
    if
      (is_mouse_button_down Left || is_mouse_button_down Right)
      && count < max_buffered_transferts
    then (
      (* buffer a new command *)

      (* 0 is count, content starts at 1 *)
      transfert_buffer.{1 + (count * cmd_size)} <-
        get_mouse_x () - (!brush_size / 2) |> Int32.of_int;
      transfert_buffer.{2 + (count * cmd_size)} <-
        get_mouse_y () - (!brush_size / 2) |> Int32.of_int;
      transfert_buffer.{3 + (count * cmd_size)} <- Int32.of_int !brush_size;
      transfert_buffer.{4 + (count * cmd_size)} <-
        Int32.of_int (is_mouse_button_down Left |> Bool.to_int);
      transfert_buffer.{0} <- Int32.of_int (count + 1))
    else if count > 0 then begin
      let open Rlgl in
      update_shader_buffer ssbo_transfert
        Ctypes.(bigarray_start array1 transfert_buffer |> to_voidp)
        transfert_size (uint 0);

      enable_shader gol_transfert_program;
      bind_shader_buffer !ssbo_a (uint 1);
      bind_shader_buffer ssbo_transfert (uint 3);
      compute_shader_dispatch (uint count) (uint 1) (uint 1);
      (* each gpu unit will process a command *)
      disable_shader ();

      transfert_buffer.{0} <- 0l
    end
    else begin
      (* process game of life logic *)
      let open Rlgl in
      enable_shader gol_logic_program;
      bind_shader_buffer !ssbo_a (uint 1);
      bind_shader_buffer !ssbo_b (uint 2);
      compute_shader_dispatch
        (uint (gol_width / 16))
        (uint (gol_width / 16))
        (uint 1);
      disable_shader ();

      let temp = !ssbo_a in
      ssbo_a := !ssbo_b;
      ssbo_b := temp
    end;

    Rlgl.bind_shader_buffer !ssbo_a (uint 1);
    set_shader_value gol_render_shader res_loc
      (addr resolution |> to_voidp)
      Vec2;

    begin_drawing ();
    clear_background Color.blank;

    begin_shader_mode gol_render_shader;
    draw_texture white_tex 0 0 Color.white;
    end_shader_mode ();

    draw_rectangle_lines
      (get_mouse_x () - (!brush_size / 2))
      (get_mouse_y () - (!brush_size / 2))
      !brush_size !brush_size Color.red;

    draw_text "Use mouse wheel to increase/decrease brush size" 10 10 20
      Color.white;

    draw_fps (get_screen_width () - 100) 10;
    end_drawing ();
    ()
  done;

  Rlgl.(
    unload_shader_buffer !ssbo_a;
    unload_shader_buffer !ssbo_b;
    unload_shader_buffer ssbo_transfert;

    unload_shader gol_logic_shader;
    unload_shader gol_tranfert_shader;
    unload_shader_program gol_transfert_program;
    unload_shader_program gol_logic_program);
  unload_texture white_tex;
  unload_shader gol_render_shader;

  close_window ();
  ()

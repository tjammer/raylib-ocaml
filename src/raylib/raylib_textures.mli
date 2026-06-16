open Raylib_core

(** {2 Texture Loading and Drawing Functions (Module: textures)}*)

val load_image : string -> Image.t
(** [load_image file_name] Load image from file into CPU memory (RAM)*)

val load_image_raw : string -> int -> int -> PixelFormat.t -> int -> Image.t
(** [load_image_raw file_name width height format header_size] Load image from
    RAW file data*)

val load_image_anim : string -> int ptr -> Image.t
(** [load_image_anim file_name frames] Load image sequence from file (frames
    appended to image.data)*)

val load_image_anim_from_memory : string -> string -> int -> int ptr -> Image.t
(** [load_image_anim_from_memory file_type file_data data_size frames] Load
    image sequence from memory buffer*)

val load_image_from_memory : string -> string -> int -> Image.t
(** [load_image_from_memory file_type file_data data_size] Load image from
    memory buffer, fileType refers to extension: i.e. '.png'*)

val load_image_from_texture : Texture.t -> Image.t
(** [load_image_from_texture texture] Load image from GPU texture data*)

val load_image_from_screen : unit -> Image.t
(** [load_image_from_screen ()] Load image from screen buffer and (screenshot)*)

val is_image_valid : Image.t -> bool
(** [is_image_valid image] Check if an image is valid (data and parameters)*)

val unload_image : Image.t -> unit
(** [unload_image image] Unload image from CPU memory (RAM)*)

val export_image : Image.t -> string -> bool
(** [export_image image file_name] Export image data to file, returns true on
    success*)

val export_image_to_memory : Image.t -> string -> int ptr -> string
(** [export_image_to_memory image file_type file_size] Export image to memory
    buffer*)

val export_image_as_code : Image.t -> string -> bool
(** [export_image_as_code image file_name] Export image as code file defining an
    array of bytes, returns true on success*)

val gen_image_color : int -> int -> Color.t -> Image.t
(** [gen_image_color width height color] Generate image: plain color*)

val gen_image_gradient_linear :
  int -> int -> int -> Color.t -> Color.t -> Image.t
(** [gen_image_gradient_linear width height direction start end] Generate image:
    linear gradient, direction in degrees [0..360], 0=Vertical gradient*)

val gen_image_gradient_radial :
  int -> int -> float -> Color.t -> Color.t -> Image.t
(** [gen_image_gradient_radial width height density inner outer] Generate image:
    radial gradient*)

val gen_image_gradient_square :
  int -> int -> float -> Color.t -> Color.t -> Image.t
(** [gen_image_gradient_square width height density inner outer] Generate image:
    square gradient*)

val gen_image_checked :
  int -> int -> int -> int -> Color.t -> Color.t -> Image.t
(** [gen_image_checked width height checks_x checks_y col1 col2] Generate image:
    checked*)

val gen_image_white_noise : int -> int -> float -> Image.t
(** [gen_image_white_noise width height factor] Generate image: white noise*)

val gen_image_perlin_noise : int -> int -> int -> int -> float -> Image.t
(** [gen_image_perlin_noise width height offset_x offset_y scale] Generate
    image: perlin noise*)

val gen_image_cellular : int -> int -> int -> Image.t
(** [gen_image_cellular width height tile_size] Generate image: cellular
    algorithm, bigger tileSize means bigger cells*)

val gen_image_text : int -> int -> string -> Image.t
(** [gen_image_text width height text] Generate image: grayscale image from text
    data*)

(** {3 Image manipulation functions} *)

val image_copy : Image.t -> Image.t
(** [image_copy image] Create an image duplicate (useful for transformations)*)

val image_from_image : Image.t -> Rectangle.t -> Image.t
(** [image_from_image image rec] Create an image from another image piece*)

val image_from_channel : Image.t -> int -> Image.t
(** [image_from_channel image selected_channel] Create an image from a selected
    channel of another image (GRAYSCALE)*)

val image_text : string -> int -> Color.t -> Image.t
(** [image_text text font_size color] Create an image from text (default font)*)

val image_text_ex : Font.t -> string -> float -> float -> Color.t -> Image.t
(** [image_text_ex font text font_size spacing tint] Create an image from text
    (custom sprite font)*)

val image_format : Image.t ptr -> PixelFormat.t -> unit
(** [image_format image new_format] Convert image data to desired format*)

val image_to_pot : Image.t ptr -> Color.t -> unit
(** [image_to_pot image fill] Convert image to POT (power-of-two)*)

val image_crop : Image.t ptr -> Rectangle.t -> unit
(** [image_crop image crop] Crop an image to a defined rectangle*)

val image_alpha_crop : Image.t ptr -> float -> unit
(** [image_alpha_crop image threshold] Crop image depending on alpha value*)

val image_alpha_clear : Image.t ptr -> Color.t -> float -> unit
(** [image_alpha_clear image color threshold] Clear alpha channel to desired
    color*)

val image_alpha_mask : Image.t ptr -> Image.t -> unit
(** [image_alpha_mask image alpha_mask] Apply alpha mask to image*)

val image_alpha_premultiply : Image.t ptr -> unit
(** [image_alpha_premultiply image] Premultiply alpha channel*)

val image_blur_gaussian : Image.t ptr -> int -> unit
(** [image_blur_gaussian image blur_size] Apply Gaussian blur using a box blur
    approximation*)

val image_kernel_convolution : Image.t ptr -> float ptr -> int -> unit
(** [image_kernel_convolution image kernel kernel_size] Apply custom square
    convolution kernel to image*)

val image_resize : Image.t ptr -> int -> int -> unit
(** [image_resize image new_width new_height] Resize image (Bicubic scaling
    algorithm)*)

val image_resize_nn : Image.t ptr -> int -> int -> unit
(** [image_resize_nn image new_width new_height] Resize image (Nearest-Neighbor
    scaling algorithm)*)

val image_resize_canvas :
  Image.t ptr -> int -> int -> int -> int -> Color.t -> unit
(** [image_resize_canvas image new_width new_height offset_x offset_y fill]
    Resize canvas and fill with color*)

val image_mipmaps : Image.t ptr -> unit
(** [image_mipmaps image] Compute all mipmap levels for a provided image*)

val image_dither : Image.t ptr -> int -> int -> int -> int -> unit
(** [image_dither image r_bpp g_bpp b_bpp a_bpp] Dither image data to 16bpp or
    lower (Floyd-Steinberg dithering)*)

val image_flip_vertical : Image.t ptr -> unit
(** [image_flip_vertical image] Flip image vertically*)

val image_flip_horizontal : Image.t ptr -> unit
(** [image_flip_horizontal image] Flip image horizontally*)

val image_rotate : Image.t ptr -> int -> unit
(** [image_rotate image degrees] Rotate image by input angle in degrees (-359 to
    359)*)

val image_rotate_cw : Image.t ptr -> unit
(** [image_rotate_cw image] Rotate image clockwise 90deg*)

val image_rotate_ccw : Image.t ptr -> unit
(** [image_rotate_ccw image] Rotate image counter-clockwise 90deg*)

val image_color_tint : Image.t ptr -> Color.t -> unit
(** [image_color_tint image color] Modify image color: tint*)

val image_color_invert : Image.t ptr -> unit
(** [image_color_invert image] Modify image color: invert*)

val image_color_grayscale : Image.t ptr -> unit
(** [image_color_grayscale image] Modify image color: grayscale*)

val image_color_contrast : Image.t ptr -> float -> unit
(** [image_color_contrast image contrast] Modify image color: contrast (-100 to
    100)*)

val image_color_brightness : Image.t ptr -> int -> unit
(** [image_color_brightness image brightness] Modify image color: brightness
    (-255 to 255)*)

val image_color_replace : Image.t ptr -> Color.t -> Color.t -> unit
(** [image_color_replace image color replace] Modify image color: replace color*)

val load_image_colors : Image.t -> Color.t ptr
(** [load_image_colors image] Load color data from image as a Color array (RGBA
    \- 32bit)*)

val load_image_palette : Image.t -> int -> int ptr -> Color.t ptr
(** [load_image_palette image max_palette_size color_count] Load colors palette
    from image as a Color array (RGBA - 32bit)*)

val unload_image_colors : Color.t ptr -> unit
(** [unload_image_colors colors] Unload color data loaded with LoadImageColors()*)

val unload_image_palette : Color.t ptr -> unit
(** [unload_image_palette colors] Unload colors palette loaded with
    LoadImagePalette()*)

val get_image_alpha_border : Image.t -> float -> Rectangle.t
(** [get_image_alpha_border image threshold] Get image alpha border rectangle*)

val get_image_color : Image.t -> int -> int -> Color.t
(** [get_image_color image x y] Get image pixel color at (x, y) position*)

val image_clear_background : Image.t ptr -> Color.t -> unit
(** [image_clear_background dst color] Clear image background with given color*)

val image_draw_pixel : Image.t ptr -> int -> int -> Color.t -> unit
(** [image_draw_pixel dst pos_x pos_y color] Draw pixel within an image*)

val image_draw_pixel_v : Image.t ptr -> Vector2.t -> Color.t -> unit
(** [image_draw_pixel_v dst position color] Draw pixel within an image (Vector
    version)*)

val image_draw_line : Image.t ptr -> int -> int -> int -> int -> Color.t -> unit
(** [image_draw_line dst start_pos_x start_pos_y end_pos_x end_pos_y color] Draw
    line within an image*)

val image_draw_line_v : Image.t ptr -> Vector2.t -> Vector2.t -> Color.t -> unit
(** [image_draw_line_v dst start end color] Draw line within an image (Vector
    version)*)

val image_draw_line_ex :
  Image.t ptr -> Vector2.t -> Vector2.t -> int -> Color.t -> unit
(** [image_draw_line_ex dst start end thick color] Draw a line defining
    thickness within an image*)

val image_draw_circle : Image.t ptr -> int -> int -> int -> Color.t -> unit
(** [image_draw_circle dst center_x center_y radius color] Draw a filled circle
    within an image*)

val image_draw_circle_v : Image.t ptr -> Vector2.t -> int -> Color.t -> unit
(** [image_draw_circle_v dst center radius color] Draw a filled circle within an
    image (Vector version)*)

val image_draw_circle_lines :
  Image.t ptr -> int -> int -> int -> Color.t -> unit
(** [image_draw_circle_lines dst center_x center_y radius color] Draw circle
    outline within an image*)

val image_draw_circle_lines_v :
  Image.t ptr -> Vector2.t -> int -> Color.t -> unit
(** [image_draw_circle_lines_v dst center radius color] Draw circle outline
    within an image (Vector version)*)

val image_draw_rectangle :
  Image.t ptr -> int -> int -> int -> int -> Color.t -> unit
(** [image_draw_rectangle dst pos_x pos_y width height color] Draw rectangle
    within an image*)

val image_draw_rectangle_v :
  Image.t ptr -> Vector2.t -> Vector2.t -> Color.t -> unit
(** [image_draw_rectangle_v dst position size color] Draw rectangle within an
    image (Vector version)*)

val image_draw_rectangle_rec : Image.t ptr -> Rectangle.t -> Color.t -> unit
(** [image_draw_rectangle_rec dst rec color] Draw rectangle within an image*)

val image_draw_rectangle_lines :
  Image.t ptr -> Rectangle.t -> int -> Color.t -> unit
(** [image_draw_rectangle_lines dst rec thick color] Draw rectangle lines within
    an image*)

val image_draw_triangle :
  Image.t ptr -> Vector2.t -> Vector2.t -> Vector2.t -> Color.t -> unit
(** [image_draw_triangle dst v1 v2 v3 color] Draw triangle within an image*)

val image_draw_triangle_ex :
  Image.t ptr ->
  Vector2.t ->
  Vector2.t ->
  Vector2.t ->
  Color.t ->
  Color.t ->
  Color.t ->
  unit
(** [image_draw_triangle_ex dst v1 v2 v3 c1 c2 c3] Draw triangle with
    interpolated colors within an image*)

val image_draw_triangle_lines :
  Image.t ptr -> Vector2.t -> Vector2.t -> Vector2.t -> Color.t -> unit
(** [image_draw_triangle_lines dst v1 v2 v3 color] Draw triangle outline within
    an image*)

val image_draw_triangle_fan :
  Image.t ptr -> Vector2.t ptr -> int -> Color.t -> unit
(** [image_draw_triangle_fan dst points point_count color] Draw a triangle fan
    defined by points within an image (first vertex is the center)*)

val image_draw_triangle_strip :
  Image.t ptr -> Vector2.t ptr -> int -> Color.t -> unit
(** [image_draw_triangle_strip dst points point_count color] Draw a triangle
    strip defined by points within an image*)

val image_draw :
  Image.t ptr -> Image.t -> Rectangle.t -> Rectangle.t -> Color.t -> unit
(** [image_draw dst src src_rec dst_rec tint] Draw a source image within a
    destination image (tint applied to source)*)

val image_draw_text :
  Image.t ptr -> string -> int -> int -> int -> Color.t -> unit
(** [image_draw_text dst text pos_x pos_y font_size color] Draw text (using
    default font) within an image (destination)*)

val image_draw_text_ex :
  Image.t ptr ->
  Font.t ->
  string ->
  Vector2.t ->
  float ->
  float ->
  Color.t ->
  unit
(** [image_draw_text_ex dst font text position font_size spacing tint] Draw text
    (custom sprite font) within an image (destination)*)

(** {3 Texture loading functions} *)

val load_texture : string -> Texture.t
(** [load_texture file_name] Load texture from file into GPU memory (VRAM)*)

val load_texture_from_image : Image.t -> Texture.t
(** [load_texture_from_image image] Load texture from image data*)

val load_texture_cubemap : Image.t -> CubemapLayout.t -> Texture.t
(** [load_texture_cubemap image layout] Load cubemap from image, multiple image
    cubemap layouts supported*)

val load_render_texture : int -> int -> RenderTexture.t
(** [load_render_texture width height] Load texture for rendering (framebuffer)*)

val is_texture_valid : Texture.t -> bool
(** [is_texture_valid texture] Check if a texture is valid (loaded in GPU)*)

val unload_texture : Texture.t -> unit
(** [unload_texture texture] Unload texture from GPU memory (VRAM)*)

val is_render_texture_valid : RenderTexture.t -> bool
(** [is_render_texture_valid target] Check if a render texture is valid (loaded
    in GPU)*)

val unload_render_texture : RenderTexture.t -> unit
(** [unload_render_texture target] Unload render texture from GPU memory (VRAM)*)

val update_texture : Texture.t -> unit ptr -> unit
(** [update_texture texture pixels] Update GPU texture with new data*)

val update_texture_rec : Texture.t -> Rectangle.t -> unit ptr -> unit
(** [update_texture_rec texture rec pixels] Update GPU texture rectangle with
    new data*)

val gen_texture_mipmaps : Texture.t ptr -> unit
(** [gen_texture_mipmaps texture] Generate GPU mipmaps for a texture*)

val set_texture_filter : Texture.t -> TextureFilter.t -> unit
(** [set_texture_filter texture filter] Set texture scaling filter mode*)

val set_texture_wrap : Texture.t -> TextureWrap.t -> unit
(** [set_texture_wrap texture wrap] Set texture wrapping mode*)

val draw_texture : Texture.t -> int -> int -> Color.t -> unit
(** [draw_texture texture pos_x pos_y tint] Draw a Texture2D*)

val draw_texture_v : Texture.t -> Vector2.t -> Color.t -> unit
(** [draw_texture_v texture position tint] Draw a Texture2D with position
    defined as Vector2*)

val draw_texture_ex :
  Texture.t -> Vector2.t -> float -> float -> Color.t -> unit
(** [draw_texture_ex texture position rotation scale tint] Draw a Texture2D with
    extended parameters*)

val draw_texture_rec : Texture.t -> Rectangle.t -> Vector2.t -> Color.t -> unit
(** [draw_texture_rec texture source position tint] Draw a part of a texture
    defined by a rectangle*)

val draw_texture_pro :
  Texture.t ->
  Rectangle.t ->
  Rectangle.t ->
  Vector2.t ->
  float ->
  Color.t ->
  unit
(** [draw_texture_pro texture source dest origin rotation tint] Draw a part of a
    texture defined by a rectangle with 'pro' parameters*)

val draw_texture_npatch :
  Texture.t ->
  NPatchInfo.t ->
  Rectangle.t ->
  Vector2.t ->
  float ->
  Color.t ->
  unit
(** [draw_texture_npatch texture n_patch_info dest origin rotation tint] Draws a
    texture (or part of it) that stretches or shrinks nicely*)

val color_is_equal : Color.t -> Color.t -> bool
(** [color_is_equal col1 col2] Check if two colors are equal*)

val fade : Color.t -> float -> Color.t
(** [fade color alpha] Get color with alpha applied, alpha goes from 0.0f to
    1.0f*)

val color_to_int : Color.t -> int
(** [color_to_int color] Get hexadecimal value for a Color (0xRRGGBBAA)*)

val color_normalize : Color.t -> Vector4.t
(** [color_normalize color] Get Color normalized as float [0..1]*)

val color_from_normalized : Vector4.t -> Color.t
(** [color_from_normalized normalized] Get Color from normalized values [0..1]*)

val color_to_hsv : Color.t -> Vector3.t
(** [color_to_hsv color] Get HSV values for a Color, hue [0..360],
    saturation/value [0..1]*)

val color_from_hsv : float -> float -> float -> Color.t
(** [color_from_hsv hue saturation value] Get a Color from HSV values, hue
    [0..360], saturation/value [0..1]*)

val color_tint : Color.t -> Color.t -> Color.t
(** [color_tint color tint] Get color multiplied with another color*)

val color_brightness : Color.t -> float -> Color.t
(** [color_brightness color factor] Get color with brightness correction,
    brightness factor goes from -1.0f to 1.0f*)

val color_contrast : Color.t -> float -> Color.t
(** [color_contrast color contrast] Get color with contrast correction, contrast
    values between -1.0f and 1.0f*)

val color_alpha : Color.t -> float -> Color.t
(** [color_alpha color alpha] Get color with alpha applied, alpha goes from 0.0f
    to 1.0f*)

val color_alpha_blend : Color.t -> Color.t -> Color.t -> Color.t
(** [color_alpha_blend dst src tint] Get src alpha-blended into dst color with
    tint*)

val color_lerp : Color.t -> Color.t -> float -> Color.t
(** [color_lerp color1 color2 factor] Get color lerp interpolation between two
    colors, factor [0.0f..1.0f]*)

val get_color : int -> Color.t
(** [get_color hex_value] Get Color structure from hexadecimal value*)

val get_pixel_color : unit ptr -> PixelFormat.t -> Color.t
(** [get_pixel_color src_ptr format] Get Color from a source pixel pointer of
    certain format*)

val set_pixel_color : unit ptr -> Color.t -> PixelFormat.t -> unit
(** [set_pixel_color dst_ptr color format] Set color formatted into destination
    pixel pointer*)

val get_pixel_data_size : int -> int -> PixelFormat.t -> int
(** [get_pixel_data_size width height format] Get pixel data size in bytes for
    certain format*)

open Raylib_core

(** {2 Basic 3d Shapes Drawing Functions (Module: models)} *)

(** {3 Basic geometric 3D shapes drawing functions} *)

val draw_line_3d : Vector3.t -> Vector3.t -> Color.t -> unit
(** [draw_line_3d start_pos end_pos color] Draw a line in 3D world space*)

val draw_point_3d : Vector3.t -> Color.t -> unit
(** [draw_point_3d position color] Draw a point in 3D space, actually a small
    line*)

val draw_circle_3d : Vector3.t -> float -> Vector3.t -> float -> Color.t -> unit
(** [draw_circle_3d center radius rotation_axis rotation_angle color] Draw a
    circle in 3D world space*)

val draw_triangle_3d : Vector3.t -> Vector3.t -> Vector3.t -> Color.t -> unit
(** [draw_triangle_3d v1 v2 v3 color] Draw a color-filled triangle (vertex in
    counter-clockwise order!)*)

val draw_triangle_strip_3d : Vector3.t ptr -> int -> Color.t -> unit
(** [draw_triangle_strip_3d points point_count color] Draw a triangle strip
    defined by points*)

val draw_cube : Vector3.t -> float -> float -> float -> Color.t -> unit
(** [draw_cube position width height length color] Draw cube*)

val draw_cube_v : Vector3.t -> Vector3.t -> Color.t -> unit
(** [draw_cube_v position size color] Draw cube (Vector version)*)

val draw_cube_wires : Vector3.t -> float -> float -> float -> Color.t -> unit
(** [draw_cube_wires position width height length color] Draw cube wires*)

val draw_cube_wires_v : Vector3.t -> Vector3.t -> Color.t -> unit
(** [draw_cube_wires_v position size color] Draw cube wires (Vector version)*)

val draw_sphere : Vector3.t -> float -> Color.t -> unit
(** [draw_sphere center_pos radius color] Draw sphere*)

val draw_sphere_ex : Vector3.t -> float -> int -> int -> Color.t -> unit
(** [draw_sphere_ex center_pos radius rings slices color] Draw sphere with
    extended parameters*)

val draw_sphere_wires : Vector3.t -> float -> int -> int -> Color.t -> unit
(** [draw_sphere_wires center_pos radius rings slices color] Draw sphere wires*)

val draw_cylinder :
  Vector3.t -> float -> float -> float -> int -> Color.t -> unit
(** [draw_cylinder position radius_top radius_bottom height slices color] Draw a
    cylinder/cone*)

val draw_cylinder_ex :
  Vector3.t -> Vector3.t -> float -> float -> int -> Color.t -> unit
(** [draw_cylinder_ex start_pos end_pos start_radius end_radius sides color]
    Draw a cylinder with base at startPos and top at endPos*)

val draw_cylinder_wires :
  Vector3.t -> float -> float -> float -> int -> Color.t -> unit
(** [draw_cylinder_wires position radius_top radius_bottom height slices color]
    Draw a cylinder/cone wires*)

val draw_cylinder_wires_ex :
  Vector3.t -> Vector3.t -> float -> float -> int -> Color.t -> unit
(** [draw_cylinder_wires_ex start_pos end_pos start_radius end_radius sides
     color] Draw a cylinder wires with base at startPos and top at endPos*)

val draw_capsule :
  Vector3.t -> Vector3.t -> float -> int -> int -> Color.t -> unit
(** [draw_capsule start_pos end_pos radius slices rings color] Draw a capsule
    with the center of its sphere caps at startPos and endPos*)

val draw_capsule_wires :
  Vector3.t -> Vector3.t -> float -> int -> int -> Color.t -> unit
(** [draw_capsule_wires start_pos end_pos radius slices rings color] Draw
    capsule wireframe with the center of its sphere caps at startPos and endPos*)

val draw_plane : Vector3.t -> Vector2.t -> Color.t -> unit
(** [draw_plane center_pos size color] Draw a plane XZ*)

val draw_ray : Ray.t -> Color.t -> unit
(** [draw_ray ray color] Draw a ray line*)

val draw_grid : int -> float -> unit
(** [draw_grid slices spacing] Draw a grid (centered at (0, 0, 0))*)

(** {3 Model loading/unloading functions} *)

val load_model : string -> Model.t
(** [load_model file_name] Load model from files (meshes and materials)*)

val load_model_from_mesh : Mesh.t -> Model.t
(** [load_model_from_mesh mesh] Load model from generated mesh (default
    material)*)

val is_model_valid : Model.t -> bool
(** [is_model_valid model] Check if a model is valid (loaded in GPU, VAO/VBOs)*)

val unload_model : Model.t -> unit
(** [unload_model model] Unload model (including meshes) from memory (RAM and/or
    VRAM)*)

val get_model_bounding_box : Model.t -> BoundingBox.t
(** [get_model_bounding_box model] Compute model bounding box limits (considers
    all meshes)*)

val draw_model : Model.t -> Vector3.t -> float -> Color.t -> unit
(** [draw_model model position scale tint] Draw a model (with texture if set)*)

val draw_model_ex :
  Model.t -> Vector3.t -> Vector3.t -> float -> Vector3.t -> Color.t -> unit
(** [draw_model_ex model position rotation_axis rotation_angle scale tint] Draw
    a model with extended parameters*)

val draw_model_wires : Model.t -> Vector3.t -> float -> Color.t -> unit
(** [draw_model_wires model position scale tint] Draw a model wires (with
    texture if set)*)

val draw_model_wires_ex :
  Model.t -> Vector3.t -> Vector3.t -> float -> Vector3.t -> Color.t -> unit
(** [draw_model_wires_ex model position rotation_axis rotation_angle scale tint]
    Draw a model wires (with texture if set) with extended parameters*)

val draw_bounding_box : BoundingBox.t -> Color.t -> unit
(** [draw_bounding_box box color] Draw bounding box (wires)*)

val draw_billboard :
  Camera3D.t -> Texture.t -> Vector3.t -> float -> Color.t -> unit
(** [draw_billboard camera texture position scale tint] Draw a billboard texture*)

val draw_billboard_rec :
  Camera3D.t ->
  Texture.t ->
  Rectangle.t ->
  Vector3.t ->
  Vector2.t ->
  Color.t ->
  unit
(** [draw_billboard_rec camera texture source position size tint] Draw a
    billboard texture defined by source*)

val draw_billboard_pro :
  Camera3D.t ->
  Texture.t ->
  Rectangle.t ->
  Vector3.t ->
  Vector3.t ->
  Vector2.t ->
  Vector2.t ->
  float ->
  Color.t ->
  unit
(** [draw_billboard_pro camera texture source position up size origin rotation
     tint] Draw a billboard texture defined by source and rotation*)

val upload_mesh : Mesh.t ptr -> bool -> unit
(** [upload_mesh mesh dynamic] Upload mesh vertex data in GPU and provide
    VAO/VBO ids*)

val update_mesh_buffer : Mesh.t -> int -> unit ptr -> int -> int -> unit
(** [update_mesh_buffer mesh index data data_size offset] Update mesh vertex
    data in GPU for a specific buffer index*)

val unload_mesh : Mesh.t -> unit
(** [unload_mesh mesh] Unload mesh data from CPU and GPU*)

val draw_mesh : Mesh.t -> Material.t -> Matrix.t -> unit
(** [draw_mesh mesh material transform] Draw a 3d mesh with material and
    transform*)

val draw_mesh_instanced : Mesh.t -> Material.t -> Matrix.t ptr -> int -> unit
(** [draw_mesh_instanced mesh material transforms instances] Draw multiple mesh
    instances with material and different transforms*)

val get_mesh_bounding_box : Mesh.t -> BoundingBox.t
(** [get_mesh_bounding_box mesh] Compute mesh bounding box limits*)

(** {3 Mesh generation functions} *)

val gen_mesh_tangents : Mesh.t ptr -> unit
(** [gen_mesh_tangents mesh] Compute mesh tangents*)

val export_mesh : Mesh.t -> string -> bool
(** [export_mesh mesh file_name] Export mesh data to file, returns true on
    success*)

val export_mesh_as_code : Mesh.t -> string -> bool
(** [export_mesh_as_code mesh file_name] Export mesh as code file (.h) defining
    multiple arrays of vertex attributes*)

val gen_mesh_poly : int -> float -> Mesh.t
(** [gen_mesh_poly sides radius] Generate polygonal mesh*)

val gen_mesh_plane : float -> float -> int -> int -> Mesh.t
(** [gen_mesh_plane width length res_x res_z] Generate plane mesh (with
    subdivisions)*)

val gen_mesh_cube : float -> float -> float -> Mesh.t
(** [gen_mesh_cube width height length] Generate cuboid mesh*)

val gen_mesh_sphere : float -> int -> int -> Mesh.t
(** [gen_mesh_sphere radius rings slices] Generate sphere mesh (standard sphere)*)

val gen_mesh_hemi_sphere : float -> int -> int -> Mesh.t
(** [gen_mesh_hemi_sphere radius rings slices] Generate half-sphere mesh (no
    bottom cap)*)

val gen_mesh_cylinder : float -> float -> int -> Mesh.t
(** [gen_mesh_cylinder radius height slices] Generate cylinder mesh*)

val gen_mesh_cone : float -> float -> int -> Mesh.t
(** [gen_mesh_cone radius height slices] Generate cone/pyramid mesh*)

val gen_mesh_torus : float -> float -> int -> int -> Mesh.t
(** [gen_mesh_torus radius size rad_seg sides] Generate torus mesh*)

val gen_mesh_knot : float -> float -> int -> int -> Mesh.t
(** [gen_mesh_knot radius size rad_seg sides] Generate trefoil knot mesh*)

val gen_mesh_heightmap : Image.t -> Vector3.t -> Mesh.t
(** [gen_mesh_heightmap heightmap size] Generate heightmap mesh from image data*)

val gen_mesh_cubicmap : Image.t -> Vector3.t -> Mesh.t
(** [gen_mesh_cubicmap cubicmap cube_size] Generate cubes-based map mesh from
    image data*)

val load_materials : string -> int ptr -> Material.t ptr
(** [load_materials file_name material_count] Load materials from model file*)

val load_material_default : unit -> Material.t
(** [load_material_default ()] Load default material (Supports: DIFFUSE,
    SPECULAR, NORMAL maps)*)

val is_material_valid : Material.t -> bool
(** [is_material_valid material] Check if a material is valid (shader assigned,
    map textures loaded in GPU)*)

val unload_material : Material.t -> unit
(** [unload_material material] Unload material from GPU memory (VRAM)*)

val set_material_texture :
  Material.t ptr -> MaterialMapIndex.t -> Texture.t -> unit
(** [set_material_texture material map_type texture] Set texture for a material
    map type (MATERIAL_MAP_DIFFUSE, MATERIAL_MAP_SPECULAR...)*)

val set_model_mesh_material : Model.t ptr -> int -> int -> unit
(** [set_model_mesh_material model mesh_id material_id] Set material for a mesh*)

val load_model_animations : string -> ModelAnimation.t CArray.t
(** [load_model_animations file_name anim_count] Load model animations from file*)

val update_model_animation : Model.t -> ModelAnimation.t -> int -> unit
(** [update_model_animation model anim frame] Update model animation pose (CPU)*)

val update_model_animation_ex :
  Model.t ->
  ModelAnimation.t ->
  float ->
  ModelAnimation.t ->
  float ->
  float ->
  unit
(** [update_model_animation_ex model animA frameA animB frameB blend] Update
    model animation pose, blending two animations*)

val unload_model_animations : ModelAnimation.t CArray.t -> unit
(** [unload_model_animations animations anim_count] Unload animation array data*)

val is_model_animation_valid : Model.t -> ModelAnimation.t -> bool
(** [is_model_animation_valid model anim] Check model animation skeleton match*)

(** {3 Collision detection functions} *)

val check_collision_spheres : Vector3.t -> float -> Vector3.t -> float -> bool
(** [check_collision_spheres center1 radius1 center2 radius2] Check collision
    between two spheres*)

val check_collision_boxes : BoundingBox.t -> BoundingBox.t -> bool
(** [check_collision_boxes box1 box2] Check collision between two bounding boxes*)

val check_collision_box_sphere : BoundingBox.t -> Vector3.t -> float -> bool
(** [check_collision_box_sphere box center radius] Check collision between box
    and sphere*)

val get_ray_collision_sphere : Ray.t -> Vector3.t -> float -> RayCollision.t
(** [get_ray_collision_sphere ray center radius] Get collision info between ray
    and sphere*)

val get_ray_collision_box : Ray.t -> BoundingBox.t -> RayCollision.t
(** [get_ray_collision_box ray box] Get collision info between ray and box*)

val get_ray_collision_mesh : Ray.t -> Mesh.t -> Matrix.t -> RayCollision.t
(** [get_ray_collision_mesh ray mesh transform] Get collision info between ray
    and mesh*)

val get_ray_collision_triangle :
  Ray.t -> Vector3.t -> Vector3.t -> Vector3.t -> RayCollision.t
(** [get_ray_collision_triangle ray p1 p2 p3] Get collision info between ray and
    triangle*)

val get_ray_collision_quad :
  Ray.t -> Vector3.t -> Vector3.t -> Vector3.t -> Vector3.t -> RayCollision.t
(** [get_ray_collision_quad ray p1 p2 p3 p4] Get collision info between ray and
    quad*)

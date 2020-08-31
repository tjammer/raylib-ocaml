include Raylib_functions.Description (Raylib_c.Raylib_c_generated_functions)
include Raylib_generated_constants
include Ctypes_reexports
module Types = Raylib_functions.Types
open Ctypes

module Vector2 = struct
  type t = Types.Vector2.t structure

  let t = Types.Vector2.t

  let create x y =
    let vec = make t in
    setf vec Types.Vector2.x x;
    setf vec Types.Vector2.y y;
    vec

  let x vec = getf vec Types.Vector2.x

  let y vec = getf vec Types.Vector2.y

  let set_x vec x = setf vec Types.Vector2.x x

  let set_y vec y = setf vec Types.Vector2.y y
end

module Vector3 = struct
  type t = Types.Vector3.t structure

  let t = Types.Vector3.t

  let create x y z =
    let vec = make t in
    setf vec Types.Vector3.x x;
    setf vec Types.Vector3.y y;
    setf vec Types.Vector3.z z;
    vec

  let x vec = getf vec Types.Vector3.x

  let y vec = getf vec Types.Vector3.y

  let z vec = getf vec Types.Vector3.z

  let set_x vec x = setf vec Types.Vector3.x x

  let set_y vec y = setf vec Types.Vector3.y y

  let set_z vec z = setf vec Types.Vector3.z z
end

module Vector4 = struct
  type t = Types.Vector4.t structure

  let t = Types.Vector4.t

  let create x y z w =
    let vec = make t in
    setf vec Types.Vector4.x x;
    setf vec Types.Vector4.y y;
    setf vec Types.Vector4.z z;
    setf vec Types.Vector4.w w;
    vec

  let x vec = getf vec Types.Vector4.x

  let y vec = getf vec Types.Vector4.y

  let z vec = getf vec Types.Vector4.z

  let w vec = getf vec Types.Vector4.w

  let set_x vec x = setf vec Types.Vector4.x x

  let set_y vec y = setf vec Types.Vector4.y y

  let set_z vec z = setf vec Types.Vector4.z z

  let set_w vec w = setf vec Types.Vector4.w w
end

module Quaternion = Vector4

module Matrix = struct
  type t = Types.Matrix.t structure

  let t = Types.Matrix.t

  let create m0 m4 m8 m12 m1 m5 m9 m13 m2 m6 m10 m14 m3 m7 m11 m15 =
    let vec = make t in
    setf vec Types.Matrix.m0 m0;
    setf vec Types.Matrix.m1 m1;
    setf vec Types.Matrix.m2 m2;
    setf vec Types.Matrix.m3 m3;
    setf vec Types.Matrix.m4 m4;
    setf vec Types.Matrix.m5 m5;
    setf vec Types.Matrix.m6 m6;
    setf vec Types.Matrix.m7 m7;
    setf vec Types.Matrix.m8 m8;
    setf vec Types.Matrix.m9 m9;
    setf vec Types.Matrix.m10 m10;
    setf vec Types.Matrix.m11 m11;
    setf vec Types.Matrix.m12 m12;
    setf vec Types.Matrix.m13 m13;
    setf vec Types.Matrix.m14 m14;
    setf vec Types.Matrix.m15 m15;
    vec
end

module Color = struct
  type t = Types.Color.t structure

  let t = Types.Color.t

  let create r g b a =
    let color = make t in
    setf color Types.Color.r (Unsigned.UInt8.of_int r);
    setf color Types.Color.g (Unsigned.UInt8.of_int g);
    setf color Types.Color.b (Unsigned.UInt8.of_int b);
    setf color Types.Color.a (Unsigned.UInt8.of_int a);
    color

  (* Some Basic Colors *)
  let lightgray = create 200 200 200 255

  let gray = create 130 130 130 255

  let darkgray = create 80 80 80 255

  let yellow = create 253 249 0 255

  let gold = create 255 203 0 255

  let orange = create 255 161 0 255

  let pink = create 255 109 194 255

  let red = create 230 41 55 255

  let maroon = create 190 33 55 255

  let green = create 0 228 48 255

  let lime = create 0 158 47 255

  let darkgreen = create 0 117 44 255

  let skyblue = create 102 191 255 255

  let blue = create 0 121 241 255

  let darkblue = create 0 82 172 255

  let purple = create 200 122 255 255

  let violet = create 135 60 190 255

  let darkpurple = create 112 31 126 255

  let beige = create 211 176 131 255

  let brown = create 127 106 79 255

  let darkbrown = create 76 63 47 255

  let white = create 255 255 255 255

  let black = create 0 0 0 255

  let blank = create 0 0 0 0

  let magenta = create 255 0 255 255

  let raywhite = create 245 245 245 255
end

module Rectangle = struct
  type t = Types.Rectangle.t structure

  let t = Types.Rectangle.t

  let create x y width height =
    let rc = make t in
    setf rc Types.Rectangle.x x;
    setf rc Types.Rectangle.y y;
    setf rc Types.Rectangle.width width;
    setf rc Types.Rectangle.height height;
    rc

  let x rc = getf rc Types.Rectangle.x

  let y rc = getf rc Types.Rectangle.y

  let width rc = getf rc Types.Rectangle.width

  let height rc = getf rc Types.Rectangle.height

  let set_x rc x = setf rc Types.Rectangle.x x

  let set_y rc y = setf rc Types.Rectangle.y y

  let set_width rc width = setf rc Types.Rectangle.width width

  let set_height rc height = setf rc Types.Rectangle.height height
end

module Image = struct
  type t = Types.Image.t structure

  let width tex = getf tex Types.Texture2D.width

  let height tex = getf tex Types.Texture2D.height

  let mipmaps tex = getf tex Types.Texture2D.mipmaps

  let format tex = getf tex Types.Texture2D.format
end

module Texture2D = struct
  type t = Types.Texture2D.t structure

  let id tex = getf tex Types.Texture2D.id

  let width tex = getf tex Types.Texture2D.width

  let height tex = getf tex Types.Texture2D.height

  let mipmaps tex = getf tex Types.Texture2D.mipmaps

  let format tex = getf tex Types.Texture2D.format
end

module RenderTexture2D = struct
  type t = Types.RenderTexture2D.t structure

  let texture tex = getf tex Types.RenderTexture2D.texture

  let depth tex = getf tex Types.RenderTexture2D.depth

  let depth_texture tex = getf tex Types.RenderTexture2D.depth_texture
end

module NPatchInfo = struct
  type t = Types.NPatchInfo.t structure

  let t = Types.NPatchInfo.t

  let create rc left top right bottom typ =
    let np = make t in
    setf np Types.NPatchInfo.source_rec rc;
    setf np Types.NPatchInfo.left left;
    setf np Types.NPatchInfo.top top;
    setf np Types.NPatchInfo.right right;
    setf np Types.NPatchInfo.bottom bottom;
    setf np Types.NPatchInfo.typ typ;
    np

  let source_rec np = getf np Types.NPatchInfo.source_rec

  let left np = getf np Types.NPatchInfo.left

  let top np = getf np Types.NPatchInfo.top

  let right np = getf np Types.NPatchInfo.right

  let bottom np = getf np Types.NPatchInfo.bottom

  let typ np = getf np Types.NPatchInfo.typ
end

module CharInfo = struct
  type t = Types.CharInfo.t structure

  let value char_info = getf char_info Types.CharInfo.value

  let offset_x char_info = getf char_info Types.CharInfo.offset_x

  let offset_y char_info = getf char_info Types.CharInfo.offset_y

  let advance_x char_info = getf char_info Types.CharInfo.advance_x

  let image char_info = getf char_info Types.CharInfo.image
end

module Font = struct
  type t = Types.Font.t structure

  let base_size font = getf font Types.Font.base_size

  let chars_count font = getf font Types.Font.chars_count

  let texture font = getf font Types.Font.texture

  let recs font = getf font Types.Font.recs

  let chars font =
    CArray.from_ptr (getf font Types.Font.chars) (chars_count font)
end

module CameraType = Types.CameraType

module Camera3D = struct
  type t = Types.Camera3D.t structure

  let t = Types.Camera3D.t

  let create position target up fovy typ =
    let cam = make t in
    setf cam Types.Camera3D.position position;
    setf cam Types.Camera3D.target target;
    setf cam Types.Camera3D.up up;
    setf cam Types.Camera3D.fovy fovy;
    setf cam Types.Camera3D.typ typ;
    cam

  let position cam = getf cam Types.Camera3D.position

  let target cam = getf cam Types.Camera3D.target

  let up cam = getf cam Types.Camera3D.up

  let fovy cam = getf cam Types.Camera3D.fovy

  let typ cam = getf cam Types.Camera3D.typ
end

module Camera = Camera3D

module Camera2D = struct
  type t = Types.Camera2D.t structure

  let t = Types.Camera2D.t

  let create offset target rotation zoom =
    let cam = make t in
    setf cam Types.Camera2D.offset offset;
    setf cam Types.Camera2D.target target;
    setf cam Types.Camera2D.rotation rotation;
    setf cam Types.Camera2D.zoom zoom;
    cam

  let offset cam = getf cam Types.Camera2D.offset

  let target cam = getf cam Types.Camera2D.target

  let rotation cam = getf cam Types.Camera2D.rotation

  let zoom cam = getf cam Types.Camera2D.zoom

  let set_offset cam ofs = setf cam Types.Camera2D.offset ofs

  let set_target cam tgt = setf cam Types.Camera2D.target tgt

  let set_rotation cam rot = setf cam Types.Camera2D.rotation rot

  let set_zoom cam rot = setf cam Types.Camera2D.zoom rot
end

module Mesh = Types.Mesh

module Shader = struct
  type t = Types.Shader.t structure

  let t = Types.Shader.t
end

module MaterialMapType = Types.MaterialMapType

module MaterialMap = struct
  type t = Types.MaterialMap.t structure

  let t = Types.MaterialMap.t

  let create texture color value =
    let map = make t in
    setf map Types.MaterialMap.texture texture;
    setf map Types.MaterialMap.color color;
    setf map Types.MaterialMap.value value;
    map

  let texture map = getf map Types.MaterialMap.texture

  let color map = getf map Types.MaterialMap.color

  let value map = getf map Types.MaterialMap.value

  let set_texture map texture = setf map Types.MaterialMap.texture texture

  let set_color map color = setf map Types.MaterialMap.color color

  let set_value map value = setf map Types.MaterialMap.value value
end

module Material = struct
  type t = Types.Material.t structure

  let t = Types.Material.t

  let create shader maps params =
    let material = make t in
    setf material Types.Material.shader shader;
    setf material Types.Material.maps maps;
    setf material Types.Material.params params;
    material

  let shader material = getf material Types.Material.shader

  let maps material =
    CArray.from_ptr (getf material Types.Material.maps) max_material_maps

  let params material =
    CArray.from_ptr (getf material Types.Material.params) max_shader_locations

  let set_shader material shader = setf material Types.Material.shader shader

  let set_maps material maps =
    setf material Types.Material.maps (CArray.start maps)
end

module Transform = struct
  type t = Types.Transform.t structure

  let t = Types.Transform.t

  let create translation rotation scale =
    let transform = make t in
    setf transform Types.Transform.translation translation;
    setf transform Types.Transform.rotation rotation;
    setf transform Types.Transform.scale scale;
    transform

  let translation transform = getf transform Types.Transform.translation

  let rotation transform = getf transform Types.Transform.rotation

  let scale transform = getf transform Types.Transform.scale

  let set_translation transform translation =
    setf transform Types.Transform.translation translation

  let set_rotation transform rotation =
    setf transform Types.Transform.rotation rotation

  let set_scale transform scale = setf transform Types.Transform.scale scale
end

module BoneInfo = Types.BoneInfo

module Model = struct
  type t = Types.Model.t structure

  let t = Types.Model.t

  let transform model = getf model Types.Model.transform

  let meshes model =
    let count = getf model Types.Model.mesh_count in
    CArray.from_ptr (getf model Types.Model.meshes) count

  let materials model =
    let count = getf model Types.Model.material_count in
    CArray.from_ptr (getf model Types.Model.materials) count

  let bones model =
    let count = getf model Types.Model.bone_count in
    CArray.from_ptr (getf model Types.Model.bones) count

  let bind_pose model = getf model Types.Model.bind_pose

  let set_transform model transform = setf model Types.Model.transform transform

  let set_meshes model meshes =
    setf model Types.Model.meshes (CArray.start meshes)

  let set_materials model materials =
    setf model Types.Model.materials (CArray.start materials)

  let set_bones model bones = setf model Types.Model.bones (CArray.start bones)

  let set_bind_pose model bind_pose = setf model Types.Model.bind_pose bind_pose
end

module ModelAnimation = struct
  type t = Types.ModelAnimation.t structure

  let t = Types.Ray.t

  let bones anim =
    let count = getf anim Types.ModelAnimation.bone_count in
    CArray.from_ptr (getf anim Types.ModelAnimation.bones) count

  let bone_count anim = getf anim Types.ModelAnimation.bone_count

  let frame_count anim = getf anim Types.ModelAnimation.frame_count

  let frame_pose_at anim index =
    let poses =
      CArray.from_ptr
        (getf anim Types.ModelAnimation.frame_poses)
        (frame_count anim)
    in
    CArray.from_ptr (CArray.get poses index) (bone_count anim)
end

module Ray = struct
  type t = Types.Ray.t structure

  let t = Types.Ray.t

  let create position direction =
    let ray = make t in
    setf ray Types.Ray.position position;
    setf ray Types.Ray.direction direction;
    ray

  let position ray = getf ray Types.Ray.position

  let direction ray = getf ray Types.Ray.direction
end

module RayHitInfo = struct
  type t = Types.RayHitInfo.t structure

  let hit ray = getf ray Types.RayHitInfo.hit

  let distance ray = getf ray Types.RayHitInfo.distance

  let position ray = getf ray Types.RayHitInfo.position

  let normal ray = getf ray Types.RayHitInfo.normal
end

(* TODO *)
module BoundingBox = Types.BoundingBox
module Wave = Types.Wave
module AudioStream = Types.AudioStream
module Sound = Types.Sound
module Music = Types.Music
module ConfigFlag = Types.ConfigFlag

let load_model_animations path =
  let count = ptr_of_int 0 in
  let anims = _load_model_animations path count in
  CArray.from_ptr anims !@count

let get_dropped_files () =
  let count = ptr_of_int 0 in
  let files = _get_dropped_files count in
  CArray.from_ptr files !@count

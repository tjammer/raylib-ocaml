module Types = Raylib_functions.Types
module Math = Raylib_math.Description (Raylib_c.Raylib_c_generated_math)
open Raylib_generated_constants
open Ctypes_reexports
open Ctypes

module Vector2 = struct
  type t' = Types.Vector2.t

  type t = t' ctyp

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

  include Math.Vector2
end

module Vector3 = struct
  type t' = Types.Vector3.t

  type t = t' ctyp

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

  include Math.Vector3
end

module Vector4 = struct
  type t' = Types.Vector4.t

  type t = t' ctyp

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

  include Math.Vector4
end

module Matrix = struct
  type t' = Types.Matrix.t

  type t = t' ctyp

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

  include Math.Matrix
end

module Color = struct
  type t' = Types.Color.t

  type t = t' ctyp

  let t = Types.Color.t

  let create r g b a =
    let color = make t in
    setf color Types.Color.r (Unsigned.UChar.of_int r);
    setf color Types.Color.g (Unsigned.UChar.of_int g);
    setf color Types.Color.b (Unsigned.UChar.of_int b);
    setf color Types.Color.a (Unsigned.UChar.of_int a);
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
  type t' = Types.Rectangle.t

  type t = t' ctyp

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

module Texture = struct
  type t' = Types.Texture.t

  type t = t' ctyp

  let id tex = getf tex Types.Texture.id

  let width tex = getf tex Types.Texture.width

  let height tex = getf tex Types.Texture.height

  let mipmaps tex = getf tex Types.Texture.mipmaps

  let format tex = PixelFormat.of_int (getf tex Types.Texture.format)
end

module Texture2D = Texture

module Image = struct
  type t' = Types.Image.t

  type t = t' ctyp

  let width tex = getf tex Types.Texture.width

  let height tex = getf tex Types.Texture.height

  let mipmaps tex = getf tex Types.Texture.mipmaps

  let format tex = PixelFormat.of_int (getf tex Types.Texture.format)
end

module RenderTexture = struct
  type t' = Types.RenderTexture.t

  type t = t' ctyp

  let texture tex = getf tex Types.RenderTexture.texture

  let depth tex = getf tex Types.RenderTexture.depth
end

module RenderTexture2D = RenderTexture

module NPatchInfo = struct
  type t' = Types.NPatchInfo.t

  type t = t' ctyp

  let t = Types.NPatchInfo.t

  let create rc left top right bottom typ =
    let np = make t in
    setf np Types.NPatchInfo.source rc;
    setf np Types.NPatchInfo.left left;
    setf np Types.NPatchInfo.top top;
    setf np Types.NPatchInfo.right right;
    setf np Types.NPatchInfo.bottom bottom;
    setf np Types.NPatchInfo.typ (NPatchType.to_int typ);
    np

  let source np = getf np Types.NPatchInfo.source

  let left np = getf np Types.NPatchInfo.left

  let top np = getf np Types.NPatchInfo.top

  let right np = getf np Types.NPatchInfo.right

  let bottom np = getf np Types.NPatchInfo.bottom

  let typ np = NPatchType.of_int (getf np Types.NPatchInfo.typ)
end

module CharInfo = struct
  type t' = Types.CharInfo.t

  type t = t' ctyp

  let value char_info = getf char_info Types.CharInfo.value

  let offset_x char_info = getf char_info Types.CharInfo.offset_x

  let offset_y char_info = getf char_info Types.CharInfo.offset_y

  let advance_x char_info = getf char_info Types.CharInfo.advance_x

  let image char_info = getf char_info Types.CharInfo.image
end

module Font = struct
  type t' = Types.Font.t

  type t = t' ctyp

  let base_size font = getf font Types.Font.base_size

  let chars_count font = getf font Types.Font.chars_count

  let chars_padding font = getf font Types.Font.chars_padding

  let texture font = getf font Types.Font.texture

  let recs font = getf font Types.Font.recs

  let chars font =
    CArray.from_ptr (getf font Types.Font.chars) (chars_count font)
end

module Camera3D = struct
  type t' = Types.Camera3D.t

  type t = t' ctyp

  let t = Types.Camera3D.t

  let create position target up fovy typ =
    let cam = make t in
    setf cam Types.Camera3D.position position;
    setf cam Types.Camera3D.target target;
    setf cam Types.Camera3D.up up;
    setf cam Types.Camera3D.fovy fovy;
    setf cam Types.Camera3D.typ (CameraType.to_int typ);
    cam

  let position cam = getf cam Types.Camera3D.position

  let target cam = getf cam Types.Camera3D.target

  let up cam = getf cam Types.Camera3D.up

  let fovy cam = getf cam Types.Camera3D.fovy

  let typ cam = CameraType.of_int (getf cam Types.Camera3D.typ)
end

module Camera = Camera3D

module Camera2D = struct
  type t' = Types.Camera2D.t

  type t = t' ctyp

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

module Mesh = struct
  type t' = Types.Mesh.t

  type t = t' ctyp
end

module Shader = struct
  type t' = Types.Shader.t

  type t = t' ctyp

  let locs shader =
    CArray.from_ptr (getf shader Types.Shader.locs) max_shader_locations

  let set_loc shader loc_index loc =
    let locs = locs shader in
    CArray.set locs (ShaderLocationIndex.to_int loc_index) loc

  let set_locs shader locs = setf shader Types.Shader.locs (CArray.start locs)
end

module MaterialMap = struct
  type t' = Types.MaterialMap.t

  type t = t' ctyp

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
  type t' = Types.Material.t

  type t = t' ctyp

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
  type t' = Types.Transform.t

  type t = t' ctyp

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

module BoneInfo = struct
  type t' = Types.BoneInfo.t

  type t = t' ctyp
end

module Model = struct
  type t' = Types.Model.t

  type t = t' ctyp

  let transform model = getf model Types.Model.transform

  let meshes model =
    let count = getf model Types.Model.mesh_count in
    CArray.from_ptr (getf model Types.Model.meshes) count

  let materials model =
    CArray.from_ptr
      (getf model Types.Model.materials)
      (getf model Types.Model.material_count)

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
  type t' = Types.ModelAnimation.t

  type t = t' ctyp

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
  type t' = Types.Ray.t

  type t = t' ctyp

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
  type t' = Types.RayHitInfo.t

  type t = t' ctyp

  let hit ray = getf ray Types.RayHitInfo.hit

  let distance ray = getf ray Types.RayHitInfo.distance

  let position ray = getf ray Types.RayHitInfo.position

  let normal ray = getf ray Types.RayHitInfo.normal
end

module BoundingBox = struct
  type t' = Types.BoundingBox.t

  type t = t' ctyp

  let t = Types.BoundingBox.t

  let create min max =
    let bb = make t in
    setf bb Types.BoundingBox.min min;
    setf bb Types.BoundingBox.max max;
    bb

  let min bb = getf bb Types.BoundingBox.min

  let max bb = getf bb Types.BoundingBox.max

  let set_min bb v = setf bb Types.BoundingBox.min v

  let set_max bb v = setf bb Types.BoundingBox.max v
end

module Wave = struct
  type t' = Types.Wave.t

  type t = t' ctyp
end

module AudioStream = struct
  type t' = Types.AudioStream.t

  type t = t' ctyp
end

module Sound = struct
  type t' = Types.Sound.t

  type t = t' ctyp
end

module Music = struct
  type t' = Types.Music.t

  type t = t' ctyp
end

module VrDeviceInfo = struct
  type t' = Types.VrDeviceInfo.t

  type t = t' ctyp

  let t = Types.VrDeviceInfo.t

  let create () = make t

  let h_resolution hmd = getf hmd Types.VrDeviceInfo.h_resolution

  let v_resolution hmd = getf hmd Types.VrDeviceInfo.v_resolution

  let h_screen_size hmd = getf hmd Types.VrDeviceInfo.h_screen_size

  let v_screen_size hmd = getf hmd Types.VrDeviceInfo.v_screen_size

  let v_screen_center hmd = getf hmd Types.VrDeviceInfo.v_screen_center

  let eye_to_screen_distance hmd =
    getf hmd Types.VrDeviceInfo.eye_to_screen_distance

  let lens_separation_distance hmd =
    getf hmd Types.VrDeviceInfo.lens_separation_distance

  let interpupillary_distance hmd =
    getf hmd Types.VrDeviceInfo.interpupillary_distance

  let lens_distortion_values hmd =
    getf hmd Types.VrDeviceInfo.lens_distortion_values

  let chroma_ab_correction hmd =
    getf hmd Types.VrDeviceInfo.chroma_ab_correction

  let set_h_resolution hmd res = setf hmd Types.VrDeviceInfo.h_resolution res

  let set_v_resolution hmd res = setf hmd Types.VrDeviceInfo.v_resolution res

  let set_h_screen_size hmd size =
    setf hmd Types.VrDeviceInfo.h_screen_size size

  let set_v_screen_size hmd size =
    setf hmd Types.VrDeviceInfo.v_screen_size size

  let set_v_screen_center hmd center =
    setf hmd Types.VrDeviceInfo.v_screen_center center

  let set_eye_to_screen_distance hmd dist =
    setf hmd Types.VrDeviceInfo.eye_to_screen_distance dist

  let set_lens_separation_distance hmd dist =
    setf hmd Types.VrDeviceInfo.lens_separation_distance dist

  let set_interpupillary_distance hmd dist =
    setf hmd Types.VrDeviceInfo.interpupillary_distance dist

  let set_lens_distortion_values hmd v0 v1 v2 v3 =
    let arr = lens_distortion_values hmd in
    CArray.set arr 0 v0;
    CArray.set arr 1 v1;
    CArray.set arr 2 v2;
    CArray.set arr 3 v3

  let set_chroma_ab_correction hmd v0 v1 v2 v3 =
    let arr = chroma_ab_correction hmd in
    CArray.set arr 0 v0;
    CArray.set arr 1 v1;
    CArray.set arr 2 v2;
    CArray.set arr 3 v3
end

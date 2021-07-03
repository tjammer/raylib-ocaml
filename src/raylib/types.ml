module Types = Raylib_generated_types
module Math = Raylib_math.Description (Raylib_c.Raylib_c_generated_math)
open Constants
open Ctypes_reexports
open Ctypes

module Vector2 = struct
  type t' = Types.Vector2.t

  type t = t' ctyp

  let create x y =
    let t = Types.Vector2.t in
    let vector2 = make t in
    setf vector2 Types.Vector2.x x;
    setf vector2 Types.Vector2.y y;
    vector2

  let x vector2 = getf vector2 Types.Vector2.x

  let y vector2 = getf vector2 Types.Vector2.y

  let set_x vector2 x = setf vector2 Types.Vector2.x x

  let set_y vector2 y = setf vector2 Types.Vector2.y y

  include Math.Vector2
end

module Vector3 = struct
  type t' = Types.Vector3.t

  type t = t' ctyp

  let create x y z =
    let t = Types.Vector3.t in
    let vector3 = make t in
    setf vector3 Types.Vector3.x x;
    setf vector3 Types.Vector3.y y;
    setf vector3 Types.Vector3.z z;
    vector3

  let x vector3 = getf vector3 Types.Vector3.x

  let y vector3 = getf vector3 Types.Vector3.y

  let z vector3 = getf vector3 Types.Vector3.z

  let set_x vector3 x = setf vector3 Types.Vector3.x x

  let set_y vector3 y = setf vector3 Types.Vector3.y y

  let set_z vector3 z = setf vector3 Types.Vector3.z z

  include Math.Vector3
end

module Vector4 = struct
  type t' = Types.Vector4.t

  type t = t' ctyp

  let create x y z w =
    let t = Types.Vector4.t in
    let vector4 = make t in
    setf vector4 Types.Vector4.x x;
    setf vector4 Types.Vector4.y y;
    setf vector4 Types.Vector4.z z;
    setf vector4 Types.Vector4.w w;
    vector4

  let x vector4 = getf vector4 Types.Vector4.x

  let y vector4 = getf vector4 Types.Vector4.y

  let z vector4 = getf vector4 Types.Vector4.z

  let w vector4 = getf vector4 Types.Vector4.w

  let set_x vector4 x = setf vector4 Types.Vector4.x x

  let set_y vector4 y = setf vector4 Types.Vector4.y y

  let set_z vector4 z = setf vector4 Types.Vector4.z z

  let set_w vector4 w = setf vector4 Types.Vector4.w w

  include Math.Vector4
end

module Matrix = struct
  type t' = Types.Matrix.t

  type t = t' ctyp

  let create m0 m1 m2 m3 m4 m5 m6 m7 m8 m9 m10 m11 m12 m13 m14 m15 =
    let t = Types.Matrix.t in
    let matrix = make t in
    setf matrix Types.Matrix.m0 m0;
    setf matrix Types.Matrix.m1 m1;
    setf matrix Types.Matrix.m2 m2;
    setf matrix Types.Matrix.m3 m3;
    setf matrix Types.Matrix.m4 m4;
    setf matrix Types.Matrix.m5 m5;
    setf matrix Types.Matrix.m6 m6;
    setf matrix Types.Matrix.m7 m7;
    setf matrix Types.Matrix.m8 m8;
    setf matrix Types.Matrix.m9 m9;
    setf matrix Types.Matrix.m10 m10;
    setf matrix Types.Matrix.m11 m11;
    setf matrix Types.Matrix.m12 m12;
    setf matrix Types.Matrix.m13 m13;
    setf matrix Types.Matrix.m14 m14;
    setf matrix Types.Matrix.m15 m15;
    matrix

  let m0 matrix = getf matrix Types.Matrix.m0

  let m1 matrix = getf matrix Types.Matrix.m1

  let m2 matrix = getf matrix Types.Matrix.m2

  let m3 matrix = getf matrix Types.Matrix.m3

  let m4 matrix = getf matrix Types.Matrix.m4

  let m5 matrix = getf matrix Types.Matrix.m5

  let m6 matrix = getf matrix Types.Matrix.m6

  let m7 matrix = getf matrix Types.Matrix.m7

  let m8 matrix = getf matrix Types.Matrix.m8

  let m9 matrix = getf matrix Types.Matrix.m9

  let m10 matrix = getf matrix Types.Matrix.m10

  let m11 matrix = getf matrix Types.Matrix.m11

  let m12 matrix = getf matrix Types.Matrix.m12

  let m13 matrix = getf matrix Types.Matrix.m13

  let m14 matrix = getf matrix Types.Matrix.m14

  let m15 matrix = getf matrix Types.Matrix.m15

  let set_m0 matrix m0 = setf matrix Types.Matrix.m0 m0

  let set_m1 matrix m1 = setf matrix Types.Matrix.m1 m1

  let set_m2 matrix m2 = setf matrix Types.Matrix.m2 m2

  let set_m3 matrix m3 = setf matrix Types.Matrix.m3 m3

  let set_m4 matrix m4 = setf matrix Types.Matrix.m4 m4

  let set_m5 matrix m5 = setf matrix Types.Matrix.m5 m5

  let set_m6 matrix m6 = setf matrix Types.Matrix.m6 m6

  let set_m7 matrix m7 = setf matrix Types.Matrix.m7 m7

  let set_m8 matrix m8 = setf matrix Types.Matrix.m8 m8

  let set_m9 matrix m9 = setf matrix Types.Matrix.m9 m9

  let set_m10 matrix m10 = setf matrix Types.Matrix.m10 m10

  let set_m11 matrix m11 = setf matrix Types.Matrix.m11 m11

  let set_m12 matrix m12 = setf matrix Types.Matrix.m12 m12

  let set_m13 matrix m13 = setf matrix Types.Matrix.m13 m13

  let set_m14 matrix m14 = setf matrix Types.Matrix.m14 m14

  let set_m15 matrix m15 = setf matrix Types.Matrix.m15 m15

  include Math.Matrix
end

module Color = struct
  type t' = Types.Color.t

  type t = t' ctyp

  let create r g b a =
    let t = Types.Color.t in
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

  let create x y width height =
    let t = Types.Rectangle.t in
    let rectangle = make t in
    setf rectangle Types.Rectangle.x x;
    setf rectangle Types.Rectangle.y y;
    setf rectangle Types.Rectangle.width width;
    setf rectangle Types.Rectangle.height height;
    rectangle

  let x rectangle = getf rectangle Types.Rectangle.x

  let y rectangle = getf rectangle Types.Rectangle.y

  let width rectangle = getf rectangle Types.Rectangle.width

  let height rectangle = getf rectangle Types.Rectangle.height

  let set_x rectangle x = setf rectangle Types.Rectangle.x x

  let set_y rectangle y = setf rectangle Types.Rectangle.y y

  let set_width rectangle width = setf rectangle Types.Rectangle.width width

  let set_height rectangle height = setf rectangle Types.Rectangle.height height
end

module Image = struct
  type t' = Types.Image.t

  type t = t' ctyp

  let width image = getf image Types.Image.width

  let height image = getf image Types.Image.height

  let mipmaps image = getf image Types.Image.mipmaps

  let format image = getf image Types.Image.format |> PixelFormat.of_int
end

module Texture = struct
  type t' = Types.Texture.t

  type t = t' ctyp

  let width texture = getf texture Types.Texture.width

  let height texture = getf texture Types.Texture.height

  let mipmaps texture = getf texture Types.Texture.mipmaps

  let format texture = getf texture Types.Texture.format |> PixelFormat.of_int
end

module Texture2D = Texture

module RenderTexture = struct
  type t' = Types.RenderTexture.t

  type t = t' ctyp

  let texture rendertexture = getf rendertexture Types.RenderTexture.texture

  let depth rendertexture = getf rendertexture Types.RenderTexture.depth

  let set_texture rendertexture texture =
    setf rendertexture Types.RenderTexture.texture texture

  let set_depth rendertexture depth =
    setf rendertexture Types.RenderTexture.depth depth
end

module NPatchInfo = struct
  type t' = Types.NPatchInfo.t

  type t = t' ctyp

  let create source left top right bottom typ =
    let t = Types.NPatchInfo.t in
    let npatchinfo = make t in
    setf npatchinfo Types.NPatchInfo.source source;
    setf npatchinfo Types.NPatchInfo.left left;
    setf npatchinfo Types.NPatchInfo.top top;
    setf npatchinfo Types.NPatchInfo.right right;
    setf npatchinfo Types.NPatchInfo.bottom bottom;
    setf npatchinfo Types.NPatchInfo.typ (NPatchType.to_int typ);
    npatchinfo

  let source npatchinfo = getf npatchinfo Types.NPatchInfo.source

  let left npatchinfo = getf npatchinfo Types.NPatchInfo.left

  let top npatchinfo = getf npatchinfo Types.NPatchInfo.top

  let right npatchinfo = getf npatchinfo Types.NPatchInfo.right

  let bottom npatchinfo = getf npatchinfo Types.NPatchInfo.bottom

  let typ npatchinfo = getf npatchinfo Types.NPatchInfo.typ |> NPatchType.of_int

  let set_source npatchinfo source =
    setf npatchinfo Types.NPatchInfo.source source

  let set_left npatchinfo left = setf npatchinfo Types.NPatchInfo.left left

  let set_top npatchinfo top = setf npatchinfo Types.NPatchInfo.top top

  let set_right npatchinfo right = setf npatchinfo Types.NPatchInfo.right right

  let set_bottom npatchinfo bottom =
    setf npatchinfo Types.NPatchInfo.bottom bottom

  let set_typ npatchinfo typ =
    setf npatchinfo Types.NPatchInfo.typ (NPatchType.to_int typ)
end

module CharInfo = struct
  type t' = Types.CharInfo.t

  type t = t' ctyp

  let create value offset_x offset_y advance_x image =
    let t = Types.CharInfo.t in
    let charinfo = make t in
    setf charinfo Types.CharInfo.value value;
    setf charinfo Types.CharInfo.offset_x offset_x;
    setf charinfo Types.CharInfo.offset_y offset_y;
    setf charinfo Types.CharInfo.advance_x advance_x;
    setf charinfo Types.CharInfo.image image;
    charinfo

  let value charinfo = getf charinfo Types.CharInfo.value

  let offset_x charinfo = getf charinfo Types.CharInfo.offset_x

  let offset_y charinfo = getf charinfo Types.CharInfo.offset_y

  let advance_x charinfo = getf charinfo Types.CharInfo.advance_x

  let image charinfo = getf charinfo Types.CharInfo.image

  let set_value charinfo value = setf charinfo Types.CharInfo.value value

  let set_offset_x charinfo offset_x =
    setf charinfo Types.CharInfo.offset_x offset_x

  let set_offset_y charinfo offset_y =
    setf charinfo Types.CharInfo.offset_y offset_y

  let set_advance_x charinfo advance_x =
    setf charinfo Types.CharInfo.advance_x advance_x

  let set_image charinfo image = setf charinfo Types.CharInfo.image image
end

module Font = struct
  type t' = Types.Font.t

  type t = t' ctyp

  let base_size font = getf font Types.Font.base_size

  let chars_padding font = getf font Types.Font.chars_padding

  let texture font = getf font Types.Font.texture

  let recs font = getf font Types.Font.recs

  let chars font =
    let count = getf font Types.Font.chars_count in
    CArray.from_ptr (getf font Types.Font.chars) count

  let set_base_size font base_size = setf font Types.Font.base_size base_size

  let set_chars_padding font chars_padding =
    setf font Types.Font.chars_padding chars_padding

  let set_texture font texture = setf font Types.Font.texture texture

  let set_recs font recs = setf font Types.Font.recs recs

  let set_chars font chars = setf font Types.Font.chars (CArray.start chars)
end

module Camera3D = struct
  type t' = Types.Camera3D.t

  type t = t' ctyp

  let create position target up fovy typ =
    let t = Types.Camera3D.t in
    let camera3d = make t in
    setf camera3d Types.Camera3D.position position;
    setf camera3d Types.Camera3D.target target;
    setf camera3d Types.Camera3D.up up;
    setf camera3d Types.Camera3D.fovy fovy;
    setf camera3d Types.Camera3D.typ (CameraType.to_int typ);
    camera3d

  let position camera3d = getf camera3d Types.Camera3D.position

  let target camera3d = getf camera3d Types.Camera3D.target

  let up camera3d = getf camera3d Types.Camera3D.up

  let fovy camera3d = getf camera3d Types.Camera3D.fovy

  let typ camera3d = getf camera3d Types.Camera3D.typ |> CameraType.of_int

  let set_position camera3d position =
    setf camera3d Types.Camera3D.position position

  let set_target camera3d target = setf camera3d Types.Camera3D.target target

  let set_up camera3d up = setf camera3d Types.Camera3D.up up

  let set_fovy camera3d fovy = setf camera3d Types.Camera3D.fovy fovy

  let set_typ camera3d typ =
    setf camera3d Types.Camera3D.typ (CameraType.to_int typ)
end

module Camera = Camera3D

module Camera2D = struct
  type t' = Types.Camera2D.t

  type t = t' ctyp

  let create offset target rotation zoom =
    let t = Types.Camera2D.t in
    let camera2d = make t in
    setf camera2d Types.Camera2D.offset offset;
    setf camera2d Types.Camera2D.target target;
    setf camera2d Types.Camera2D.rotation rotation;
    setf camera2d Types.Camera2D.zoom zoom;
    camera2d

  let offset camera2d = getf camera2d Types.Camera2D.offset

  let target camera2d = getf camera2d Types.Camera2D.target

  let rotation camera2d = getf camera2d Types.Camera2D.rotation

  let zoom camera2d = getf camera2d Types.Camera2D.zoom

  let set_offset camera2d offset = setf camera2d Types.Camera2D.offset offset

  let set_target camera2d target = setf camera2d Types.Camera2D.target target

  let set_rotation camera2d rotation =
    setf camera2d Types.Camera2D.rotation rotation

  let set_zoom camera2d zoom = setf camera2d Types.Camera2D.zoom zoom
end

module Mesh = struct
  type t' = Types.Mesh.t

  type t = t' ctyp
end

module ShaderLoc = struct
  type t = int
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

  let create texture color value =
    let t = Types.MaterialMap.t in
    let materialmap = make t in
    setf materialmap Types.MaterialMap.texture texture;
    setf materialmap Types.MaterialMap.color color;
    setf materialmap Types.MaterialMap.value value;
    materialmap

  let texture materialmap = getf materialmap Types.MaterialMap.texture

  let color materialmap = getf materialmap Types.MaterialMap.color

  let value materialmap = getf materialmap Types.MaterialMap.value

  let set_texture materialmap texture =
    setf materialmap Types.MaterialMap.texture texture

  let set_color materialmap color =
    setf materialmap Types.MaterialMap.color color

  let set_value materialmap value =
    setf materialmap Types.MaterialMap.value value
end

module Material = struct
  type t' = Types.Material.t

  type t = t' ctyp

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

  let create translation rotation scale =
    let t = Types.Transform.t in
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

  let parent boneinfo = getf boneinfo Types.BoneInfo.parent

  let set_parent boneinfo parent = setf boneinfo Types.BoneInfo.parent parent
end

module Model = struct
  type t' = Types.Model.t

  type t = t' ctyp

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
  type t' = Types.ModelAnimation.t

  type t = t' ctyp

  let bones modelanimation =
    let count = getf modelanimation Types.ModelAnimation.bone_count in
    CArray.from_ptr (getf modelanimation Types.ModelAnimation.bones) count

  let frame_count modelanimation =
    getf modelanimation Types.ModelAnimation.frame_count

  let frame_poses_at anim index =
    let frame_count = getf anim Types.ModelAnimation.frame_count in
    let poses =
      CArray.from_ptr (getf anim Types.ModelAnimation.frame_poses) frame_count
    in
    let bone_count = getf anim Types.ModelAnimation.bone_count in
    CArray.from_ptr (CArray.get poses index) bone_count

  let set_bones modelanimation bones =
    setf modelanimation Types.ModelAnimation.bones (CArray.start bones)
end

module Ray = struct
  type t' = Types.Ray.t

  type t = t' ctyp

  let create position direction =
    let t = Types.Ray.t in
    let ray = make t in
    setf ray Types.Ray.position position;
    setf ray Types.Ray.direction direction;
    ray

  let position ray = getf ray Types.Ray.position

  let direction ray = getf ray Types.Ray.direction

  let set_position ray position = setf ray Types.Ray.position position

  let set_direction ray direction = setf ray Types.Ray.direction direction
end

module RayHitInfo = struct
  type t' = Types.RayHitInfo.t

  type t = t' ctyp

  let hit rayhitinfo = getf rayhitinfo Types.RayHitInfo.hit

  let distance rayhitinfo = getf rayhitinfo Types.RayHitInfo.distance

  let position rayhitinfo = getf rayhitinfo Types.RayHitInfo.position

  let normal rayhitinfo = getf rayhitinfo Types.RayHitInfo.normal
end

module BoundingBox = struct
  type t' = Types.BoundingBox.t

  type t = t' ctyp

  let create min max =
    let t = Types.BoundingBox.t in
    let boundingbox = make t in
    setf boundingbox Types.BoundingBox.min min;
    setf boundingbox Types.BoundingBox.max max;
    boundingbox

  let min boundingbox = getf boundingbox Types.BoundingBox.min

  let max boundingbox = getf boundingbox Types.BoundingBox.max

  let set_min boundingbox min = setf boundingbox Types.BoundingBox.min min

  let set_max boundingbox max = setf boundingbox Types.BoundingBox.max max
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

  let stream sound = getf sound Types.Sound.stream

  let set_stream sound stream = setf sound Types.Sound.stream stream
end

module Music = struct
  type t' = Types.Music.t

  type t = t' ctyp

  let stream music = getf music Types.Music.stream

  let looping music = getf music Types.Music.looping

  let ctx_type music = getf music Types.Music.ctx_type

  let set_stream music stream = setf music Types.Music.stream stream

  let set_looping music looping = setf music Types.Music.looping looping

  let set_ctx_type music ctx_type = setf music Types.Music.ctx_type ctx_type
end

module VrDeviceInfo = struct
  type t' = Types.VrDeviceInfo.t

  type t = t' ctyp

  let create () =
    let t = Types.VrDeviceInfo.t in
    make t

  let h_resolution vrdeviceinfo =
    getf vrdeviceinfo Types.VrDeviceInfo.h_resolution

  let v_resolution vrdeviceinfo =
    getf vrdeviceinfo Types.VrDeviceInfo.v_resolution

  let h_screen_size vrdeviceinfo =
    getf vrdeviceinfo Types.VrDeviceInfo.h_screen_size

  let v_screen_size vrdeviceinfo =
    getf vrdeviceinfo Types.VrDeviceInfo.v_screen_size

  let v_screen_center vrdeviceinfo =
    getf vrdeviceinfo Types.VrDeviceInfo.v_screen_center

  let eye_to_screen_distance vrdeviceinfo =
    getf vrdeviceinfo Types.VrDeviceInfo.eye_to_screen_distance

  let lens_separation_distance vrdeviceinfo =
    getf vrdeviceinfo Types.VrDeviceInfo.lens_separation_distance

  let interpupillary_distance vrdeviceinfo =
    getf vrdeviceinfo Types.VrDeviceInfo.interpupillary_distance

  let lens_distortion_values vrdeviceinfo =
    getf vrdeviceinfo Types.VrDeviceInfo.lens_distortion_values

  let chroma_ab_correction vrdeviceinfo =
    getf vrdeviceinfo Types.VrDeviceInfo.chroma_ab_correction

  let set_h_resolution vrdeviceinfo h_resolution =
    setf vrdeviceinfo Types.VrDeviceInfo.h_resolution h_resolution

  let set_v_resolution vrdeviceinfo v_resolution =
    setf vrdeviceinfo Types.VrDeviceInfo.v_resolution v_resolution

  let set_h_screen_size vrdeviceinfo h_screen_size =
    setf vrdeviceinfo Types.VrDeviceInfo.h_screen_size h_screen_size

  let set_v_screen_size vrdeviceinfo v_screen_size =
    setf vrdeviceinfo Types.VrDeviceInfo.v_screen_size v_screen_size

  let set_v_screen_center vrdeviceinfo v_screen_center =
    setf vrdeviceinfo Types.VrDeviceInfo.v_screen_center v_screen_center

  let set_eye_to_screen_distance vrdeviceinfo eye_to_screen_distance =
    setf vrdeviceinfo Types.VrDeviceInfo.eye_to_screen_distance
      eye_to_screen_distance

  let set_lens_separation_distance vrdeviceinfo lens_separation_distance =
    setf vrdeviceinfo Types.VrDeviceInfo.lens_separation_distance
      lens_separation_distance

  let set_interpupillary_distance vrdeviceinfo interpupillary_distance =
    setf vrdeviceinfo Types.VrDeviceInfo.interpupillary_distance
      interpupillary_distance

  let set_lens_distortion_values vrdeviceinfo v0 v1 v2 v3 =
    let arr = lens_distortion_values vrdeviceinfo in
    CArray.set arr 0 v0;
    CArray.set arr 1 v1;
    CArray.set arr 2 v2;
    CArray.set arr 3 v3

  let set_chroma_ab_correction vrdeviceinfo v0 v1 v2 v3 =
    let arr = chroma_ab_correction vrdeviceinfo in
    CArray.set arr 0 v0;
    CArray.set arr 1 v1;
    CArray.set arr 2 v2;
    CArray.set arr 3 v3
end

include Raylib_fixed_types
module Math = Raylib_math.Description (Raylib_c.Raylib_c_generated_math)
open Ctypes_reexports
open Ctypes

module Vector2 = struct
  type t' = Vector2.t
  type t = t' ctyp

  let t = Vector2.t

  let create x y =
    let vector2 = make t in
    setf vector2 Vector2.x x;
    setf vector2 Vector2.y y;
    vector2

  let x vector2 = getf vector2 Vector2.x
  let y vector2 = getf vector2 Vector2.y
  let set_x vector2 x = setf vector2 Vector2.x x
  let set_y vector2 y = setf vector2 Vector2.y y

  include Math.Vector2
end

module Vector3 = struct
  type t' = Vector3.t
  type t = t' ctyp

  let t = Vector3.t

  let create x y z =
    let vector3 = make t in
    setf vector3 Vector3.x x;
    setf vector3 Vector3.y y;
    setf vector3 Vector3.z z;
    vector3

  let x vector3 = getf vector3 Vector3.x
  let y vector3 = getf vector3 Vector3.y
  let z vector3 = getf vector3 Vector3.z
  let set_x vector3 x = setf vector3 Vector3.x x
  let set_y vector3 y = setf vector3 Vector3.y y
  let set_z vector3 z = setf vector3 Vector3.z z

  include Math.Vector3
end

module Vector4 = struct
  type t' = Vector4.t
  type t = t' ctyp

  let t = Vector4.t

  let create x y z w =
    let vector4 = make t in
    setf vector4 Vector4.x x;
    setf vector4 Vector4.y y;
    setf vector4 Vector4.z z;
    setf vector4 Vector4.w w;
    vector4

  let x vector4 = getf vector4 Vector4.x
  let y vector4 = getf vector4 Vector4.y
  let z vector4 = getf vector4 Vector4.z
  let w vector4 = getf vector4 Vector4.w
  let set_x vector4 x = setf vector4 Vector4.x x
  let set_y vector4 y = setf vector4 Vector4.y y
  let set_z vector4 z = setf vector4 Vector4.z z
  let set_w vector4 w = setf vector4 Vector4.w w

  include Math.Vector4
end

module Matrix = struct
  type t' = Matrix.t
  type t = t' ctyp

  let t = Matrix.t

  let create m0 m1 m2 m3 m4 m5 m6 m7 m8 m9 m10 m11 m12 m13 m14 m15 =
    let matrix = make t in
    setf matrix Matrix.m0 m0;
    setf matrix Matrix.m1 m1;
    setf matrix Matrix.m2 m2;
    setf matrix Matrix.m3 m3;
    setf matrix Matrix.m4 m4;
    setf matrix Matrix.m5 m5;
    setf matrix Matrix.m6 m6;
    setf matrix Matrix.m7 m7;
    setf matrix Matrix.m8 m8;
    setf matrix Matrix.m9 m9;
    setf matrix Matrix.m10 m10;
    setf matrix Matrix.m11 m11;
    setf matrix Matrix.m12 m12;
    setf matrix Matrix.m13 m13;
    setf matrix Matrix.m14 m14;
    setf matrix Matrix.m15 m15;
    matrix

  let m0 matrix = getf matrix Matrix.m0
  let m1 matrix = getf matrix Matrix.m1
  let m2 matrix = getf matrix Matrix.m2
  let m3 matrix = getf matrix Matrix.m3
  let m4 matrix = getf matrix Matrix.m4
  let m5 matrix = getf matrix Matrix.m5
  let m6 matrix = getf matrix Matrix.m6
  let m7 matrix = getf matrix Matrix.m7
  let m8 matrix = getf matrix Matrix.m8
  let m9 matrix = getf matrix Matrix.m9
  let m10 matrix = getf matrix Matrix.m10
  let m11 matrix = getf matrix Matrix.m11
  let m12 matrix = getf matrix Matrix.m12
  let m13 matrix = getf matrix Matrix.m13
  let m14 matrix = getf matrix Matrix.m14
  let m15 matrix = getf matrix Matrix.m15
  let set_m0 matrix m0 = setf matrix Matrix.m0 m0
  let set_m1 matrix m1 = setf matrix Matrix.m1 m1
  let set_m2 matrix m2 = setf matrix Matrix.m2 m2
  let set_m3 matrix m3 = setf matrix Matrix.m3 m3
  let set_m4 matrix m4 = setf matrix Matrix.m4 m4
  let set_m5 matrix m5 = setf matrix Matrix.m5 m5
  let set_m6 matrix m6 = setf matrix Matrix.m6 m6
  let set_m7 matrix m7 = setf matrix Matrix.m7 m7
  let set_m8 matrix m8 = setf matrix Matrix.m8 m8
  let set_m9 matrix m9 = setf matrix Matrix.m9 m9
  let set_m10 matrix m10 = setf matrix Matrix.m10 m10
  let set_m11 matrix m11 = setf matrix Matrix.m11 m11
  let set_m12 matrix m12 = setf matrix Matrix.m12 m12
  let set_m13 matrix m13 = setf matrix Matrix.m13 m13
  let set_m14 matrix m14 = setf matrix Matrix.m14 m14
  let set_m15 matrix m15 = setf matrix Matrix.m15 m15

  include Math.Matrix
end

module Color = struct
  type t' = Color.t
  type t = t' ctyp

  let t = Color.t
  let r t = getf t Color.r |> Unsigned.UChar.to_int
  let g t = getf t Color.g |> Unsigned.UChar.to_int
  let b t = getf t Color.b |> Unsigned.UChar.to_int
  let a t = getf t Color.a |> Unsigned.UChar.to_int

  let create r g b a =
    let color = make t in
    setf color Color.r (Unsigned.UChar.of_int r);
    setf color Color.g (Unsigned.UChar.of_int g);
    setf color Color.b (Unsigned.UChar.of_int b);
    setf color Color.a (Unsigned.UChar.of_int a);
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
  type t' = Rectangle.t
  type t = t' ctyp

  let t = Rectangle.t

  let create x y width height =
    let rectangle = make t in
    setf rectangle Rectangle.x x;
    setf rectangle Rectangle.y y;
    setf rectangle Rectangle.width width;
    setf rectangle Rectangle.height height;
    rectangle

  let x rectangle = getf rectangle Rectangle.x
  let y rectangle = getf rectangle Rectangle.y
  let width rectangle = getf rectangle Rectangle.width
  let height rectangle = getf rectangle Rectangle.height
  let set_x rectangle x = setf rectangle Rectangle.x x
  let set_y rectangle y = setf rectangle Rectangle.y y
  let set_width rectangle width = setf rectangle Rectangle.width width
  let set_height rectangle height = setf rectangle Rectangle.height height
end

module Image = struct
  type t' = Image.t
  type t = t' ctyp

  let t = Image.t
  let width image = getf image Image.width
  let height image = getf image Image.height
  let mipmaps image = getf image Image.mipmaps
  let format image = getf image Image.format |> PixelFormat.of_int
end

module Texture = struct
  type t' = Texture.t
  type t = t' ctyp

  let t = Texture.t
  let id texture = getf texture Texture.id
  let width texture = getf texture Texture.width
  let height texture = getf texture Texture.height
  let mipmaps texture = getf texture Texture.mipmaps
  let format texture = getf texture Texture.format |> PixelFormat.of_int
end

module Texture2D = Texture

module RenderTexture = struct
  type t' = RenderTexture.t
  type t = t' ctyp

  let t = RenderTexture.t
  let id rendertexture = getf rendertexture RenderTexture.id
  let texture rendertexture = getf rendertexture RenderTexture.texture
  let depth rendertexture = getf rendertexture RenderTexture.depth
  let set_id rendertexture id = setf rendertexture RenderTexture.id id

  let set_texture rendertexture texture =
    setf rendertexture RenderTexture.texture texture

  let set_depth rendertexture depth =
    setf rendertexture RenderTexture.depth depth
end

module NPatchInfo = struct
  type t' = NPatchInfo.t
  type t = t' ctyp

  let t = NPatchInfo.t

  let create source left top right bottom layout =
    let npatchinfo = make t in
    setf npatchinfo NPatchInfo.source source;
    setf npatchinfo NPatchInfo.left left;
    setf npatchinfo NPatchInfo.top top;
    setf npatchinfo NPatchInfo.right right;
    setf npatchinfo NPatchInfo.bottom bottom;
    setf npatchinfo NPatchInfo.layout (NPatchLayout.to_int layout);
    npatchinfo

  let source npatchinfo = getf npatchinfo NPatchInfo.source
  let left npatchinfo = getf npatchinfo NPatchInfo.left
  let top npatchinfo = getf npatchinfo NPatchInfo.top
  let right npatchinfo = getf npatchinfo NPatchInfo.right
  let bottom npatchinfo = getf npatchinfo NPatchInfo.bottom

  let layout npatchinfo =
    getf npatchinfo NPatchInfo.layout |> NPatchLayout.of_int

  let set_source npatchinfo source = setf npatchinfo NPatchInfo.source source
  let set_left npatchinfo left = setf npatchinfo NPatchInfo.left left
  let set_top npatchinfo top = setf npatchinfo NPatchInfo.top top
  let set_right npatchinfo right = setf npatchinfo NPatchInfo.right right
  let set_bottom npatchinfo bottom = setf npatchinfo NPatchInfo.bottom bottom

  let set_layout npatchinfo layout =
    setf npatchinfo NPatchInfo.layout (NPatchLayout.to_int layout)
end

module GlyphInfo = struct
  type t' = GlyphInfo.t
  type t = t' ctyp

  let t = GlyphInfo.t

  let create value offset_x offset_y advance_x image =
    let glyphinfo = make t in
    setf glyphinfo GlyphInfo.value value;
    setf glyphinfo GlyphInfo.offset_x offset_x;
    setf glyphinfo GlyphInfo.offset_y offset_y;
    setf glyphinfo GlyphInfo.advance_x advance_x;
    setf glyphinfo GlyphInfo.image image;
    glyphinfo

  let value glyphinfo = getf glyphinfo GlyphInfo.value
  let offset_x glyphinfo = getf glyphinfo GlyphInfo.offset_x
  let offset_y glyphinfo = getf glyphinfo GlyphInfo.offset_y
  let advance_x glyphinfo = getf glyphinfo GlyphInfo.advance_x
  let image glyphinfo = getf glyphinfo GlyphInfo.image
  let set_value glyphinfo value = setf glyphinfo GlyphInfo.value value

  let set_offset_x glyphinfo offset_x =
    setf glyphinfo GlyphInfo.offset_x offset_x

  let set_offset_y glyphinfo offset_y =
    setf glyphinfo GlyphInfo.offset_y offset_y

  let set_advance_x glyphinfo advance_x =
    setf glyphinfo GlyphInfo.advance_x advance_x

  let set_image glyphinfo image = setf glyphinfo GlyphInfo.image image
end

module Font = struct
  type t' = Font.t
  type t = t' ctyp

  let t = Font.t
  let base_size font = getf font Font.base_size
  let glyph_padding font = getf font Font.glyph_padding
  let texture font = getf font Font.texture
  let recs font = getf font Font.recs

  let glyphs font =
    let count = getf font Font.glyph_count in
    CArray.from_ptr (getf font Font.glyphs) count

  let set_base_size font base_size = setf font Font.base_size base_size

  let set_glyph_padding font glyph_padding =
    setf font Font.glyph_padding glyph_padding

  let set_texture font texture = setf font Font.texture texture
  let set_recs font recs = setf font Font.recs recs
  let set_glyphs font glyphs = setf font Font.glyphs (CArray.start glyphs)
end

module Camera3D = struct
  type t' = Camera3D.t
  type t = t' ctyp

  let t = Camera3D.t

  let create position target up fovy projection =
    let camera3d = make t in
    setf camera3d Camera3D.position position;
    setf camera3d Camera3D.target target;
    setf camera3d Camera3D.up up;
    setf camera3d Camera3D.fovy fovy;
    setf camera3d Camera3D.projection (CameraProjection.to_int projection);
    camera3d

  let position camera3d = getf camera3d Camera3D.position
  let target camera3d = getf camera3d Camera3D.target
  let up camera3d = getf camera3d Camera3D.up
  let fovy camera3d = getf camera3d Camera3D.fovy

  let projection camera3d =
    getf camera3d Camera3D.projection |> CameraProjection.of_int

  let set_position camera3d position = setf camera3d Camera3D.position position
  let set_target camera3d target = setf camera3d Camera3D.target target
  let set_up camera3d up = setf camera3d Camera3D.up up
  let set_fovy camera3d fovy = setf camera3d Camera3D.fovy fovy

  let set_projection camera3d projection =
    setf camera3d Camera3D.projection (CameraProjection.to_int projection)
end

module Camera = Camera3D

module Camera2D = struct
  type t' = Camera2D.t
  type t = t' ctyp

  let t = Camera2D.t

  let create offset target rotation zoom =
    let camera2d = make t in
    setf camera2d Camera2D.offset offset;
    setf camera2d Camera2D.target target;
    setf camera2d Camera2D.rotation rotation;
    setf camera2d Camera2D.zoom zoom;
    camera2d

  let offset camera2d = getf camera2d Camera2D.offset
  let target camera2d = getf camera2d Camera2D.target
  let rotation camera2d = getf camera2d Camera2D.rotation
  let zoom camera2d = getf camera2d Camera2D.zoom
  let set_offset camera2d offset = setf camera2d Camera2D.offset offset
  let set_target camera2d target = setf camera2d Camera2D.target target
  let set_rotation camera2d rotation = setf camera2d Camera2D.rotation rotation
  let set_zoom camera2d zoom = setf camera2d Camera2D.zoom zoom
end

module Mesh = struct
  type t' = Mesh.t
  type t = t' ctyp

  let t = Mesh.t

  let create () =
    let t = Mesh.t in
    make t

  let vertex_count mesh = getf mesh Mesh.vertex_count
  let triangle_count mesh = getf mesh Mesh.triangle_count

  let vertices mesh =
    CArray.from_ptr (getf mesh Mesh.vertices) (getf mesh Mesh.vertex_count * 3)

  let texcoords mesh =
    CArray.from_ptr (getf mesh Mesh.texcoords) (getf mesh Mesh.vertex_count * 2)

  let texcoords2 mesh =
    CArray.from_ptr (getf mesh Mesh.texcoords2) (getf mesh Mesh.vertex_count * 2)

  let normals mesh =
    CArray.from_ptr (getf mesh Mesh.normals) (getf mesh Mesh.vertex_count * 3)

  let tangents mesh =
    CArray.from_ptr (getf mesh Mesh.tangents) (getf mesh Mesh.vertex_count * 4)

  let colors mesh =
    CArray.from_ptr (getf mesh Mesh.colors) (getf mesh Mesh.vertex_count * 4)

  let indices mesh =
    CArray.from_ptr (getf mesh Mesh.indices) (getf mesh Mesh.vertex_count * 3)

  let anim_vertices mesh =
    CArray.from_ptr
      (getf mesh Mesh.anim_vertices)
      (getf mesh Mesh.vertex_count * 3)

  let anim_normals mesh =
    CArray.from_ptr
      (getf mesh Mesh.anim_normals)
      (getf mesh Mesh.vertex_count * 3)

  let bone_ids mesh =
    CArray.from_ptr (getf mesh Mesh.bone_ids) (getf mesh Mesh.vertex_count * 4)

  let bone_weights mesh =
    CArray.from_ptr
      (getf mesh Mesh.bone_weights)
      (getf mesh Mesh.vertex_count * 4)

  let set_vertex_count mesh vertex_count =
    setf mesh Mesh.vertex_count vertex_count

  let set_triangle_count mesh triangle_count =
    setf mesh Mesh.triangle_count triangle_count

  let set_vertices mesh vertices =
    setf mesh Mesh.vertices (CArray.start vertices)

  let set_texcoords mesh texcoords =
    setf mesh Mesh.texcoords (CArray.start texcoords)

  let set_texcoords2 mesh texcoords2 =
    setf mesh Mesh.texcoords2 (CArray.start texcoords2)

  let set_normals mesh normals = setf mesh Mesh.normals (CArray.start normals)

  let set_tangents mesh tangents =
    setf mesh Mesh.tangents (CArray.start tangents)

  let set_colors mesh colors = setf mesh Mesh.colors (CArray.start colors)
  let set_indices mesh indices = setf mesh Mesh.indices (CArray.start indices)

  let set_anim_vertices mesh anim_vertices =
    setf mesh Mesh.anim_vertices (CArray.start anim_vertices)

  let set_anim_normals mesh anim_normals =
    setf mesh Mesh.anim_normals (CArray.start anim_normals)

  let set_bone_ids mesh bone_ids =
    setf mesh Mesh.bone_ids (CArray.start bone_ids)

  let set_bone_weights mesh bone_weights =
    setf mesh Mesh.bone_weights (CArray.start bone_weights)
end

module ShaderLoc = struct
  type t = int
end

module Shader = struct
  type t' = Shader.t
  type t = t' ctyp

  let t = Shader.t

  let shader id locs =
    let shader = Ctypes.make Shader.t in
    Ctypes.setf shader Shader.id id;
    Ctypes.setf shader Shader.locs (Ctypes.CArray.start locs);
    shader

  let id shader = getf shader Shader.id

  let locs shader =
    CArray.from_ptr (getf shader Shader.locs) max_shader_locations

  let set_loc shader loc_index loc =
    let locs = locs shader in
    CArray.set locs (ShaderLocationIndex.to_int loc_index) loc

  let set_locs shader locs = setf shader Shader.locs (CArray.start locs)
end

module MaterialMap = struct
  type t' = MaterialMap.t
  type t = t' ctyp

  let t = MaterialMap.t

  let create texture color value =
    let materialmap = make t in
    setf materialmap MaterialMap.texture texture;
    setf materialmap MaterialMap.color color;
    setf materialmap MaterialMap.value value;
    materialmap

  let texture materialmap = getf materialmap MaterialMap.texture
  let color materialmap = getf materialmap MaterialMap.color
  let value materialmap = getf materialmap MaterialMap.value

  let set_texture materialmap texture =
    setf materialmap MaterialMap.texture texture

  let set_color materialmap color = setf materialmap MaterialMap.color color
  let set_value materialmap value = setf materialmap MaterialMap.value value
end

module Material = struct
  type t' = Material.t
  type t = t' ctyp

  let t = Material.t
  let shader material = getf material Material.shader

  let maps material =
    CArray.from_ptr (getf material Material.maps) max_material_maps

  let params material = getf material Material.params
  let set_shader material shader = setf material Material.shader shader
  let set_maps material maps = setf material Material.maps (CArray.start maps)

  let set_params material v0 v1 v2 v3 =
    let arr = params material in
    CArray.set arr 0 v0;
    CArray.set arr 1 v1;
    CArray.set arr 2 v2;
    CArray.set arr 3 v3
end

module Transform = struct
  type t' = Transform.t
  type t = t' ctyp

  let t = Transform.t

  let create translation rotation scale =
    let transform = make t in
    setf transform Transform.translation translation;
    setf transform Transform.rotation rotation;
    setf transform Transform.scale scale;
    transform

  let translation transform = getf transform Transform.translation
  let rotation transform = getf transform Transform.rotation
  let scale transform = getf transform Transform.scale

  let set_translation transform translation =
    setf transform Transform.translation translation

  let set_rotation transform rotation =
    setf transform Transform.rotation rotation

  let set_scale transform scale = setf transform Transform.scale scale
end

module BoneInfo = struct
  type t' = BoneInfo.t
  type t = t' ctyp

  let t = BoneInfo.t
  let parent boneinfo = getf boneinfo BoneInfo.parent
  let set_parent boneinfo parent = setf boneinfo BoneInfo.parent parent
end

module Model = struct
  type t' = Model.t
  type t = t' ctyp

  let t = Model.t
  let transform model = getf model Model.transform

  let meshes model =
    let count = getf model Model.mesh_count in
    CArray.from_ptr (getf model Model.meshes) count

  let materials model =
    let count = getf model Model.material_count in
    CArray.from_ptr (getf model Model.materials) count

  let bones model =
    let count = getf model Model.bone_count in
    CArray.from_ptr (getf model Model.bones) count

  let bind_pose model = getf model Model.bind_pose
  let set_transform model transform = setf model Model.transform transform
  let set_meshes model meshes = setf model Model.meshes (CArray.start meshes)

  let set_materials model materials =
    setf model Model.materials (CArray.start materials)

  let set_bones model bones = setf model Model.bones (CArray.start bones)
  let set_bind_pose model bind_pose = setf model Model.bind_pose bind_pose
end

module ModelAnimation = struct
  type t' = ModelAnimation.t
  type t = t' ctyp

  let t = ModelAnimation.t

  let bones modelanimation =
    let count = getf modelanimation ModelAnimation.bone_count in
    CArray.from_ptr (getf modelanimation ModelAnimation.bones) count

  let frame_count modelanimation =
    getf modelanimation ModelAnimation.frame_count

  let frame_poses_at anim index =
    let frame_count = getf anim ModelAnimation.frame_count in
    let poses =
      CArray.from_ptr (getf anim ModelAnimation.frame_poses) frame_count
    in
    let bone_count = getf anim ModelAnimation.bone_count in
    CArray.from_ptr (CArray.get poses index) bone_count

  let set_bones modelanimation bones =
    setf modelanimation ModelAnimation.bones (CArray.start bones)
end

module Ray = struct
  type t' = Ray.t
  type t = t' ctyp

  let t = Ray.t

  let create position direction =
    let ray = make t in
    setf ray Ray.position position;
    setf ray Ray.direction direction;
    ray

  let position ray = getf ray Ray.position
  let direction ray = getf ray Ray.direction
  let set_position ray position = setf ray Ray.position position
  let set_direction ray direction = setf ray Ray.direction direction
end

module RayCollision = struct
  type t' = RayCollision.t
  type t = t' ctyp

  let t = RayCollision.t
  let hit raycollision = getf raycollision RayCollision.hit
  let distance raycollision = getf raycollision RayCollision.distance
  let point raycollision = getf raycollision RayCollision.point
  let normal raycollision = getf raycollision RayCollision.normal
  let set_hit raycollision hit = setf raycollision RayCollision.hit hit

  let set_distance raycollision distance =
    setf raycollision RayCollision.distance distance

  let set_point raycollision point = setf raycollision RayCollision.point point

  let set_normal raycollision normal =
    setf raycollision RayCollision.normal normal
end

module BoundingBox = struct
  type t' = BoundingBox.t
  type t = t' ctyp

  let t = BoundingBox.t

  let create min max =
    let boundingbox = make t in
    setf boundingbox BoundingBox.min min;
    setf boundingbox BoundingBox.max max;
    boundingbox

  let min boundingbox = getf boundingbox BoundingBox.min
  let max boundingbox = getf boundingbox BoundingBox.max
  let set_min boundingbox min = setf boundingbox BoundingBox.min min
  let set_max boundingbox max = setf boundingbox BoundingBox.max max
end

module Wave = struct
  type t' = Wave.t
  type t = t' ctyp

  let t = Wave.t
  let frame_count sound = getf sound Wave.frame_count
  let sample_rate wave = getf wave Wave.sample_rate
  let sample_size wave = getf wave Wave.sample_size
  let channels wave = getf wave Wave.channels

  let set_frame_count sound frame_count =
    setf sound Wave.frame_count frame_count

  let set_sample_rate wave sample_rate = setf wave Wave.sample_rate sample_rate
  let set_sample_size wave sample_size = setf wave Wave.sample_size sample_size
  let set_channels wave channels = setf wave Wave.channels channels
end

module AudioStream = struct
  type t' = AudioStream.t
  type t = t' ctyp

  let t = AudioStream.t
  let sample_rate audiostream = getf audiostream AudioStream.sample_rate
  let sample_size audiostream = getf audiostream AudioStream.sample_size
  let channels audiostream = getf audiostream AudioStream.channels

  let set_sample_rate audiostream sample_rate =
    setf audiostream AudioStream.sample_rate sample_rate

  let set_sample_size audiostream sample_size =
    setf audiostream AudioStream.sample_size sample_size

  let set_channels audiostream channels =
    setf audiostream AudioStream.channels channels
end

module Sound = struct
  type t' = Sound.t
  type t = t' ctyp

  let t = Sound.t
  let stream sound = getf sound Sound.stream
  let frame_count sound = getf sound Sound.frame_count
  let set_stream sound stream = setf sound Sound.stream stream

  let set_frame_count sound frame_count =
    setf sound Sound.frame_count frame_count
end

module Music = struct
  type t' = Music.t
  type t = t' ctyp

  let t = Music.t
  let frame_count music = getf music Music.frame_count
  let stream music = getf music Music.stream
  let looping music = getf music Music.looping
  let ctx_type music = getf music Music.ctx_type

  let set_frame_count music frame_count =
    setf music Music.frame_count frame_count

  let set_stream music stream = setf music Music.stream stream
  let set_looping music looping = setf music Music.looping looping
  let set_ctx_type music ctx_type = setf music Music.ctx_type ctx_type
end

module VrDeviceInfo = struct
  type t' = VrDeviceInfo.t
  type t = t' ctyp

  let t = VrDeviceInfo.t
  let create () = make t
  let h_resolution vrdeviceinfo = getf vrdeviceinfo VrDeviceInfo.h_resolution
  let v_resolution vrdeviceinfo = getf vrdeviceinfo VrDeviceInfo.v_resolution
  let h_screen_size vrdeviceinfo = getf vrdeviceinfo VrDeviceInfo.h_screen_size
  let v_screen_size vrdeviceinfo = getf vrdeviceinfo VrDeviceInfo.v_screen_size

  let v_screen_center vrdeviceinfo =
    getf vrdeviceinfo VrDeviceInfo.v_screen_center

  let eye_to_screen_distance vrdeviceinfo =
    getf vrdeviceinfo VrDeviceInfo.eye_to_screen_distance

  let lens_separation_distance vrdeviceinfo =
    getf vrdeviceinfo VrDeviceInfo.lens_separation_distance

  let interpupillary_distance vrdeviceinfo =
    getf vrdeviceinfo VrDeviceInfo.interpupillary_distance

  let lens_distortion_values vrdeviceinfo =
    getf vrdeviceinfo VrDeviceInfo.lens_distortion_values

  let chroma_ab_correction vrdeviceinfo =
    getf vrdeviceinfo VrDeviceInfo.chroma_ab_correction

  let set_h_resolution vrdeviceinfo h_resolution =
    setf vrdeviceinfo VrDeviceInfo.h_resolution h_resolution

  let set_v_resolution vrdeviceinfo v_resolution =
    setf vrdeviceinfo VrDeviceInfo.v_resolution v_resolution

  let set_h_screen_size vrdeviceinfo h_screen_size =
    setf vrdeviceinfo VrDeviceInfo.h_screen_size h_screen_size

  let set_v_screen_size vrdeviceinfo v_screen_size =
    setf vrdeviceinfo VrDeviceInfo.v_screen_size v_screen_size

  let set_v_screen_center vrdeviceinfo v_screen_center =
    setf vrdeviceinfo VrDeviceInfo.v_screen_center v_screen_center

  let set_eye_to_screen_distance vrdeviceinfo eye_to_screen_distance =
    setf vrdeviceinfo VrDeviceInfo.eye_to_screen_distance eye_to_screen_distance

  let set_lens_separation_distance vrdeviceinfo lens_separation_distance =
    setf vrdeviceinfo VrDeviceInfo.lens_separation_distance
      lens_separation_distance

  let set_interpupillary_distance vrdeviceinfo interpupillary_distance =
    setf vrdeviceinfo VrDeviceInfo.interpupillary_distance
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

module VrStereoConfig = struct
  type t' = VrStereoConfig.t
  type t = t' ctyp

  let t = VrStereoConfig.t
  let projection vrstereoconfig = getf vrstereoconfig VrStereoConfig.projection

  let view_offset vrstereoconfig =
    getf vrstereoconfig VrStereoConfig.view_offset

  let left_lens_center vrstereoconfig =
    getf vrstereoconfig VrStereoConfig.left_lens_center

  let right_lens_center vrstereoconfig =
    getf vrstereoconfig VrStereoConfig.right_lens_center

  let left_screen_center vrstereoconfig =
    getf vrstereoconfig VrStereoConfig.left_screen_center

  let right_screen_center vrstereoconfig =
    getf vrstereoconfig VrStereoConfig.right_screen_center

  let scale vrstereoconfig = getf vrstereoconfig VrStereoConfig.scale
  let scale_in vrstereoconfig = getf vrstereoconfig VrStereoConfig.scale_in

  let set_projection vrstereoconfig v0 v1 =
    let arr = projection vrstereoconfig in
    CArray.set arr 0 v0;
    CArray.set arr 1 v1

  let set_view_offset vrstereoconfig v0 v1 =
    let arr = view_offset vrstereoconfig in
    CArray.set arr 0 v0;
    CArray.set arr 1 v1

  let set_left_lens_center vrstereoconfig v0 v1 =
    let arr = left_lens_center vrstereoconfig in
    CArray.set arr 0 v0;
    CArray.set arr 1 v1

  let set_right_lens_center vrstereoconfig v0 v1 =
    let arr = right_lens_center vrstereoconfig in
    CArray.set arr 0 v0;
    CArray.set arr 1 v1

  let set_left_screen_center vrstereoconfig v0 v1 =
    let arr = left_screen_center vrstereoconfig in
    CArray.set arr 0 v0;
    CArray.set arr 1 v1

  let set_right_screen_center vrstereoconfig v0 v1 =
    let arr = right_screen_center vrstereoconfig in
    CArray.set arr 0 v0;
    CArray.set arr 1 v1

  let set_scale vrstereoconfig v0 v1 =
    let arr = scale vrstereoconfig in
    CArray.set arr 0 v0;
    CArray.set arr 1 v1

  let set_scale_in vrstereoconfig v0 v1 =
    let arr = scale_in vrstereoconfig in
    CArray.set arr 0 v0;
    CArray.set arr 1 v1
end

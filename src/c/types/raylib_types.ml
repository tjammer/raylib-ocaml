let%c () = header "#include <raylib.h>"

module Vector2 = struct
  type%c t = {
    x : float;
    y : float;
  }
  [@@cname "Vector2"]
end

module Vector3 = struct
  type%c t = {
    x : float;
    y : float;
    z : float;
  }
  [@@cname "Vector3"]
end

module Vector4 = struct
  type%c t = {
    x : float;
    y : float;
    z : float;
    w : float;
  }
  [@@cname "Vector4"]
end

module Matrix = struct
  type%c t = {
    m0 : float;
    m1 : float;
    m2 : float;
    m3 : float;
    m4 : float;
    m5 : float;
    m6 : float;
    m7 : float;
    m8 : float;
    m9 : float;
    m10 : float;
    m11 : float;
    m12 : float;
    m13 : float;
    m14 : float;
    m15 : float;
  }
  [@@cname "Matrix"]
end

module Color = struct
  type%c t = {
    r : uchar;
    g : uchar;
    b : uchar;
    a : uchar;
  }
  [@@cname "Color"]
end

module Rectangle = struct
  type%c t = {
    x : float;
    y : float;
    width : float;
    height : float;
  }
  [@@cname "Rectangle"]
end

module Image = struct
  type%c t = {
    data : void ptr;
    width : int;
    height : int;
    mipmaps : int;
    format : int;
  }
  [@@cname "Image"]
end

module Texture = struct
  type%c t = {
    id : uint;
    width : int;
    height : int;
    mipmaps : int;
    format : int;
  }
  [@@cname "Texture"]
end

module RenderTexture = struct
  type%c t = {
    id : uint;
    texture : Texture.t;
    depth : Texture.t;
  }
  [@@cname "RenderTexture"]
end

module NPatchInfo = struct
  type%c t = {
    source : Rectangle.t;
    left : int;
    top : int;
    right : int;
    bottom : int;
    layout : int;
  }
  [@@cname "NPatchInfo"]
end

module GlyphInfo = struct
  type%c t = {
    value : int;
    offset_x : int; [@cname "offsetX"]
    offset_y : int; [@cname "offsetY"]
    advance_x : int; [@cname "advanceX"]
    image : Image.t;
  }
  [@@cname "GlyphInfo"]
end

module Font = struct
  type%c t = {
    base_size : int; [@cname "baseSize"]
    glyph_count : int; [@cname "glyphCount"]
    glyph_padding : int; [@cname "glyphPadding"]
    texture : Texture.t;
    recs : Rectangle.t ptr;
    glyphs : GlyphInfo.t ptr;
  }
  [@@cname "Font"]
end

module Camera3D = struct
  type%c t = {
    position : Vector3.t;
    target : Vector3.t;
    up : Vector3.t;
    fovy : float;
    projection : int;
  }
  [@@cname "Camera3D"]
end

module Camera2D = struct
  type%c t = {
    offset : Vector2.t;
    target : Vector2.t;
    rotation : float;
    zoom : float;
  }
  [@@cname "Camera2D"]
end

module Mesh = struct
  type%c t = {
    vertex_count : int; [@cname "vertexCount"]
    triangle_count : int; [@cname "triangleCount"]
    vertices : float ptr;
    texcoords : float ptr;
    texcoords2 : float ptr;
    normals : float ptr;
    tangents : float ptr;
    colors : uchar ptr;
    indices : ushort ptr;
    anim_vertices : float ptr; [@cname "animVertices"]
    anim_normals : float ptr; [@cname "animNormals"]
    bone_ids : int ptr; [@cname "boneIds"]
    bone_weights : float ptr; [@cname "boneWeights"]
    vao_id : uint; [@cname "vaoId"]
    vbo_id : uint ptr; [@cname "vboId"]
  }
  [@@cname "Mesh"]
end

module Shader = struct
  type%c t = {
    id : uint;
    locs : int ptr;
  }
  [@@cname "Shader"]
end

module MaterialMap = struct
  type%c t = {
    texture : Texture.t;
    color : Color.t;
    value : float;
  }
  [@@cname "MaterialMap"]
end

module Material = struct
  let%c float_array_4 = array 4 float

  type%c t = {
    shader : Shader.t;
    maps : MaterialMap.t ptr;
    params : float_array_4;
  }
  [@@cname "Material"]
end

module Transform = struct
  type%c t = {
    translation : Vector3.t;
    rotation : Vector4.t;
    scale : Vector3.t;
  }
  [@@cname "Transform"]
end

module BoneInfo = struct
  let%c char_array_32 = array 32 char

  type%c t = {
    name : char_array_32;
    parent : int;
  }
  [@@cname "BoneInfo"]
end

module Model = struct
  type%c t = {
    transform : Matrix.t;
    mesh_count : int; [@cname "meshCount"]
    material_count : int; [@cname "materialCount"]
    meshes : Mesh.t ptr;
    materials : Material.t ptr;
    mesh_material : int ptr; [@cname "meshMaterial"]
    bone_count : int; [@cname "boneCount"]
    bones : BoneInfo.t ptr;
    bind_pose : Transform.t ptr; [@cname "bindPose"]
  }
  [@@cname "Model"]
end

module ModelAnimation = struct
  type%c t = {
    bone_count : int; [@cname "boneCount"]
    frame_count : int; [@cname "frameCount"]
    bones : BoneInfo.t ptr;
    frame_poses : Transform.t ptr ptr; [@cname "framePoses"]
  }
  [@@cname "ModelAnimation"]
end

module Ray = struct
  type%c t = {
    position : Vector3.t;
    direction : Vector3.t;
  }
  [@@cname "Ray"]
end

module RayCollision = struct
  type%c t = {
    hit : bool;
    distance : float;
    point : Vector3.t;
    normal : Vector3.t;
  }
  [@@cname "RayCollision"]
end

module BoundingBox = struct
  type%c t = {
    min : Vector3.t;
    max : Vector3.t;
  }
  [@@cname "BoundingBox"]
end

module Wave = struct
  type%c t = {
    frame_count : uint; [@cname "frameCount"]
    sample_rate : uint; [@cname "sampleRate"]
    sample_size : uint; [@cname "sampleSize"]
    channels : uint;
    data : void ptr;
  }
  [@@cname "Wave"]
end

module AudioStream = struct
  let%c r_audio_buffer = structure "rAudioBuffer"

  type%c t = {
    buffer : r_audio_buffer ptr;
    sample_rate : uint; [@cname "sampleRate"]
    sample_size : uint; [@cname "sampleSize"]
    channels : uint;
  }
  [@@cname "AudioStream"]
end

module Sound = struct
  type%c t = {
    stream : AudioStream.t;
    frame_count : uint; [@cname "frameCount"]
  }
  [@@cname "Sound"]
end

module Music = struct
  type%c t = {
    stream : AudioStream.t;
    frame_count : uint; [@cname "frameCount"]
    looping : bool;
    ctx_type : int; [@cname "ctxType"]
    ctx_data : void ptr; [@cname "ctxData"]
  }
  [@@cname "Music"]
end

module VrDeviceInfo = struct
  let%c float_array_4 = array 4 float

  type%c t = {
    h_resolution : int; [@cname "hResolution"]
    v_resolution : int; [@cname "vResolution"]
    h_screen_size : float; [@cname "hScreenSize"]
    v_screen_size : float; [@cname "vScreenSize"]
    v_screen_center : float; [@cname "vScreenCenter"]
    eye_to_screen_distance : float; [@cname "eyeToScreenDistance"]
    lens_separation_distance : float; [@cname "lensSeparationDistance"]
    interpupillary_distance : float; [@cname "interpupillaryDistance"]
    lens_distortion_values : float_array_4; [@cname "lensDistortionValues"]
    chroma_ab_correction : float_array_4; [@cname "chromaAbCorrection"]
  }
  [@@cname "VrDeviceInfo"]
end

module VrStereoConfig = struct
  let%c matrix_array_2 = array 2 Matrix.t

  let%c float_array_2 = array 2 float

  type%c t = {
    projection : matrix_array_2;
    view_offset : matrix_array_2; [@cname "viewOffset"]
    left_lens_center : float_array_2; [@cname "leftLensCenter"]
    right_lens_center : float_array_2; [@cname "rightLensCenter"]
    left_screen_center : float_array_2; [@cname "leftScreenCenter"]
    right_screen_center : float_array_2; [@cname "rightScreenCenter"]
    scale : float_array_2;
    scale_in : float_array_2; [@cname "scaleIn"]
  }
  [@@cname "VrStereoConfig"]
end

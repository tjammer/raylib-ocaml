open Ctypes

module Functions (F : Ctypes.FOREIGN) = struct
  open F
  open Raylib_core

  let load_image = foreign "LoadImage" (string @-> returning Image.t)

  let load_image_raw =
    foreign "LoadImageRaw"
      (string @-> int @-> int @-> PixelFormat.t @-> int @-> returning Image.t)

  let load_image_anim =
    foreign "LoadImageAnim" (string @-> ptr int @-> returning Image.t)

  let load_image_anim_from_memory =
    foreign "LoadImageAnimFromMemory"
      (string @-> string @-> int @-> ptr int @-> returning Image.t)

  let load_image_from_memory =
    foreign "LoadImageFromMemory"
      (string @-> string @-> int @-> returning Image.t)

  let load_image_from_texture =
    foreign "LoadImageFromTexture" (Texture.t @-> returning Image.t)

  let load_image_from_screen =
    foreign "LoadImageFromScreen" (void @-> returning Image.t)

  let is_image_valid = foreign "IsImageValid" (Image.t @-> returning bool)
  let unload_image = foreign "UnloadImage" (Image.t @-> returning void)

  let export_image =
    foreign "ExportImage" (Image.t @-> string @-> returning bool)

  let export_image_to_memory =
    foreign "ExportImageToMemory"
      (Image.t @-> string @-> ptr int @-> returning string)

  let export_image_as_code =
    foreign "ExportImageAsCode" (Image.t @-> string @-> returning bool)

  let gen_image_color =
    foreign "GenImageColor" (int @-> int @-> Color.t @-> returning Image.t)

  let gen_image_gradient_linear =
    foreign "GenImageGradientLinear"
      (int @-> int @-> int @-> Color.t @-> Color.t @-> returning Image.t)

  let gen_image_gradient_radial =
    foreign "GenImageGradientRadial"
      (int @-> int @-> float @-> Color.t @-> Color.t @-> returning Image.t)

  let gen_image_gradient_square =
    foreign "GenImageGradientSquare"
      (int @-> int @-> float @-> Color.t @-> Color.t @-> returning Image.t)

  let gen_image_checked =
    foreign "GenImageChecked"
      (int @-> int @-> int @-> int @-> Color.t @-> Color.t @-> returning Image.t)

  let gen_image_white_noise =
    foreign "GenImageWhiteNoise" (int @-> int @-> float @-> returning Image.t)

  let gen_image_perlin_noise =
    foreign "GenImagePerlinNoise"
      (int @-> int @-> int @-> int @-> float @-> returning Image.t)

  let gen_image_cellular =
    foreign "GenImageCellular" (int @-> int @-> int @-> returning Image.t)

  let gen_image_text =
    foreign "GenImageText" (int @-> int @-> string @-> returning Image.t)

  let image_copy = foreign "ImageCopy" (Image.t @-> returning Image.t)

  let image_from_image =
    foreign "ImageFromImage" (Image.t @-> Rectangle.t @-> returning Image.t)

  let image_from_channel =
    foreign "ImageFromChannel" (Image.t @-> int @-> returning Image.t)

  let image_text =
    foreign "ImageText" (string @-> int @-> Color.t @-> returning Image.t)

  let image_text_ex =
    foreign "ImageTextEx"
      (Font.t @-> string @-> float @-> float @-> Color.t @-> returning Image.t)

  let image_format =
    foreign "ImageFormat" (ptr Image.t @-> PixelFormat.t @-> returning void)

  let image_to_pot =
    foreign "ImageToPOT" (ptr Image.t @-> Color.t @-> returning void)

  let image_crop =
    foreign "ImageCrop" (ptr Image.t @-> Rectangle.t @-> returning void)

  let image_alpha_crop =
    foreign "ImageAlphaCrop" (ptr Image.t @-> float @-> returning void)

  let image_alpha_clear =
    foreign "ImageAlphaClear"
      (ptr Image.t @-> Color.t @-> float @-> returning void)

  let image_alpha_mask =
    foreign "ImageAlphaMask" (ptr Image.t @-> Image.t @-> returning void)

  let image_alpha_premultiply =
    foreign "ImageAlphaPremultiply" (ptr Image.t @-> returning void)

  let image_blur_gaussian =
    foreign "ImageBlurGaussian" (ptr Image.t @-> int @-> returning void)

  let image_kernel_convolution =
    foreign "ImageKernelConvolution"
      (ptr Image.t @-> ptr float @-> int @-> returning void)

  let image_resize =
    foreign "ImageResize" (ptr Image.t @-> int @-> int @-> returning void)

  let image_resize_nn =
    foreign "ImageResizeNN" (ptr Image.t @-> int @-> int @-> returning void)

  let image_resize_canvas =
    foreign "ImageResizeCanvas"
      (ptr Image.t @-> int @-> int @-> int @-> int @-> Color.t
     @-> returning void)

  let image_mipmaps = foreign "ImageMipmaps" (ptr Image.t @-> returning void)

  let image_dither =
    foreign "ImageDither"
      (ptr Image.t @-> int @-> int @-> int @-> int @-> returning void)

  let image_flip_vertical =
    foreign "ImageFlipVertical" (ptr Image.t @-> returning void)

  let image_flip_horizontal =
    foreign "ImageFlipHorizontal" (ptr Image.t @-> returning void)

  let image_rotate =
    foreign "ImageRotate" (ptr Image.t @-> int @-> returning void)

  let image_rotate_cw = foreign "ImageRotateCW" (ptr Image.t @-> returning void)

  let image_rotate_ccw =
    foreign "ImageRotateCCW" (ptr Image.t @-> returning void)

  let image_color_tint =
    foreign "ImageColorTint" (ptr Image.t @-> Color.t @-> returning void)

  let image_color_invert =
    foreign "ImageColorInvert" (ptr Image.t @-> returning void)

  let image_color_grayscale =
    foreign "ImageColorGrayscale" (ptr Image.t @-> returning void)

  let image_color_contrast =
    foreign "ImageColorContrast" (ptr Image.t @-> float @-> returning void)

  let image_color_brightness =
    foreign "ImageColorBrightness" (ptr Image.t @-> int @-> returning void)

  let image_color_replace =
    foreign "ImageColorReplace"
      (ptr Image.t @-> Color.t @-> Color.t @-> returning void)

  let load_image_colors =
    foreign "LoadImageColors" (Image.t @-> returning (ptr Color.t))

  let load_image_palette =
    foreign "LoadImagePalette"
      (Image.t @-> int @-> ptr int @-> returning (ptr Color.t))

  let unload_image_colors =
    foreign "UnloadImageColors" (ptr Color.t @-> returning void)

  let unload_image_palette =
    foreign "UnloadImagePalette" (ptr Color.t @-> returning void)

  let get_image_alpha_border =
    foreign "GetImageAlphaBorder" (Image.t @-> float @-> returning Rectangle.t)

  let get_image_color =
    foreign "GetImageColor" (Image.t @-> int @-> int @-> returning Color.t)

  let image_clear_background =
    foreign "ImageClearBackground" (ptr Image.t @-> Color.t @-> returning void)

  let image_draw_pixel =
    foreign "ImageDrawPixel"
      (ptr Image.t @-> int @-> int @-> Color.t @-> returning void)

  let image_draw_pixel_v =
    foreign "ImageDrawPixelV"
      (ptr Image.t @-> Vector2.t @-> Color.t @-> returning void)

  let image_draw_line =
    foreign "ImageDrawLine"
      (ptr Image.t @-> int @-> int @-> int @-> int @-> Color.t
     @-> returning void)

  let image_draw_line_v =
    foreign "ImageDrawLineV"
      (ptr Image.t @-> Vector2.t @-> Vector2.t @-> Color.t @-> returning void)

  let image_draw_line_ex =
    foreign "ImageDrawLineEx"
      (ptr Image.t @-> Vector2.t @-> Vector2.t @-> int @-> Color.t
     @-> returning void)

  let image_draw_circle =
    foreign "ImageDrawCircle"
      (ptr Image.t @-> int @-> int @-> int @-> Color.t @-> returning void)

  let image_draw_circle_v =
    foreign "ImageDrawCircleV"
      (ptr Image.t @-> Vector2.t @-> int @-> Color.t @-> returning void)

  let image_draw_circle_lines =
    foreign "ImageDrawCircleLines"
      (ptr Image.t @-> int @-> int @-> int @-> Color.t @-> returning void)

  let image_draw_circle_lines_v =
    foreign "ImageDrawCircleLinesV"
      (ptr Image.t @-> Vector2.t @-> int @-> Color.t @-> returning void)

  let image_draw_rectangle =
    foreign "ImageDrawRectangle"
      (ptr Image.t @-> int @-> int @-> int @-> int @-> Color.t
     @-> returning void)

  let image_draw_rectangle_v =
    foreign "ImageDrawRectangleV"
      (ptr Image.t @-> Vector2.t @-> Vector2.t @-> Color.t @-> returning void)

  let image_draw_rectangle_rec =
    foreign "ImageDrawRectangleRec"
      (ptr Image.t @-> Rectangle.t @-> Color.t @-> returning void)

  let image_draw_rectangle_lines =
    foreign "ImageDrawRectangleLines"
      (ptr Image.t @-> Rectangle.t @-> int @-> Color.t @-> returning void)

  let image_draw_triangle =
    foreign "ImageDrawTriangle"
      (ptr Image.t @-> Vector2.t @-> Vector2.t @-> Vector2.t @-> Color.t
     @-> returning void)

  let image_draw_triangle_ex =
    foreign "ImageDrawTriangleEx"
      (ptr Image.t @-> Vector2.t @-> Vector2.t @-> Vector2.t @-> Color.t
     @-> Color.t @-> Color.t @-> returning void)

  let image_draw_triangle_lines =
    foreign "ImageDrawTriangleLines"
      (ptr Image.t @-> Vector2.t @-> Vector2.t @-> Vector2.t @-> Color.t
     @-> returning void)

  let image_draw_triangle_fan =
    foreign "ImageDrawTriangleFan"
      (ptr Image.t @-> ptr Vector2.t @-> int @-> Color.t @-> returning void)

  let image_draw_triangle_strip =
    foreign "ImageDrawTriangleStrip"
      (ptr Image.t @-> ptr Vector2.t @-> int @-> Color.t @-> returning void)

  let image_draw =
    foreign "ImageDraw"
      (ptr Image.t @-> Image.t @-> Rectangle.t @-> Rectangle.t @-> Color.t
     @-> returning void)

  let image_draw_text =
    foreign "ImageDrawText"
      (ptr Image.t @-> string @-> int @-> int @-> int @-> Color.t
     @-> returning void)

  let image_draw_text_ex =
    foreign "ImageDrawTextEx"
      (ptr Image.t @-> Font.t @-> string @-> Vector2.t @-> float @-> float
     @-> Color.t @-> returning void)

  let load_texture = foreign "LoadTexture" (string @-> returning Texture.t)

  let load_texture_from_image =
    foreign "LoadTextureFromImage" (Image.t @-> returning Texture.t)

  let load_texture_cubemap =
    foreign "LoadTextureCubemap"
      (Image.t @-> CubemapLayout.t @-> returning Texture.t)

  let load_render_texture =
    foreign "LoadRenderTexture" (int @-> int @-> returning RenderTexture.t)

  let is_texture_valid = foreign "IsTextureValid" (Texture.t @-> returning bool)
  let unload_texture = foreign "UnloadTexture" (Texture.t @-> returning void)

  let is_render_texture_valid =
    foreign "IsRenderTextureValid" (RenderTexture.t @-> returning bool)

  let unload_render_texture =
    foreign "UnloadRenderTexture" (RenderTexture.t @-> returning void)

  let update_texture =
    foreign "UpdateTexture" (Texture.t @-> ptr void @-> returning void)

  let update_texture_rec =
    foreign "UpdateTextureRec"
      (Texture.t @-> Rectangle.t @-> ptr void @-> returning void)

  let gen_texture_mipmaps =
    foreign "GenTextureMipmaps" (ptr Texture.t @-> returning void)

  let set_texture_filter =
    foreign "SetTextureFilter" (Texture.t @-> TextureFilter.t @-> returning void)

  let set_texture_wrap =
    foreign "SetTextureWrap" (Texture.t @-> TextureWrap.t @-> returning void)

  let draw_texture =
    foreign "DrawTexture"
      (Texture.t @-> int @-> int @-> Color.t @-> returning void)

  let draw_texture_v =
    foreign "DrawTextureV"
      (Texture.t @-> Vector2.t @-> Color.t @-> returning void)

  let draw_texture_ex =
    foreign "DrawTextureEx"
      (Texture.t @-> Vector2.t @-> float @-> float @-> Color.t
     @-> returning void)

  let draw_texture_rec =
    foreign "DrawTextureRec"
      (Texture.t @-> Rectangle.t @-> Vector2.t @-> Color.t @-> returning void)

  let draw_texture_pro =
    foreign "DrawTexturePro"
      (Texture.t @-> Rectangle.t @-> Rectangle.t @-> Vector2.t @-> float
     @-> Color.t @-> returning void)

  let draw_texture_npatch =
    foreign "DrawTextureNPatch"
      (Texture.t @-> NPatchInfo.t @-> Rectangle.t @-> Vector2.t @-> float
     @-> Color.t @-> returning void)

  let color_is_equal =
    foreign "ColorIsEqual" (Color.t @-> Color.t @-> returning bool)

  let fade = foreign "Fade" (Color.t @-> float @-> returning Color.t)
  let color_to_int = foreign "ColorToInt" (Color.t @-> returning int)

  let color_normalize =
    foreign "ColorNormalize" (Color.t @-> returning Vector4.t)

  let color_from_normalized =
    foreign "ColorFromNormalized" (Vector4.t @-> returning Color.t)

  let color_to_hsv = foreign "ColorToHSV" (Color.t @-> returning Vector3.t)

  let color_from_hsv =
    foreign "ColorFromHSV" (float @-> float @-> float @-> returning Color.t)

  let color_tint =
    foreign "ColorTint" (Color.t @-> Color.t @-> returning Color.t)

  let color_brightness =
    foreign "ColorBrightness" (Color.t @-> float @-> returning Color.t)

  let color_contrast =
    foreign "ColorContrast" (Color.t @-> float @-> returning Color.t)

  let color_alpha =
    foreign "ColorAlpha" (Color.t @-> float @-> returning Color.t)

  let color_alpha_blend =
    foreign "ColorAlphaBlend"
      (Color.t @-> Color.t @-> Color.t @-> returning Color.t)

  let color_lerp =
    foreign "ColorLerp" (Color.t @-> Color.t @-> float @-> returning Color.t)

  let get_color = foreign "GetColor" (int @-> returning Color.t)

  let get_pixel_color =
    foreign "GetPixelColor" (ptr void @-> PixelFormat.t @-> returning Color.t)

  let set_pixel_color =
    foreign "SetPixelColor"
      (ptr void @-> Color.t @-> PixelFormat.t @-> returning void)

  let get_pixel_data_size =
    foreign "GetPixelDataSize" (int @-> int @-> PixelFormat.t @-> returning int)
end

module Types (F : Ctypes.TYPE) = struct end

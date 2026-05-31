open Ctypes

module Functions (F : Ctypes.FOREIGN) = struct
  open F
  open Raylib_core

  let set_shapes_texture =
    foreign "SetShapesTexture" (Texture.t @-> Rectangle.t @-> returning void)

  let get_shapes_texture =
    foreign "GetShapesTexture" (void @-> returning Texture.t)

  let get_shapes_texture_rectangle =
    foreign "GetShapesTextureRectangle" (void @-> returning Rectangle.t)

  let draw_pixel =
    foreign "DrawPixel" (int @-> int @-> Color.t @-> returning void)

  let draw_pixel_v =
    foreign "DrawPixelV" (Vector2.t @-> Color.t @-> returning void)

  let draw_line =
    foreign "DrawLine"
      (int @-> int @-> int @-> int @-> Color.t @-> returning void)

  let draw_line_v =
    foreign "DrawLineV" (Vector2.t @-> Vector2.t @-> Color.t @-> returning void)

  let draw_line_ex =
    foreign "DrawLineEx"
      (Vector2.t @-> Vector2.t @-> float @-> Color.t @-> returning void)

  let draw_line_strip =
    foreign "DrawLineStrip"
      (ptr Vector2.t @-> int @-> Color.t @-> returning void)

  let draw_line_bezier =
    foreign "DrawLineBezier"
      (Vector2.t @-> Vector2.t @-> float @-> Color.t @-> returning void)

  let draw_line_dashed =
    foreign "DrawLineDashed"
      (Vector2.t @-> Vector2.t @-> int @-> int @-> Color.t @-> returning void)

  let draw_circle =
    foreign "DrawCircle" (int @-> int @-> float @-> Color.t @-> returning void)

  let draw_circle_v =
    foreign "DrawCircleV" (Vector2.t @-> float @-> Color.t @-> returning void)

  let draw_circle_gradient =
    foreign "DrawCircleGradient"
      (Vector2.t @-> float @-> Color.t @-> Color.t @-> returning void)

  let draw_circle_sector =
    foreign "DrawCircleSector"
      (Vector2.t @-> float @-> float @-> float @-> int @-> Color.t
     @-> returning void)

  let draw_circle_sector_lines =
    foreign "DrawCircleSectorLines"
      (Vector2.t @-> float @-> float @-> float @-> int @-> Color.t
     @-> returning void)

  let draw_circle_lines =
    foreign "DrawCircleLines"
      (int @-> int @-> float @-> Color.t @-> returning void)

  let draw_circle_lines_v =
    foreign "DrawCircleLinesV"
      (Vector2.t @-> float @-> Color.t @-> returning void)

  let draw_ellipse =
    foreign "DrawEllipse"
      (int @-> int @-> float @-> float @-> Color.t @-> returning void)

  let draw_ellipse_v =
    foreign "DrawEllipseV"
      (Vector2.t @-> float @-> float @-> Color.t @-> returning void)

  let draw_ellipse_lines =
    foreign "DrawEllipseLines"
      (int @-> int @-> float @-> float @-> Color.t @-> returning void)

  let draw_ellipse_lines_v =
    foreign "DrawEllipseLinesV"
      (Vector2.t @-> float @-> float @-> Color.t @-> returning void)

  let draw_ring =
    foreign "DrawRing"
      (Vector2.t @-> float @-> float @-> float @-> float @-> int @-> Color.t
     @-> returning void)

  let draw_ring_lines =
    foreign "DrawRingLines"
      (Vector2.t @-> float @-> float @-> float @-> float @-> int @-> Color.t
     @-> returning void)

  let draw_rectangle =
    foreign "DrawRectangle"
      (int @-> int @-> int @-> int @-> Color.t @-> returning void)

  let draw_rectangle_v =
    foreign "DrawRectangleV"
      (Vector2.t @-> Vector2.t @-> Color.t @-> returning void)

  let draw_rectangle_rec =
    foreign "DrawRectangleRec" (Rectangle.t @-> Color.t @-> returning void)

  let draw_rectangle_pro =
    foreign "DrawRectanglePro"
      (Rectangle.t @-> Vector2.t @-> float @-> Color.t @-> returning void)

  let draw_rectangle_gradient_v =
    foreign "DrawRectangleGradientV"
      (int @-> int @-> int @-> int @-> Color.t @-> Color.t @-> returning void)

  let draw_rectangle_gradient_h =
    foreign "DrawRectangleGradientH"
      (int @-> int @-> int @-> int @-> Color.t @-> Color.t @-> returning void)

  let draw_rectangle_gradient_ex =
    foreign "DrawRectangleGradientEx"
      (Rectangle.t @-> Color.t @-> Color.t @-> Color.t @-> Color.t
     @-> returning void)

  let draw_rectangle_lines =
    foreign "DrawRectangleLines"
      (int @-> int @-> int @-> int @-> Color.t @-> returning void)

  let draw_rectangle_lines_ex =
    foreign "DrawRectangleLinesEx"
      (Rectangle.t @-> float @-> Color.t @-> returning void)

  let draw_rectangle_rounded =
    foreign "DrawRectangleRounded"
      (Rectangle.t @-> float @-> int @-> Color.t @-> returning void)

  let draw_rectangle_rounded_lines =
    foreign "DrawRectangleRoundedLines"
      (Rectangle.t @-> float @-> int @-> Color.t @-> returning void)

  let draw_rectangle_rounded_lines_ex =
    foreign "DrawRectangleRoundedLinesEx"
      (Rectangle.t @-> float @-> int @-> float @-> Color.t @-> returning void)

  let draw_triangle =
    foreign "DrawTriangle"
      (Vector2.t @-> Vector2.t @-> Vector2.t @-> Color.t @-> returning void)

  let draw_triangle_lines =
    foreign "DrawTriangleLines"
      (Vector2.t @-> Vector2.t @-> Vector2.t @-> Color.t @-> returning void)

  let draw_triangle_fan =
    foreign "DrawTriangleFan"
      (ptr Vector2.t @-> int @-> Color.t @-> returning void)

  let draw_triangle_strip =
    foreign "DrawTriangleStrip"
      (ptr Vector2.t @-> int @-> Color.t @-> returning void)

  let draw_poly =
    foreign "DrawPoly"
      (Vector2.t @-> int @-> float @-> float @-> Color.t @-> returning void)

  let draw_poly_lines =
    foreign "DrawPolyLines"
      (Vector2.t @-> int @-> float @-> float @-> Color.t @-> returning void)

  let draw_poly_lines_ex =
    foreign "DrawPolyLinesEx"
      (Vector2.t @-> int @-> float @-> float @-> float @-> Color.t
     @-> returning void)

  let draw_spline_linear =
    foreign "DrawSplineLinear"
      (ptr Vector2.t @-> int @-> float @-> Color.t @-> returning void)

  let draw_spline_basis =
    foreign "DrawSplineBasis"
      (ptr Vector2.t @-> int @-> float @-> Color.t @-> returning void)

  let draw_spline_catmull_rom =
    foreign "DrawSplineCatmullRom"
      (ptr Vector2.t @-> int @-> float @-> Color.t @-> returning void)

  let draw_spline_bezier_quadratic =
    foreign "DrawSplineBezierQuadratic"
      (ptr Vector2.t @-> int @-> float @-> Color.t @-> returning void)

  let draw_spline_bezier_cubic =
    foreign "DrawSplineBezierCubic"
      (ptr Vector2.t @-> int @-> float @-> Color.t @-> returning void)

  let draw_spline_segment_linear =
    foreign "DrawSplineSegmentLinear"
      (Vector2.t @-> Vector2.t @-> float @-> Color.t @-> returning void)

  let draw_spline_segment_basis =
    foreign "DrawSplineSegmentBasis"
      (Vector2.t @-> Vector2.t @-> Vector2.t @-> Vector2.t @-> float @-> Color.t
     @-> returning void)

  let draw_spline_segment_catmull_rom =
    foreign "DrawSplineSegmentCatmullRom"
      (Vector2.t @-> Vector2.t @-> Vector2.t @-> Vector2.t @-> float @-> Color.t
     @-> returning void)

  let draw_spline_segment_bezier_quadratic =
    foreign "DrawSplineSegmentBezierQuadratic"
      (Vector2.t @-> Vector2.t @-> Vector2.t @-> float @-> Color.t
     @-> returning void)

  let draw_spline_segment_bezier_cubic =
    foreign "DrawSplineSegmentBezierCubic"
      (Vector2.t @-> Vector2.t @-> Vector2.t @-> Vector2.t @-> float @-> Color.t
     @-> returning void)

  let get_spline_point_linear =
    foreign "GetSplinePointLinear"
      (Vector2.t @-> Vector2.t @-> float @-> returning Vector2.t)

  let get_spline_point_basis =
    foreign "GetSplinePointBasis"
      (Vector2.t @-> Vector2.t @-> Vector2.t @-> Vector2.t @-> float
     @-> returning Vector2.t)

  let get_spline_point_catmull_rom =
    foreign "GetSplinePointCatmullRom"
      (Vector2.t @-> Vector2.t @-> Vector2.t @-> Vector2.t @-> float
     @-> returning Vector2.t)

  let get_spline_point_bezier_quad =
    foreign "GetSplinePointBezierQuad"
      (Vector2.t @-> Vector2.t @-> Vector2.t @-> float @-> returning Vector2.t)

  let get_spline_point_bezier_cubic =
    foreign "GetSplinePointBezierCubic"
      (Vector2.t @-> Vector2.t @-> Vector2.t @-> Vector2.t @-> float
     @-> returning Vector2.t)

  let check_collision_recs =
    foreign "CheckCollisionRecs" (Rectangle.t @-> Rectangle.t @-> returning bool)

  let check_collision_circles =
    foreign "CheckCollisionCircles"
      (Vector2.t @-> float @-> Vector2.t @-> float @-> returning bool)

  let check_collision_circle_rec =
    foreign "CheckCollisionCircleRec"
      (Vector2.t @-> float @-> Rectangle.t @-> returning bool)

  let check_collision_circle_line =
    foreign "CheckCollisionCircleLine"
      (Vector2.t @-> float @-> Vector2.t @-> Vector2.t @-> returning bool)

  let check_collision_point_rec =
    foreign "CheckCollisionPointRec"
      (Vector2.t @-> Rectangle.t @-> returning bool)

  let check_collision_point_circle =
    foreign "CheckCollisionPointCircle"
      (Vector2.t @-> Vector2.t @-> float @-> returning bool)

  let check_collision_point_triangle =
    foreign "CheckCollisionPointTriangle"
      (Vector2.t @-> Vector2.t @-> Vector2.t @-> Vector2.t @-> returning bool)

  let check_collision_point_line =
    foreign "CheckCollisionPointLine"
      (Vector2.t @-> Vector2.t @-> Vector2.t @-> int @-> returning bool)

  let check_collision_point_poly =
    foreign "CheckCollisionPointPoly"
      (Vector2.t @-> ptr Vector2.t @-> int @-> returning bool)

  let check_collision_lines =
    foreign "CheckCollisionLines"
      (Vector2.t @-> Vector2.t @-> Vector2.t @-> Vector2.t @-> ptr Vector2.t
     @-> returning bool)

  let get_collision_rec =
    foreign "GetCollisionRec"
      (Rectangle.t @-> Rectangle.t @-> returning Rectangle.t)
end

module Types (F : Ctypes.TYPE) = struct end

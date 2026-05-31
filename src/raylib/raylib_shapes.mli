open Raylib_core

 (** {2 Basic Shapes Drawing Functions (Module: shapes)}*)

val set_shapes_texture : Texture.t -> Rectangle.t -> unit
(** [set_shapes_texture texture source] Set texture and rectangle to be used on
    shapes drawing*)

val get_shapes_texture : unit -> Texture.t
(** [get_shapes_texture ()] Get texture that is used for shapes drawing*)

val get_shapes_texture_rectangle : unit -> Rectangle.t
(** [get_shapes_texture_rectangle ()] Get texture source rectangle that is used
    for shapes drawing*)

val draw_pixel : int -> int -> Color.t -> unit
(** [draw_pixel pos_x pos_y color] Draw a pixel using geometry
    [Can be slow, use with care]*)

val draw_pixel_v : Vector2.t -> Color.t -> unit
(** [draw_pixel_v position color] Draw a pixel using geometry (Vector version)
    [Can be slow, use with care]*)

val draw_line : int -> int -> int -> int -> Color.t -> unit
(** [draw_line start_pos_x start_pos_y end_pos_x end_pos_y color] Draw a line*)

val draw_line_v : Vector2.t -> Vector2.t -> Color.t -> unit
(** [draw_line_v start_pos end_pos color] Draw a line (using gl lines)*)

val draw_line_ex : Vector2.t -> Vector2.t -> float -> Color.t -> unit
(** [draw_line_ex start_pos end_pos thick color] Draw a line (using
    triangles/quads)*)

val draw_line_strip : Vector2.t ptr -> int -> Color.t -> unit
(** [draw_line_strip points point_count color] Draw lines sequence (using gl
    lines)*)

val draw_line_bezier : Vector2.t -> Vector2.t -> float -> Color.t -> unit
(** [draw_line_bezier start_pos end_pos thick color] Draw line segment
    cubic-bezier in-out interpolation*)

val draw_line_dashed : Vector2.t -> Vector2.t -> int -> int -> Color.t -> unit
(** [draw_line_dashed start_pos end_pos dash_size space_size color] Draw a
    dashed line*)

val draw_circle : int -> int -> float -> Color.t -> unit
(** [draw_circle center_x center_y radius color] Draw a color-filled circle*)

val draw_circle_v : Vector2.t -> float -> Color.t -> unit
(** [draw_circle_v center radius color] Draw a color-filled circle (Vector
    version)*)

val draw_circle_gradient : Vector2.t -> float -> Color.t -> Color.t -> unit
(** [draw_circle_gradient center radius inner outer] Draw a gradient-filled
    circle*)

val draw_circle_sector :
  Vector2.t -> float -> float -> float -> int -> Color.t -> unit
(** [draw_circle_sector center radius start_angle end_angle segments color] Draw
    a piece of a circle*)

val draw_circle_sector_lines :
  Vector2.t -> float -> float -> float -> int -> Color.t -> unit
(** [draw_circle_sector_lines center radius start_angle end_angle segments
     color] Draw circle sector outline*)

val draw_circle_lines : int -> int -> float -> Color.t -> unit
(** [draw_circle_lines center_x center_y radius color] Draw circle outline*)

val draw_circle_lines_v : Vector2.t -> float -> Color.t -> unit
(** [draw_circle_lines_v center radius color] Draw circle outline (Vector
    version)*)

val draw_ellipse : int -> int -> float -> float -> Color.t -> unit
(** [draw_ellipse center_x center_y radius_h radius_v color] Draw ellipse*)

val draw_ellipse_v : Vector2.t -> float -> float -> Color.t -> unit
(** [draw_ellipse_v center radius_h radius_v color] Draw ellipse (Vector
    version)*)

val draw_ellipse_lines : int -> int -> float -> float -> Color.t -> unit
(** [draw_ellipse_lines center_x center_y radius_h radius_v color] Draw ellipse
    outline*)

val draw_ellipse_lines_v : Vector2.t -> float -> float -> Color.t -> unit
(** [draw_ellipse_lines_v center radius_h radius_v color] Draw ellipse outline
    (Vector version)*)

val draw_ring :
  Vector2.t -> float -> float -> float -> float -> int -> Color.t -> unit
(** [draw_ring center inner_radius outer_radius start_angle end_angle segments
     color] Draw ring*)

val draw_ring_lines :
  Vector2.t -> float -> float -> float -> float -> int -> Color.t -> unit
(** [draw_ring_lines center inner_radius outer_radius start_angle end_angle
     segments color] Draw ring outline*)

val draw_rectangle : int -> int -> int -> int -> Color.t -> unit
(** [draw_rectangle pos_x pos_y width height color] Draw a color-filled
    rectangle*)

val draw_rectangle_v : Vector2.t -> Vector2.t -> Color.t -> unit
(** [draw_rectangle_v position size color] Draw a color-filled rectangle (Vector
    version)*)

val draw_rectangle_rec : Rectangle.t -> Color.t -> unit
(** [draw_rectangle_rec rec color] Draw a color-filled rectangle*)

val draw_rectangle_pro : Rectangle.t -> Vector2.t -> float -> Color.t -> unit
(** [draw_rectangle_pro rec origin rotation color] Draw a color-filled rectangle
    with pro parameters*)

val draw_rectangle_gradient_v :
  int -> int -> int -> int -> Color.t -> Color.t -> unit
(** [draw_rectangle_gradient_v pos_x pos_y width height top bottom] Draw a
    vertical-gradient-filled rectangle*)

val draw_rectangle_gradient_h :
  int -> int -> int -> int -> Color.t -> Color.t -> unit
(** [draw_rectangle_gradient_h pos_x pos_y width height left right] Draw a
    horizontal-gradient-filled rectangle*)

val draw_rectangle_gradient_ex :
  Rectangle.t -> Color.t -> Color.t -> Color.t -> Color.t -> unit
(** [draw_rectangle_gradient_ex rec top_left bottom_left bottom_right top_right]
    Draw a gradient-filled rectangle with custom vertex colors*)

val draw_rectangle_lines : int -> int -> int -> int -> Color.t -> unit
(** [draw_rectangle_lines pos_x pos_y width height color] Draw rectangle outline*)

val draw_rectangle_lines_ex : Rectangle.t -> float -> Color.t -> unit
(** [draw_rectangle_lines_ex rec line_thick color] Draw rectangle outline with
    extended parameters*)

val draw_rectangle_rounded : Rectangle.t -> float -> int -> Color.t -> unit
(** [draw_rectangle_rounded rec roundness segments color] Draw rectangle with
    rounded edges*)

val draw_rectangle_rounded_lines :
  Rectangle.t -> float -> int -> Color.t -> unit
(** [draw_rectangle_rounded_lines rec roundness segments color] Draw rectangle
    lines with rounded edges*)

val draw_rectangle_rounded_lines_ex :
  Rectangle.t -> float -> int -> float -> Color.t -> unit
(** [draw_rectangle_rounded_lines_ex rec roundness segments line_thick color]
    Draw rectangle with rounded edges outline*)

val draw_triangle : Vector2.t -> Vector2.t -> Vector2.t -> Color.t -> unit
(** [draw_triangle v1 v2 v3 color] Draw a color-filled triangle (vertex in
    counter-clockwise order!)*)

val draw_triangle_lines : Vector2.t -> Vector2.t -> Vector2.t -> Color.t -> unit
(** [draw_triangle_lines v1 v2 v3 color] Draw triangle outline (vertex in
    counter-clockwise order!)*)

val draw_triangle_fan : Vector2.t ptr -> int -> Color.t -> unit
(** [draw_triangle_fan points point_count color] Draw a triangle fan defined by
    points (first vertex is the center)*)

val draw_triangle_strip : Vector2.t ptr -> int -> Color.t -> unit
(** [draw_triangle_strip points point_count color] Draw a triangle strip defined
    by points*)

val draw_poly : Vector2.t -> int -> float -> float -> Color.t -> unit
(** [draw_poly center sides radius rotation color] Draw a regular polygon
    (Vector version)*)

val draw_poly_lines : Vector2.t -> int -> float -> float -> Color.t -> unit
(** [draw_poly_lines center sides radius rotation color] Draw a polygon outline
    of n sides*)

val draw_poly_lines_ex :
  Vector2.t -> int -> float -> float -> float -> Color.t -> unit
(** [draw_poly_lines_ex center sides radius rotation line_thick color] Draw a
    polygon outline of n sides with extended parameters*)

val draw_spline_linear : Vector2.t ptr -> int -> float -> Color.t -> unit
(** [draw_spline_linear points point_count thick color] Draw spline: Linear,
    minimum 2 points*)

val draw_spline_basis : Vector2.t ptr -> int -> float -> Color.t -> unit
(** [draw_spline_basis points point_count thick color] Draw spline: B-Spline,
    minimum 4 points*)

val draw_spline_catmull_rom : Vector2.t ptr -> int -> float -> Color.t -> unit
(** [draw_spline_catmull_rom points point_count thick color] Draw spline:
    Catmull-Rom, minimum 4 points*)

val draw_spline_bezier_quadratic :
  Vector2.t ptr -> int -> float -> Color.t -> unit
(** [draw_spline_bezier_quadratic points point_count thick color] Draw spline:
    Quadratic Bezier, minimum 3 points (1 control point): [p1, c2, p3, c4...]*)

val draw_spline_bezier_cubic : Vector2.t ptr -> int -> float -> Color.t -> unit
(** [draw_spline_bezier_cubic points point_count thick color] Draw spline: Cubic
    Bezier, minimum 4 points (2 control points): [p1, c2, c3, p4, c5, c6...]*)

val draw_spline_segment_linear :
  Vector2.t -> Vector2.t -> float -> Color.t -> unit
(** [draw_spline_segment_linear p1 p2 thick color] Draw spline segment: Linear,
    2 points*)

val draw_spline_segment_basis :
  Vector2.t -> Vector2.t -> Vector2.t -> Vector2.t -> float -> Color.t -> unit
(** [draw_spline_segment_basis p1 p2 p3 p4 thick color] Draw spline segment:
    B-Spline, 4 points*)

val draw_spline_segment_catmull_rom :
  Vector2.t -> Vector2.t -> Vector2.t -> Vector2.t -> float -> Color.t -> unit
(** [draw_spline_segment_catmull_rom p1 p2 p3 p4 thick color] Draw spline
    segment: Catmull-Rom, 4 points*)

val draw_spline_segment_bezier_quadratic :
  Vector2.t -> Vector2.t -> Vector2.t -> float -> Color.t -> unit
(** [draw_spline_segment_bezier_quadratic p1 c2 p3 thick color] Draw spline
    segment: Quadratic Bezier, 2 points, 1 control point*)

val draw_spline_segment_bezier_cubic :
  Vector2.t -> Vector2.t -> Vector2.t -> Vector2.t -> float -> Color.t -> unit
(** [draw_spline_segment_bezier_cubic p1 c2 c3 p4 thick color] Draw spline
    segment: Cubic Bezier, 2 points, 2 control points*)

val get_spline_point_linear : Vector2.t -> Vector2.t -> float -> Vector2.t
(** [get_spline_point_linear start_pos end_pos t] Get (evaluate) spline point:
    Linear*)

val get_spline_point_basis :
  Vector2.t -> Vector2.t -> Vector2.t -> Vector2.t -> float -> Vector2.t
(** [get_spline_point_basis p1 p2 p3 p4 t] Get (evaluate) spline point: B-Spline*)

val get_spline_point_catmull_rom :
  Vector2.t -> Vector2.t -> Vector2.t -> Vector2.t -> float -> Vector2.t
(** [get_spline_point_catmull_rom p1 p2 p3 p4 t] Get (evaluate) spline point:
    Catmull-Rom*)

val get_spline_point_bezier_quad :
  Vector2.t -> Vector2.t -> Vector2.t -> float -> Vector2.t
(** [get_spline_point_bezier_quad p1 c2 p3 t] Get (evaluate) spline point:
    Quadratic Bezier*)

val get_spline_point_bezier_cubic :
  Vector2.t -> Vector2.t -> Vector2.t -> Vector2.t -> float -> Vector2.t
(** [get_spline_point_bezier_cubic p1 c2 c3 p4 t] Get (evaluate) spline point:
    Cubic Bezier*)

(** {3 Basic shapes collision detection functions} *)

val check_collision_recs : Rectangle.t -> Rectangle.t -> bool
(** [check_collision_recs rec1 rec2] Check collision between two rectangles*)

val check_collision_circles : Vector2.t -> float -> Vector2.t -> float -> bool
(** [check_collision_circles center1 radius1 center2 radius2] Check collision
    between two circles*)

val check_collision_circle_rec : Vector2.t -> float -> Rectangle.t -> bool
(** [check_collision_circle_rec center radius rec] Check collision between
    circle and rectangle*)

val check_collision_circle_line :
  Vector2.t -> float -> Vector2.t -> Vector2.t -> bool
(** [check_collision_circle_line center radius p1 p2] Check if circle collides
    with a line created betweeen two points [p1] and [p2]*)

val check_collision_point_rec : Vector2.t -> Rectangle.t -> bool
(** [check_collision_point_rec point rec] Check if point is inside rectangle*)

val check_collision_point_circle : Vector2.t -> Vector2.t -> float -> bool
(** [check_collision_point_circle point center radius] Check if point is inside
    circle*)

val check_collision_point_triangle :
  Vector2.t -> Vector2.t -> Vector2.t -> Vector2.t -> bool
(** [check_collision_point_triangle point p1 p2 p3] Check if point is inside a
    triangle*)

val check_collision_point_line :
  Vector2.t -> Vector2.t -> Vector2.t -> int -> bool
(** [check_collision_point_line point p1 p2 threshold] Check if point belongs to
    line created between two points [p1] and [p2] with defined margin in pixels
    [threshold]*)

val check_collision_point_poly : Vector2.t -> Vector2.t ptr -> int -> bool
(** [check_collision_point_poly point points point_count] Check if point is
    within a polygon described by array of vertices*)

val check_collision_lines :
  Vector2.t -> Vector2.t -> Vector2.t -> Vector2.t -> Vector2.t ptr -> bool
(** [check_collision_lines start_pos1 end_pos1 start_pos2 end_pos2
     collision_point] Check the collision between two lines defined by two
    points each, returns collision point by reference*)

val get_collision_rec : Rectangle.t -> Rectangle.t -> Rectangle.t
(** [get_collision_rec rec1 rec2] Get collision rectangle for two rectangles
    collision*)

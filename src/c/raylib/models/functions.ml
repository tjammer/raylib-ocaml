open Ctypes

module Functions (F : Ctypes.FOREIGN) = struct
  open F
  open Raylib_core

  let draw_line_3d =
    foreign "DrawLine3D" (Vector3.t @-> Vector3.t @-> Color.t @-> returning void)

  let draw_point_3d =
    foreign "DrawPoint3D" (Vector3.t @-> Color.t @-> returning void)

  let draw_circle_3d =
    foreign "DrawCircle3D"
      (Vector3.t @-> float @-> Vector3.t @-> float @-> Color.t
     @-> returning void)

  let draw_triangle_3d =
    foreign "DrawTriangle3D"
      (Vector3.t @-> Vector3.t @-> Vector3.t @-> Color.t @-> returning void)

  let draw_triangle_strip_3d =
    foreign "DrawTriangleStrip3D"
      (ptr Vector3.t @-> int @-> Color.t @-> returning void)

  let draw_cube =
    foreign "DrawCube"
      (Vector3.t @-> float @-> float @-> float @-> Color.t @-> returning void)

  let draw_cube_v =
    foreign "DrawCubeV" (Vector3.t @-> Vector3.t @-> Color.t @-> returning void)

  let draw_cube_wires =
    foreign "DrawCubeWires"
      (Vector3.t @-> float @-> float @-> float @-> Color.t @-> returning void)

  let draw_cube_wires_v =
    foreign "DrawCubeWiresV"
      (Vector3.t @-> Vector3.t @-> Color.t @-> returning void)

  let draw_sphere =
    foreign "DrawSphere" (Vector3.t @-> float @-> Color.t @-> returning void)

  let draw_sphere_ex =
    foreign "DrawSphereEx"
      (Vector3.t @-> float @-> int @-> int @-> Color.t @-> returning void)

  let draw_sphere_wires =
    foreign "DrawSphereWires"
      (Vector3.t @-> float @-> int @-> int @-> Color.t @-> returning void)

  let draw_cylinder =
    foreign "DrawCylinder"
      (Vector3.t @-> float @-> float @-> float @-> int @-> Color.t
     @-> returning void)

  let draw_cylinder_ex =
    foreign "DrawCylinderEx"
      (Vector3.t @-> Vector3.t @-> float @-> float @-> int @-> Color.t
     @-> returning void)

  let draw_cylinder_wires =
    foreign "DrawCylinderWires"
      (Vector3.t @-> float @-> float @-> float @-> int @-> Color.t
     @-> returning void)

  let draw_cylinder_wires_ex =
    foreign "DrawCylinderWiresEx"
      (Vector3.t @-> Vector3.t @-> float @-> float @-> int @-> Color.t
     @-> returning void)

  let draw_capsule =
    foreign "DrawCapsule"
      (Vector3.t @-> Vector3.t @-> float @-> int @-> int @-> Color.t
     @-> returning void)

  let draw_capsule_wires =
    foreign "DrawCapsuleWires"
      (Vector3.t @-> Vector3.t @-> float @-> int @-> int @-> Color.t
     @-> returning void)

  let draw_plane =
    foreign "DrawPlane" (Vector3.t @-> Vector2.t @-> Color.t @-> returning void)

  let draw_ray = foreign "DrawRay" (Ray.t @-> Color.t @-> returning void)
  let draw_grid = foreign "DrawGrid" (int @-> float @-> returning void)
  let load_model = foreign "LoadModel" (string @-> returning Model.t)

  let load_model_from_mesh =
    foreign "LoadModelFromMesh" (Mesh.t @-> returning Model.t)

  let is_model_valid = foreign "IsModelValid" (Model.t @-> returning bool)
  let unload_model = foreign "UnloadModel" (Model.t @-> returning void)

  let get_model_bounding_box =
    foreign "GetModelBoundingBox" (Model.t @-> returning BoundingBox.t)

  let draw_model =
    foreign "DrawModel"
      (Model.t @-> Vector3.t @-> float @-> Color.t @-> returning void)

  let draw_model_ex =
    foreign "DrawModelEx"
      (Model.t @-> Vector3.t @-> Vector3.t @-> float @-> Vector3.t @-> Color.t
     @-> returning void)

  let draw_model_wires =
    foreign "DrawModelWires"
      (Model.t @-> Vector3.t @-> float @-> Color.t @-> returning void)

  let draw_model_wires_ex =
    foreign "DrawModelWiresEx"
      (Model.t @-> Vector3.t @-> Vector3.t @-> float @-> Vector3.t @-> Color.t
     @-> returning void)

  let draw_bounding_box =
    foreign "DrawBoundingBox" (BoundingBox.t @-> Color.t @-> returning void)

  let draw_billboard =
    foreign "DrawBillboard"
      (Camera3D.t @-> Texture.t @-> Vector3.t @-> float @-> Color.t
     @-> returning void)

  let draw_billboard_rec =
    foreign "DrawBillboardRec"
      (Camera3D.t @-> Texture.t @-> Rectangle.t @-> Vector3.t @-> Vector2.t
     @-> Color.t @-> returning void)

  let draw_billboard_pro =
    foreign "DrawBillboardPro"
      (Camera3D.t @-> Texture.t @-> Rectangle.t @-> Vector3.t @-> Vector3.t
     @-> Vector2.t @-> Vector2.t @-> float @-> Color.t @-> returning void)

  let upload_mesh = foreign "UploadMesh" (ptr Mesh.t @-> bool @-> returning void)

  let update_mesh_buffer =
    foreign "UpdateMeshBuffer"
      (Mesh.t @-> int @-> ptr void @-> int @-> int @-> returning void)

  let unload_mesh = foreign "UnloadMesh" (Mesh.t @-> returning void)

  let draw_mesh =
    foreign "DrawMesh" (Mesh.t @-> Material.t @-> Matrix.t @-> returning void)

  let draw_mesh_instanced =
    foreign "DrawMeshInstanced"
      (Mesh.t @-> Material.t @-> ptr Matrix.t @-> int @-> returning void)

  let get_mesh_bounding_box =
    foreign "GetMeshBoundingBox" (Mesh.t @-> returning BoundingBox.t)

  let gen_mesh_tangents =
    foreign "GenMeshTangents" (ptr Mesh.t @-> returning void)

  let export_mesh = foreign "ExportMesh" (Mesh.t @-> string @-> returning bool)

  let export_mesh_as_code =
    foreign "ExportMeshAsCode" (Mesh.t @-> string @-> returning bool)

  let gen_mesh_poly = foreign "GenMeshPoly" (int @-> float @-> returning Mesh.t)

  let gen_mesh_plane =
    foreign "GenMeshPlane" (float @-> float @-> int @-> int @-> returning Mesh.t)

  let gen_mesh_cube =
    foreign "GenMeshCube" (float @-> float @-> float @-> returning Mesh.t)

  let gen_mesh_sphere =
    foreign "GenMeshSphere" (float @-> int @-> int @-> returning Mesh.t)

  let gen_mesh_hemi_sphere =
    foreign "GenMeshHemiSphere" (float @-> int @-> int @-> returning Mesh.t)

  let gen_mesh_cylinder =
    foreign "GenMeshCylinder" (float @-> float @-> int @-> returning Mesh.t)

  let gen_mesh_cone =
    foreign "GenMeshCone" (float @-> float @-> int @-> returning Mesh.t)

  let gen_mesh_torus =
    foreign "GenMeshTorus" (float @-> float @-> int @-> int @-> returning Mesh.t)

  let gen_mesh_knot =
    foreign "GenMeshKnot" (float @-> float @-> int @-> int @-> returning Mesh.t)

  let gen_mesh_heightmap =
    foreign "GenMeshHeightmap" (Image.t @-> Vector3.t @-> returning Mesh.t)

  let gen_mesh_cubicmap =
    foreign "GenMeshCubicmap" (Image.t @-> Vector3.t @-> returning Mesh.t)

  let load_materials =
    foreign "LoadMaterials" (string @-> ptr int @-> returning (ptr Material.t))

  let load_material_default =
    foreign "LoadMaterialDefault" (void @-> returning Material.t)

  let is_material_valid =
    foreign "IsMaterialValid" (Material.t @-> returning bool)

  let unload_material = foreign "UnloadMaterial" (Material.t @-> returning void)

  let set_material_texture =
    foreign "SetMaterialTexture"
      (ptr Material.t @-> MaterialMapIndex.t @-> Texture.t @-> returning void)

  let set_model_mesh_material =
    foreign "SetModelMeshMaterial"
      (ptr Model.t @-> int @-> int @-> returning void)

  let _load_model_animations =
    foreign "LoadModelAnimations"
      (string @-> ptr int @-> returning (ptr ModelAnimation.t))

  let update_model_animation =
    foreign "UpdateModelAnimation"
      (Model.t @-> ModelAnimation.t @-> int @-> returning void)

  let update_model_animation_ex =
    foreign "UpdateModelAnimationEx"
      (Model.t @-> ModelAnimation.t @-> float @-> ModelAnimation.t @-> float
     @-> float @-> returning void)

  let _unload_model_animations =
    foreign "UnloadModelAnimations"
      (ptr ModelAnimation.t @-> int @-> returning void)

  let is_model_animation_valid =
    foreign "IsModelAnimationValid"
      (Model.t @-> ModelAnimation.t @-> returning bool)

  let check_collision_spheres =
    foreign "CheckCollisionSpheres"
      (Vector3.t @-> float @-> Vector3.t @-> float @-> returning bool)

  let check_collision_boxes =
    foreign "CheckCollisionBoxes"
      (BoundingBox.t @-> BoundingBox.t @-> returning bool)

  let check_collision_box_sphere =
    foreign "CheckCollisionBoxSphere"
      (BoundingBox.t @-> Vector3.t @-> float @-> returning bool)

  let get_ray_collision_sphere =
    foreign "GetRayCollisionSphere"
      (Ray.t @-> Vector3.t @-> float @-> returning RayCollision.t)

  let get_ray_collision_box =
    foreign "GetRayCollisionBox"
      (Ray.t @-> BoundingBox.t @-> returning RayCollision.t)

  let get_ray_collision_mesh =
    foreign "GetRayCollisionMesh"
      (Ray.t @-> Mesh.t @-> Matrix.t @-> returning RayCollision.t)

  let get_ray_collision_triangle =
    foreign "GetRayCollisionTriangle"
      (Ray.t @-> Vector3.t @-> Vector3.t @-> Vector3.t
     @-> returning RayCollision.t)

  let get_ray_collision_quad =
    foreign "GetRayCollisionQuad"
      (Ray.t @-> Vector3.t @-> Vector3.t @-> Vector3.t @-> Vector3.t
     @-> returning RayCollision.t)
end

module Types (F : Ctypes.TYPE) = struct end

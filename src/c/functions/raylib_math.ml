module Types = Raylib_generated_types

module Description (F : Ctypes.FOREIGN) = struct
  open Ctypes
  open F

  (*---------------------------------------------------------------------------------- *)
  (* Module Functions Definition - Utils math *)
  (*---------------------------------------------------------------------------------- *)
  (* Clamp float value *)
  let clamp = foreign "Clamp" (float @-> float @-> float @-> returning float)

  (* Calculate linear interpolation between two floats *)
  let lerp = foreign "Lerp" (float @-> float @-> float @-> returning float)

  module Vector2 = struct
    (*---------------------------------------------------------------------------------- *)
    (* Module Functions Definition - Vector2 math *)
    (*---------------------------------------------------------------------------------- *)
    (* Vector with components value 0.0f *)
    let zero = foreign "Vector2Zero" (void @-> returning Types.Vector2.t)

    (* Vector with components value 1.0f *)
    let one = foreign "Vector2One" (void @-> returning Types.Vector2.t)

    (* Add two vectors (v1 + v2) *)
    let add =
      foreign "Vector2Add"
        (Types.Vector2.t @-> Types.Vector2.t @-> returning Types.Vector2.t)

    let add_value =
      foreign "Vector2AddValue"
        (Types.Vector2.t @-> float @-> returning Types.Vector2.t)

    (* Subtract two vectors (v1 - v2) *)
    let subtract =
      foreign "Vector2Subtract"
        (Types.Vector2.t @-> Types.Vector2.t @-> returning Types.Vector2.t)

    let subtract_value =
      foreign "Vector2SubtractValue"
        (Types.Vector2.t @-> float @-> returning Types.Vector2.t)

    (* Calculate vector length *)
    let length = foreign "Vector2Length" (Types.Vector2.t @-> returning float)

    let length_sqr =
      foreign "Vector2LengthSqr" (Types.Vector2.t @-> returning float)

    (* Calculate two vectors dot product *)
    let dot_product =
      foreign "Vector2DotProduct"
        (Types.Vector2.t @-> Types.Vector2.t @-> returning float)

    (* Calculate distance between two vectors *)
    let distance =
      foreign "Vector2Distance"
        (Types.Vector2.t @-> Types.Vector2.t @-> returning float)

    (* Calculate angle from two vectors in X-axis *)
    let angle =
      foreign "Vector2Angle"
        (Types.Vector2.t @-> Types.Vector2.t @-> returning float)

    (* Scale vector (multiply by value) *)
    let scale =
      foreign "Vector2Scale"
        (Types.Vector2.t @-> float @-> returning Types.Vector2.t)

    (* Multiply vector by vector *)
    let multiply =
      foreign "Vector2Multiply"
        (Types.Vector2.t @-> Types.Vector2.t @-> returning Types.Vector2.t)

    (* Negate vector *)
    let negate =
      foreign "Vector2Negate" (Types.Vector2.t @-> returning Types.Vector2.t)

    (* Divide vector by vector *)
    let divide =
      foreign "Vector2Divide"
        (Types.Vector2.t @-> Types.Vector2.t @-> returning Types.Vector2.t)

    (* Normalize provided vector *)
    let normalize =
      foreign "Vector2Normalize" (Types.Vector2.t @-> returning Types.Vector2.t)

    (* Calculate linear interpolation between two vectors *)
    let lerp =
      foreign "Vector2Lerp"
        (Types.Vector2.t @-> Types.Vector2.t @-> float
       @-> returning Types.Vector2.t)

    let reflect =
      foreign "Vector2Reflect"
        (Types.Vector2.t @-> Types.Vector2.t @-> returning Types.Vector2.t)

    (* Rotate Vector by float in Degrees. *)
    let rotate =
      foreign "Vector2Rotate"
        (Types.Vector2.t @-> float @-> returning Types.Vector2.t)

    let move_towards =
      foreign "Vector2MoveTowards"
        (Types.Vector2.t @-> Types.Vector2.t @-> float
       @-> returning Types.Vector2.t)
  end

  module Vector3 = struct
    (*---------------------------------------------------------------------------------- *)
    (* Module Functions Definition - Vector3 math *)
    (*---------------------------------------------------------------------------------- *)
    (* Vector with components value 0.0f *)
    let zero = foreign "Vector3Zero" (void @-> returning Types.Vector3.t)

    (* Vector with components value 1.0f *)
    let one = foreign "Vector3One" (void @-> returning Types.Vector3.t)

    (* Add two vectors *)
    let add =
      foreign "Vector3Add"
        (Types.Vector3.t @-> Types.Vector3.t @-> returning Types.Vector3.t)

    let add_value =
      foreign "Vector3AddValue"
        (Types.Vector3.t @-> float @-> returning Types.Vector3.t)

    (* Subtract two vectors *)
    let subtract =
      foreign "Vector3Subtract"
        (Types.Vector3.t @-> Types.Vector3.t @-> returning Types.Vector3.t)

    let subtract_value =
      foreign "Vector3SubtractValue"
        (Types.Vector3.t @-> float @-> returning Types.Vector3.t)

    (* Multiply vector by scalar *)
    let scale =
      foreign "Vector3Scale"
        (Types.Vector3.t @-> float @-> returning Types.Vector3.t)

    (* Multiply vector by vector *)
    let multiply =
      foreign "Vector3Multiply"
        (Types.Vector3.t @-> Types.Vector3.t @-> returning Types.Vector3.t)

    (* Calculate two vectors cross product *)
    let cross_product =
      foreign "Vector3CrossProduct"
        (Types.Vector3.t @-> Types.Vector3.t @-> returning Types.Vector3.t)

    (* Calculate one vector perpendicular vector *)
    let perpendicular =
      foreign "Vector3Perpendicular"
        (Types.Vector3.t @-> returning Types.Vector3.t)

    (* Calculate vector length *)
    let length = foreign "Vector3Length" (Types.Vector3.t @-> returning float)

    let length_sqr =
      foreign "Vector3LengthSqr" (Types.Vector3.t @-> returning float)

    (* Calculate two vectors dot product *)
    let dot_product =
      foreign "Vector3DotProduct"
        (Types.Vector3.t @-> Types.Vector3.t @-> returning float)

    (* Calculate distance between two vectors *)
    let distance =
      foreign "Vector3Distance"
        (Types.Vector3.t @-> Types.Vector3.t @-> returning float)

    (* Negate provided vector (invert direction) *)
    let negate =
      foreign "Vector3Negate" (Types.Vector3.t @-> returning Types.Vector3.t)

    (* Divide vector by vector *)
    let divide =
      foreign "Vector3Divide"
        (Types.Vector3.t @-> Types.Vector3.t @-> returning Types.Vector3.t)

    (* Normalize provided vector *)
    let normalize =
      foreign "Vector3Normalize" (Types.Vector3.t @-> returning Types.Vector3.t)

    (* Orthonormalize provided vectors *)
    (* Makes vectors normalized and orthogonal to each other *)
    (* Gram-Schmidt function implementation *)
    let ortho_normalize =
      foreign "Vector3OrthoNormalize"
        (ptr Types.Vector3.t @-> ptr Types.Vector3.t @-> returning void)

    (* Transforms a Vector3 by a given Matrix *)
    let transform =
      foreign "Vector3Transform"
        (Types.Vector3.t @-> Types.Matrix.t @-> returning Types.Vector3.t)

    (* Transform a vector by quaternion rotation *)
    let rotate_by_quaternion =
      foreign "Vector3RotateByQuaternion"
        (Types.Vector3.t @-> Types.Vector4.t @-> returning Types.Vector3.t)

    (* Calculate linear interpolation between two vectors *)
    let lerp =
      foreign "Vector3Lerp"
        (Types.Vector3.t @-> Types.Vector3.t @-> float
       @-> returning Types.Vector3.t)

    (* Calculate reflected vector to normal *)
    let reflect =
      foreign "Vector3Reflect"
        (Types.Vector3.t @-> Types.Vector3.t @-> returning Types.Vector3.t)

    (* Return min value for each pair of components *)
    let min =
      foreign "Vector3Min"
        (Types.Vector3.t @-> Types.Vector3.t @-> returning Types.Vector3.t)

    (* Return max value for each pair of components *)
    let max =
      foreign "Vector3Max"
        (Types.Vector3.t @-> Types.Vector3.t @-> returning Types.Vector3.t)

    (* Compute barycenter coordinates (u, v, w) for point p with respect to triangle (a, b, c) *)
    (* NOTE: Assumes P is on the plane of the triangle *)
    let barycenter =
      foreign "Vector3Barycenter"
        (Types.Vector3.t @-> Types.Vector3.t @-> Types.Vector3.t
       @-> Types.Vector3.t @-> returning Types.Vector3.t)

    let unproject =
      foreign "Vector3Unproject"
        (Types.Vector3.t @-> Types.Matrix.t @-> Types.Matrix.t
       @-> returning Types.Vector3.t)
  end

  module Matrix = struct
    (*---------------------------------------------------------------------------------- *)
    (* Module Functions Definition - Matrix math *)
    (*---------------------------------------------------------------------------------- *)
    (* Compute matrix determinant *)
    let determinant =
      foreign "MatrixDeterminant" (Types.Matrix.t @-> returning float)

    (* Returns the trace of the matrix (sum of the values along the diagonal) *)
    let trace = foreign "MatrixTrace" (Types.Matrix.t @-> returning float)

    (* Transposes provided matrix *)
    let transpose =
      foreign "MatrixTranspose" (Types.Matrix.t @-> returning Types.Matrix.t)

    (* Invert provided matrix *)
    let invert =
      foreign "MatrixInvert" (Types.Matrix.t @-> returning Types.Matrix.t)

    (* Normalize provided matrix *)
    let normalize =
      foreign "MatrixNormalize" (Types.Matrix.t @-> returning Types.Matrix.t)

    (* Returns identity matrix *)
    let identity = foreign "MatrixIdentity" (void @-> returning Types.Matrix.t)

    (* Add two matrices *)
    let add =
      foreign "MatrixAdd"
        (Types.Matrix.t @-> Types.Matrix.t @-> returning Types.Matrix.t)

    (* Subtract two matrices (left - right) *)
    let subtract =
      foreign "MatrixSubtract"
        (Types.Matrix.t @-> Types.Matrix.t @-> returning Types.Matrix.t)

    (* Returns translation matrix *)
    let translate =
      foreign "MatrixTranslate"
        (float @-> float @-> float @-> returning Types.Matrix.t)

    (* Create rotation matrix from axis and angle *)
    (* NOTE: Angle should be provided in radians *)
    let rotate =
      foreign "MatrixRotate"
        (Types.Vector3.t @-> float @-> returning Types.Matrix.t)

    (* Returns xyz-rotation matrix (angles in radians) *)
    let rotate_xyz =
      foreign "MatrixRotateXYZ" (Types.Vector3.t @-> returning Types.Matrix.t)

    let rotate_zyx =
      foreign "MatrixRotateZYX" (Types.Vector3.t @-> returning Types.Matrix.t)

    (* Returns x-rotation matrix (angle in radians) *)
    let rotate_x = foreign "MatrixRotateX" (float @-> returning Types.Matrix.t)

    (* Returns y-rotation matrix (angle in radians) *)
    let rotate_y = foreign "MatrixRotateY" (float @-> returning Types.Matrix.t)

    (* Returns z-rotation matrix (angle in radians) *)
    let rotate_z = foreign "MatrixRotateZ" (float @-> returning Types.Matrix.t)

    (* Returns scaling matrix *)
    let scale =
      foreign "MatrixScale"
        (float @-> float @-> float @-> returning Types.Matrix.t)

    (* Returns two matrix multiplication *)
    (* NOTE: When multiplying matrices... the order matters! *)
    let multiply =
      foreign "MatrixMultiply"
        (Types.Matrix.t @-> Types.Matrix.t @-> returning Types.Matrix.t)

    (* Returns perspective projection matrix *)
    let frustum =
      foreign "MatrixFrustum"
        (double @-> double @-> double @-> double @-> double @-> double
       @-> returning Types.Matrix.t)

    (* Returns perspective projection matrix *)
    (* NOTE: Angle should be provided in radians *)
    let perspective =
      foreign "MatrixPerspective"
        (double @-> double @-> double @-> double @-> returning Types.Matrix.t)

    (* Returns orthographic projection matrix *)
    let ortho =
      foreign "MatrixOrtho"
        (double @-> double @-> double @-> double @-> double @-> double
       @-> returning Types.Matrix.t)

    (* Returns camera look-at matrix (view matrix) *)
    let look_at =
      foreign "MatrixLookAt"
        (Types.Vector3.t @-> Types.Vector3.t @-> Types.Vector3.t
       @-> returning Types.Matrix.t)

    (* Returns float array of matrix data *)
    (* let to_float_v = foreign "MatrixToFloatV" (Types.Matrix.t @-> returning float16) *)
  end

  module Vector4 = struct
    (*---------------------------------------------------------------------------------- *)
    (* Module Functions Definition - Quaternion math *)
    (*---------------------------------------------------------------------------------- *)
    (* Returns identity quaternion *)
    let identity =
      foreign "QuaternionIdentity" (void @-> returning Types.Vector4.t)

    let add =
      foreign "QuaternionAdd"
        (Types.Vector4.t @-> Types.Vector4.t @-> returning Types.Vector4.t)

    let add_value =
      foreign "QuaternionAddValue"
        (Types.Vector4.t @-> float @-> returning Types.Vector4.t)

    let subtract =
      foreign "QuaternionSubtract"
        (Types.Vector4.t @-> Types.Vector4.t @-> returning Types.Vector4.t)

    let subtract_value =
      foreign "QuaternionSubtractValue"
        (Types.Vector4.t @-> float @-> returning Types.Vector4.t)

    (* Computes the length of a quaternion *)
    let length = foreign "QuaternionLength" (Types.Vector4.t @-> returning float)

    (* Normalize provided quaternion *)
    let normalize =
      foreign "QuaternionNormalize"
        (Types.Vector4.t @-> returning Types.Vector4.t)

    (* Invert provided quaternion *)
    let invert =
      foreign "QuaternionInvert" (Types.Vector4.t @-> returning Types.Vector4.t)

    (* Calculate two quaternion multiplication *)
    let multiply =
      foreign "QuaternionMultiply"
        (Types.Vector4.t @-> Types.Vector4.t @-> returning Types.Vector4.t)

    let scale =
      foreign "QuaternionScale"
        (Types.Vector4.t @-> float @-> returning Types.Vector4.t)

    let divide =
      foreign "QuaternionDivide"
        (Types.Vector4.t @-> Types.Vector4.t @-> returning Types.Vector4.t)

    (* Calculate linear interpolation between two quaternions *)
    let lerp =
      foreign "QuaternionLerp"
        (Types.Vector4.t @-> Types.Vector4.t @-> float
       @-> returning Types.Vector4.t)

    (* Calculate slerp-optimized interpolation between two quaternions *)
    let nlerp =
      foreign "QuaternionNlerp"
        (Types.Vector4.t @-> Types.Vector4.t @-> float
       @-> returning Types.Vector4.t)

    (* Calculates spherical linear interpolation between two quaternions *)
    let slerp =
      foreign "QuaternionSlerp"
        (Types.Vector4.t @-> Types.Vector4.t @-> float
       @-> returning Types.Vector4.t)

    (* Calculate quaternion based on the rotation from one vector to another *)
    let from_vector3_to_vector3 =
      foreign "QuaternionFromVector3ToVector3"
        (Types.Vector3.t @-> Types.Vector3.t @-> returning Types.Vector4.t)

    (* Returns a quaternion for a given rotation matrix *)
    let from_matrix =
      foreign "QuaternionFromMatrix"
        (Types.Matrix.t @-> returning Types.Vector4.t)

    (* Returns a matrix for a given quaternion *)
    let to_matrix =
      foreign "QuaternionToMatrix" (Types.Vector4.t @-> returning Types.Matrix.t)

    (* Returns rotation quaternion for an angle and axis *)
    (* NOTE: angle must be provided in radians *)
    let from_axis_angle =
      foreign "QuaternionFromAxisAngle"
        (Types.Vector3.t @-> float @-> returning Types.Vector4.t)

    (* Returns the rotation angle and axis for a given quaternion *)
    let to_axis_angle =
      foreign "QuaternionToAxisAngle"
        (Types.Vector4.t @-> ptr Types.Vector3.t @-> ptr float
       @-> returning void)

    (* Returns he quaternion equivalent to Euler angles *)
    let from_euler =
      foreign "QuaternionFromEuler"
        (float @-> float @-> float @-> returning Types.Vector4.t)

    (* Return the Euler angles equivalent to quaternion (roll, pitch, yaw) *)
    (* NOTE: Angles are returned in a Vector3 struct in degrees *)
    let to_euler =
      foreign "QuaternionToEuler" (Types.Vector4.t @-> returning Types.Vector3.t)

    (* Transform a quaternion given a transformation matrix *)
    let transform =
      foreign "QuaternionTransform"
        (Types.Vector4.t @-> Types.Matrix.t @-> returning Types.Vector4.t)
  end
end

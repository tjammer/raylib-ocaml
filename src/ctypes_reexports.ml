(* Re-exports some ctypes functionality to the Raylib module *)
(* but it's a band-aid *)

module CArray = Ctypes.CArray

let addr = Ctypes.addr

let ptr_of_int i = Ctypes.(allocate int i)

let void_ptr_of_int i = Ctypes.(to_voidp (ptr_of_int i))

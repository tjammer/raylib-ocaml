(* Re-exports some ctypes functionality to the Raylib module *)
(* but it's a band-aid *)

module CArray = Ctypes.CArray

type 'a ctyp = 'a Ctypes.structure
type 'a ptr = 'a Ctypes.ptr

let to_ctyp (a : 'a Ctypes.structure) = a
let addr (x : 'a ctyp) = Ctypes.addr x
let to_voidp = Ctypes.to_voidp
let ptr_of_int i = Ctypes.(allocate int i)
let ptr_of_uint i = Ctypes.(allocate uint i)
let void_ptr_of_int i = Ctypes.(to_voidp (ptr_of_int i))

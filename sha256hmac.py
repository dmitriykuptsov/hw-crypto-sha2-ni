import ctypes
from ctypes import cdll
from array import array

lib = cdll.LoadLibrary('./hmaclib.so')

#lib.freeme.argtypes = ctypes.POINTER(ctypes.c_ubyte),
lib.hmac_sha256.argtypes = ctypes.POINTER(ctypes.c_ubyte), ctypes.c_uint64, ctypes.POINTER(ctypes.c_ubyte)
lib.hmac_sha256.restype = ctypes.POINTER(ctypes.c_ubyte)

class SHA256HMAC():

	def __init__(self):
		pass

	def update(self, key, data):
		v = array('B',key);pkey = (ctypes.c_ubyte * len(v)).from_buffer(v)
		v = array('B',data);pdata = (ctypes.c_ubyte * len(v)).from_buffer(v)
		addr = lib.hmac_sha256(pkey, len(key), pdata, len(data))

		hmac = ctypes.string_at(addr, 32)
		lib.freeme(addr);
		return hmac
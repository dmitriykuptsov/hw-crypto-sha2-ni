import sha256hmac
from binascii import unhexlify, hexlify

hmac=sha256hmac.SHA256HMAC()

key=unhexlify('0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b')
message=unhexlify('4869205468657265')
result = hexlify(hmac.update(key, message))
print(result)
assert result==b'b0344c61d8db38535ca8afceaf0bf12b881dc200c9833da726e9376c2e32cff7'
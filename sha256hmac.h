#ifndef _HMAC_SHA256_H_
#define _HMAC_SHA256_H_

#ifdef __cplusplus
extern "C" {
#endif  // __cplusplus

#include <stddef.h>

unsigned char* 
hmac_sha256(
    // [in]: The key and its length.
    //      Should be at least 32 bytes long for optimal security.
    void* key,
    size_t keylen,

    // [in]: The data to hash alongside the key.
    void* data,
    size_t datalen);

void freeme(void * ptr);

#ifdef __cplusplus
}
#endif  // __cplusplus

#endif  // _HMAC_SHA256_H_
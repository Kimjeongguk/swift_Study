//
//  npDefErr_u.h
//  IxKeypadManageHelper
//
//  Created by hildolfr on 2021/12/03.
//

#ifndef        _NPDEFERR_H_
#define        _NPDEFERR_H_

#define NPCRYPTO_SUCCESS                0x0000

///<--    Common Crypto error defines..
#define NPERR_FAIL_ALLOC_MEM            0x0001
#define NPERR_PARAM_NULL_POINT            0x0002
#define NPERR_SMALL_BUFFER_SIZE            0x0003
#define NPERR_FAIL_NEED_INITIALIZE        0x0004

#if    defined(_WIN32) || defined(_WIN64)
#define NPERR_DETECTED_DEBUGGER            0x0005
#endif

///<--    State error defines..
#if    !defined(__ANDROID__)
#define NPERR_WRONG_STATE_PARAM            0x0051
#endif
#define NPERR_FAIL_ERROR_STATE            0x0052

///<--    Self test error defines..
#define NPERR_FAIL_KAT_SHA256            0x0080
#define NPERR_FAIL_KAT_SHA512            0x0081
#define NPERR_FAIL_KAT_HMAC256            0x0082
#define NPERR_FAIL_KAT_HMAC512            0x0083
#define NPERR_FAIL_KAT_ARIA                0x0084
#define NPERR_FAIL_KAT_CTR_DRBG            0x0085
#define NPERR_FAIL_KAT_RSAES            0x0086
#define NPERR_FAIL_KAT_RSA_PSS            0x0087
#define    NPERR_FAIL_ENTROPY_HEALTH_TEST    0x0088

///<--    ARIA module error defines..
#define NPERR_ARIA_KEYGEN_FAIL            0x1100
#define NPERR_ARIA_ENCRYPT_FAIL            0x1101
#define NPERR_ARIA_DECRYPT_FAIL            0x1102

///<--    CTR_DRBG module error defines..
#define NPERR_CTR_DRBG_DUPLICATE_FAIL    0x1200

///<--  RSA OAEP module error defines..
#define NPERR_RSA_KEY_GEN_FAIL            0x1600
#define    NPERR_RSA_ENCRYPT_FAIL            0x1601
#define    NPERR_RSA_DECRYPT_FAIL            0x1602

///<--    RSA PSS module error defines..
#define NPERR_RSA_SIGN_GENERATE_FAIL    0x1700
#define NPERR_RSA_SIGN_VERIFY_FAIL        0x1701

///<--    INTERGRITY module error defines..
#define NPERR_FILE_INTEGRITY_FAIL        0x1800


#endif    // _NPDEFERR_H_

//
//  npExpCom_u.h
//  IxKeypadManageHelper
//
//  Created by hildolfr on 2021/12/03.
//

#ifndef _NPEXPCOM_H_
#define _NPEXPCOM_H_

#define    USE_CRT

#define        BOOL    int
#define        TRUE    1
#define        FALSE    0

///<--    variables type defines..
typedef void*                NP_HANDLE;
typedef unsigned int        NP_RET;
typedef unsigned char        UCHAR;
typedef unsigned int        UINT;
typedef unsigned int        UWORD;
typedef unsigned long long    UINT64;

///<-- nProtect Crypto State..
typedef enum
{
    NP_STATUS_LOADED        = 0x00000001,    // 암호 모듈 로드 상태
    NP_STATUS_TERMINATED    = 0x00000002,    // 암호 모듈 종료 상태
    NP_STATUS_TESTING        = 0x00000004,    // 암호 모듈 자가 시험 상태
    NP_STATUS_AUTHORIZED    = 0x00000008,    // 암호 모듈 사용 가능 상태
    NP_STAUTS_ERROR            = 0x00000010    // 암호 모듈 오류 상태
}NP_CRYPTO_STATE;


///<--    ARIA defines..
typedef enum
{
    OP_MODE_ECB = 1,
    OP_MODE_CBC
} ARIA_OP_MODE;

typedef enum
{
    ARIA_128 = 16,
    ARIA_192 = 24,
    ARIA_256 = 32
} ARIA_KEY_SIZE;

typedef struct _tag_sk_key_buffer
{
    ARIA_KEY_SIZE    _keysize;
    unsigned char    _key[32];
    unsigned char    _IV[16];
}ST_ARIA_KEY, *PST_ARIA_KEY;


///<--    SHA defines..
typedef enum
{
    SHA_256 = 32,
    SHA_512 = 64
} SHA_MD_TYPE;


///<--    RSA defines..
typedef enum
{
    RSA_2048 = 2048
} RSA_KEY_SIZE;


typedef struct _RSA_PUBLIC_KEY{
    unsigned int    bits;
    unsigned int    n_dat[66];
    unsigned int    e_dat[66];
} RSA_PUBLIC_KEY, *PRSA_PUBLIC_KEY;

typedef struct _RSA_PRIVATE_KEY{
    unsigned int    bits;
    unsigned int    n_dat[66];
    unsigned int    e_dat[66];
#if        defined(NO_USE_CRT)
    unsigned int    d_dat[66];
#elif    defined(USE_CRT)
    unsigned int    p_dat[66];
    unsigned int    q_dat[66];
    unsigned int    dmp1_dat[66];
    unsigned int    dmq1_dat[66];
    unsigned int    qimp_dat[66];
#endif
} RSA_PRIVATE_KEY, *PRSA_PRIVATE_KEY;

#endif    // _NPEXPCOM_H_

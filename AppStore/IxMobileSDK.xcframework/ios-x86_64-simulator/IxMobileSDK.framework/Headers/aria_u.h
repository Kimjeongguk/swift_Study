//
//  aria_u.h
//  IxKeypadManageHelper
//
//  Created by hildolfr on 2021/12/03.
//

#ifndef        _ARIA_H_
#define        _ARIA_H_

#include    "npExpCom_u.h"
#include    "npDefErr_u.h"


#define CRYPTO_INTERNAL_API

///<--    default cryption block size(byte)..
#define        ARIA_BLOCK_SIZE 16

///<--    Pad Value..
#define        PAD_VAL            0

///<--    ARIA macro defines..
#define _NP_CPY_BLOCK(_dst, _src)\
{\
    ((UINT*)(_dst))[0] = ((UINT*)(_src))[0];\
    ((UINT*)(_dst))[1] = ((UINT*)(_src))[1];\
    ((UINT*)(_dst))[2] = ((UINT*)(_src))[2];\
    ((UINT*)(_dst))[3] = ((UINT*)(_src))[3];\
}

//void    RotXOR( UCHAR *s, int n, UCHAR *t );
//void    DL( UCHAR *i, UCHAR *o );
void    NPC_KeySchedule(ST_ARIA_KEY *key, UINT *roundkey, BOOL IsDecrypt);
void    NPC_DoCryption( UINT *rk, UINT rounds, UCHAR out[16] );

#ifdef __cplusplus
extern "C" {
#endif

NP_RET NPC_SymKeyGen(ARIA_KEY_SIZE req_size, ST_ARIA_KEY *k);
NP_RET NPC_SymEncrypt(ST_ARIA_KEY *key, ARIA_OP_MODE mode, UCHAR *plainData, UINT plainDataLen, UCHAR *cipherData, UINT *cipherDataLen);
NP_RET NPC_SymDecrypt(ST_ARIA_KEY *key, ARIA_OP_MODE mode, UCHAR *cipherData, UINT cipherDataLen, UCHAR *plainData, UINT *plainDataLen);

#ifdef __cplusplus
};
#endif

#endif        // _ARIA_H_

//
//  KeyViewController.m
//  SecurityDemo
//
//  Created by 1 on 2018/11/1.
//  Copyright © 2018 Samuel. All rights reserved.
//

#import "KeyViewController.h"

@interface KeyViewController ()

@end

@implementation KeyViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    
//    [self cre atingAsymmetricKeyPair];
//    [self searchAsymmetricPrivateKey];
    
//    [self creatingAsymmetricKeyPairInSE];
    [self searchAsymmetricPrivateKeyInSE];
    
}

//生成非对称加密pair
-(void)creatingAsymmetricKeyPair{
    
    NSData* tag = [@"com.example.keys.mykey" dataUsingEncoding:NSUTF8StringEncoding];
    NSDictionary* attributes =
    @{ (id)kSecAttrKeyType:               (id)kSecAttrKeyTypeRSA,
       (id)kSecAttrKeySizeInBits:         @2048,
       (id)kSecPrivateKeyAttrs:
           @{ (id)kSecAttrIsPermanent:    @YES,
              (id)kSecAttrApplicationTag: tag,
              },
       };
    
    
    CFErrorRef error = NULL;
    SecKeyRef privateKey = SecKeyCreateRandomKey((__bridge CFDictionaryRef)attributes, &error);

    if (!privateKey) {
        NSError *err = CFBridgingRelease(error);  // ARC takes ownership
        // Handle the error. . .
        NSLog(@"%@",err);
        return;
    }

    SecKeyRef publicKey = SecKeyCopyPublicKey(privateKey);
    
    NSLog(@"privateKey = %@,publicKey = %@",privateKey,publicKey);
    
    if (publicKey)  { CFRelease(publicKey);  }
    if (privateKey) { CFRelease(privateKey); }
}


-(void)searchAsymmetricPrivateKey {
//    {
//        UUID = "55D0653D-F0D8-4085-B3E9-2646DA607A6B";
//        accc = "<SecAccessControlRef: 0x280e247e0>";
//        agrp = "U4TFFP6YD3.com.feiyu.SecurityDemo";
//        asen = 0;
//        atag = <636f6d2e 6578616d 706c652e 6b657973 2e6d796b 6579>;
//        bsiz = 2048;
//        cdat = "2018-11-01 07:24:47 +0000";
//        class = keys;
//        crtr = 0;
//        decr = 1;
//        drve = 0;
//        edat = "2001-01-01 00:00:00 +0000";
//        encr = 0;
//        esiz = 2048;
//        extr = 1;
//        kcls = 1;
//        klbl = <f702fd60 a56e45fd 2d2ce695 8f2b0406 3380e41e>;
//        mdat = "2018-11-01 07:24:47 +0000";
//        modi = 1;
//        musr = <>;
//        next = 0;
//        pdmn = ak;
//        perm = 1;
//        persistref = <>;
//        priv = 1;
//        sdat = "2001-01-01 00:00:00 +0000";
//        sens = 0;
//        sha1 = <f69b29eb f8929d7b cf85d7c6 73bd49e8 eda6f30c>;
//        sign = 1;
//        snrc = 0;
//        sync = 0;
//        tomb = 0;
//        type = 42;
//        unwp = 1;
//        "v_Data" = <308204a2 02010002 82010100 9402a58e 923b1d27 0affea07 cc0e639b e6dfe406 7512cd3b 124c763b ea6dac06 0de0e7ab 4e41828e 854210f9 095ceaa9 52b15efa 6c0d3d27 f0c911d8 3a50d555 c0ea4ade 939343cc a7d65de1 79c83777 6f645215 568aaee3 c418916a 9b14b69d 825c753e edd5ba55 70b60957 d755ce8b 04b34511 9b172166 900c0af4 8383ec20 38b2fa31 df04c78d 17f4def7 b95e6223 37d590d8 0b51744e 480937d0 0820e818 9a68cb7a 7261829f ef19c56c 514962eb 1aea2775 2bd4dc1d 728e0bc2 54eefe4c f49e83a3 0c1300ff 5c8026ab 3ddba44b bff35f14 7fd268fa f9af2656 a952f2cb 3bd9bd20 31558123 1bfd853b 309e4ed7 72c38b3a d5d06c73 803eea7f f526633d 02030100 01028201 00091855 351018fa d47486bf 9fa55de2 fd685aac b2958cc7 6365b4a0 caa8bffe d8a10f5c c7b8377f fecdadd4 1e2c2c48 ad33f6d0 9d21ce4f 1f93afbf 5d77f93c a018352d 799a3c41 3d23b921 56b8258c a7005cd1 4b1cb61e 98c2158d 10adcbea e17dea66 e2ac39bc 74009e3c 5a68a738 af193b02 37afe88e cb09cca6 505a7e87 a0114859 e941201e 336a79dc c00a169f 22004119 58312df7 b9e82457 b0660bbf 0427db92 48c076f1 24cc3c49 b92947d1 80910b6a d5fa700b faaf4eed 8e3e7d3a 4050fdcb 42472e4b 5f31cd75 1b84fb0c e6d619b9 efa8b067 84b014d8 4054e163 65f8259b e2228bf4 ef266331 269b7a45 1bf0b9ca 9082b5b9 5de0f160 66d8edb3 9f028181 00cf87f2 632f2687 ae97041a dd06e236 d24742c4 ea607664 a438bc64 aefa2da5 8e011e88 70fb4cb3 0a21346e b016ed30 93d4cb8d a3900b7f c3a82b1f b314721d 5259d362 45844593 6146639c c92d1fd4 aefaf76a 458af4b8 084645b9 48826bb3 e91a6322 bca74eed 913ff40e 765753ee b9bfba48 a6a106b1 aa36ba7a e4f43549 ef028181 00b69405 b95e3bc2 44469c09 4df9abd7 89372626 f34287af d269ada6 62070b3b 57de6542 3e360477 89d9bc3b e43906c9 096bc62f 5bf28e3f 5ebdc017 0d756395 a5d22a3e 8c989472 4d142703 0bafb6a3 3d03ab4b e20fb834 5be66439 5a3c1c4b fcc8bcfb 58c21900 7a02f61d 95b72161 063e1924 efdaacf8 8128eed6 821ded01 93028180 4af02b2d 778c3138 711db159 98afbcde 078f6bad ba7165fc 0ae4b472 9eb236f2 e5229260 41ce3b64 70030fe9 140e4819 49a0cb1f 81d73526 80a639c7 1f9de94a a056fd48 5ef004bc fe7edfd1 a132ba49 0924a842 3e6009c8 2b1fe83c efa3568e d8d16d6c b3f9833d 8cdb6311 868d2f49 f19aa1bb 51b02a1d 6dafbeca c8082a0f 0281804c a5ddb551 4b332628 a26f018e 34471af2 cd108305 462358e9 469e57fe ef072dbf 4eb13d9e bdc75556 d4402c72 8857b39d cc28aba8 2b718d1b 89dde3a7 89741496 2367f8ec 413daf00 2bd48a7e 6ce520c3 3e916fc8 fba2f785 c443938f 32adefe4 71f9eeec 2544def4 0950a83e a643ae34 39a8190d ab99f3d7 34555770 aac40302 81802093 4bfe43da a8a40d66 da06a457 63576b75 ff087616 46e9c1cd fc7ac32e 5ec50a6a 073b4c9e a8ddea8f 1677f79c fc0b9f57 e42ef6a1 cb6ab006 a4c718db f7ab0287 3348e86b 7ef81738 39b9aa46 c1cc9076 b5d45b34 ed423764 74fe482d 22e1e0e3 278ba69c 6ae734dc 92fbb1bf 2f092846 7877aa3d c90d244f 3bc4bb17 7486>;
//        "v_Ref" = "<SecKeyRef algorithm id: 1, key type: RSAPrivateKey, version: 4, block size: 2048 bits, addr: 0x280e24800>";
//        vrfy = 0;
//        vyrc = 0;
//        wrap = 0;
//    }

    NSData* tag = [@"com.example.keys.mykey" dataUsingEncoding:NSUTF8StringEncoding];
 
    NSDictionary *attributes = @{
                                 (id)kSecClass : (id)kSecClassKey,
                                 (id)kSecAttrApplicationTag : tag,
                                 (id)kSecReturnData : @(YES),
                                 (id)kSecReturnRef : @(YES),
                                 (id)kSecMatchLimit:(id)kSecMatchLimitOne,
                                 };
    
    CFTypeRef ref = NULL;
    OSStatus sanityCheck = SecItemCopyMatching((__bridge CFDictionaryRef)attributes, &ref);
    
    NSLog(@"%@", (__bridge id)SecCopyErrorMessageString(sanityCheck,NULL));
    //打印返回的item对象
    if (ref == NULL) return;
    
    NSLog(@"%@",ref);

//    将SecKeyRef转换为SecKeyData
    SecKeyRef keyRef = (__bridge SecKeyRef)(((__bridge NSDictionary *)ref)[@"v_Ref"]);
    [self convertSecKeyRefToSecKeyData:keyRef];

//    iOS10+加密
//    SecKeyRef publicKey = SecKeyCopyPublicKey((SecKeyRef)ref);
//    [self encryptDataWithKey:publicKey privateKey:(SecKeyRef)ref algorithm:kSecKeyAlgorithmRSAEncryptionOAEPSHA384];
    
//    iOS2.0+加密
//    SecKeyRef publicKey = SecKeyCopyPublicKey((SecKeyRef)ref);
//    [self encryptDataWithKey:publicKey privateKey:(SecKeyRef)ref];
    
//    iOS2.0+加密
    SecKeyRef publicKey = SecKeyCopyPublicKey((SecKeyRef)ref);
    [self signDataWithKey:publicKey privateKey:(SecKeyRef)ref];
    
}

-(void)convertSecKeyRefToSecKeyData:(SecKeyRef)keyRef{
    
    CFErrorRef error = NULL;
    CFDataRef dataRef = SecKeyCopyExternalRepresentation(keyRef, &error);
    if (!dataRef) {
        NSLog(@"%@",error);
        return;
    }
    NSLog(@"%@",dataRef);
}

#pragma mark - 在Secure Enclave生成私钥
-(void)creatingAsymmetricKeyPairInSE{
//    privateKey = <SecKeyRef:('com.apple.setoken') 0x2812aab80>,publicKey = <SecKeyRef curve type: kSecECCurveSecp256r1, algorithm id: 3, key type: ECPublicKey, version: 4, block size: 256 bits, y: 434D379DAAAD3F550FFA1265AB7041FDEE3E78A09F48C0897D100959DEFD461F, x: 16784B6165298FA772C23945D79CD6584DFF82DD41C367E7EDE9ADB762DFE0DB, addr: 0x100818470>
    SecAccessControlRef accessRef = SecAccessControlCreateWithFlags(NULL, kSecAttrAccessibleWhenUnlockedThisDeviceOnly, kSecAccessControlDevicePasscode|kSecAccessControlPrivateKeyUsage, NULL);
    
    NSData* tag = [@"com.privateKey.SEEEE" dataUsingEncoding:NSUTF8StringEncoding];
    NSDictionary* attributes =
    @{ (id)kSecAttrKeyType:               (id)kSecAttrKeyTypeECSECPrimeRandom,
       (id)kSecAttrKeySizeInBits:         @(256),
       (id)kSecAttrTokenID: (id)kSecAttrTokenIDSecureEnclave,
       (id)kSecPrivateKeyAttrs:
           @{ (id)kSecAttrIsPermanent:    @(YES),
              (id)kSecAttrApplicationTag: tag,
              (id)kSecAttrAccessControl:(__bridge id)accessRef,
              },
       };
    
    CFErrorRef error = NULL;
    SecKeyRef privateKey = SecKeyCreateRandomKey((__bridge CFDictionaryRef)attributes, &error);
    
    if (!privateKey) {
        NSError *err = CFBridgingRelease(error);  // ARC takes ownership
        // Handle the error. . .
        NSLog(@"%@",err);
        return;
    }
    
    SecKeyRef publicKey = SecKeyCopyPublicKey(privateKey);
    
    NSLog(@"privateKey = %@,publicKey = %@",privateKey,publicKey);
    
    if (publicKey)  { CFRelease(publicKey);  }
    if (privateKey) { CFRelease(privateKey); }
}


-(void)searchAsymmetricPrivateKeyInSE {
//    {
//        UUID = "C3F65498-EE66-49DA-9194-7C7D90E84E5A";
//        accc = "<SecAccessControlRef: 0x2810348a0>";
//        agrp = "U4TFFP6YD3.com.feiyu.SecurityDemo";
//        atag = <636f6d2e 70726976 6174654b 65792e53 45>;
//        bsiz = 256;
//        cdat = "2018-11-01 10:02:49 +0000";
//        class = keys;
//        crtr = 0;
//        decr = 0;
//        drve = 1;
//        edat = "2001-01-01 00:00:00 +0000";
//        encr = 0;
//        esiz = 256;
//        extr = 0;
//        kcls = 1;
//        klbl = <8c6198f5 3110c92e f7cc0c64 91b8b898 fbaaf931>;
//        mdat = "2018-11-01 10:02:49 +0000";
//        modi = 0;
//        musr = <>;
//        next = 1;
//        pdmn = dk;
//        perm = 1;
//        persistref = <>;
//        priv = 1;
//        sdat = "2001-01-01 00:00:00 +0000";
//        sha1 = <b5a07ce7 615c048c 9a17ee7d 76ad700f 36bfab07>;
//        sign = 1;
//        sync = 0;
//        tkid = "com.apple.setoken";
//        tomb = 0;
//        type = 73;
//        "v_Ref" = "<SecKeyRef:('com.apple.setoken') 0x283414f60>";
//        vrfy = 0;
//        wrap = 0;
//    }

    NSData* tag = [@"com.privateKey.SEEEE" dataUsingEncoding:NSUTF8StringEncoding];
    
    NSDictionary *attributes = @{
                                 (id)kSecClass : (id)kSecClassKey,
                                 (id)kSecAttrApplicationTag : tag,
                                 (id)kSecReturnData : @(YES),
                                 (id)kSecReturnRef : @(YES),
                                 (id)kSecMatchLimit:(id)kSecMatchLimitOne,
                                 };
    
    CFTypeRef ref = NULL;
    OSStatus sanityCheck = SecItemCopyMatching((__bridge CFDictionaryRef)attributes, &ref);
    
    NSLog(@"%@", (__bridge id)SecCopyErrorMessageString(sanityCheck,NULL));
    //打印返回的item对象
    if (ref == NULL) return;
    
    NSLog(@"%@",ref);
    
//    将SecKeyRef转换为SecKeyData
//    SecKeyRef keyRef = (__bridge SecKeyRef)(((__bridge NSDictionary *)ref)[@"v_Ref"]);
//    [self convertSecKeyRefToSecKeyData:keyRef];
    
    //加密解密
//    SecKeyRef publicKey = SecKeyCopyPublicKey((SecKeyRef)ref);
//    [self encryptDataWithKey:publicKey privateKey:(SecKeyRef)ref algorithm:kSecKeyAlgorithmECIESEncryptionStandardX963SHA384AESGCM];
    
    
//    SecKeyRef publicKey = SecKeyCopyPublicKey((SecKeyRef)ref);
//    [self signDataWithPrivateKey:(SecKeyRef)ref publicKeyalgorithm:publicKey algorithm:kSecKeyAlgorithmECDSASignatureMessageX962SHA512];
}

#pragma mark - iOS10+的加密解密
-(void)encryptDataWithKey:(SecKeyRef)publicKey privateKey:(SecKeyRef)privateKey algorithm:(SecKeyAlgorithm)algorithm {
    
//    CFDataRef SecKeyCreateEncryptedData(SecKeyRef key, SecKeyAlgorithm algorithm, CFDataRef plaintext, CFErrorRef  _Nullable *error);
    BOOL canEncrypt = SecKeyIsAlgorithmSupported(publicKey,
                                                 kSecKeyOperationTypeEncrypt,
                                                 algorithm);

    NSData* plainText = [@"哈哈哈哈" dataUsingEncoding:NSUTF8StringEncoding];
    canEncrypt &= ([plainText length] < (SecKeyGetBlockSize(publicKey)-130));

    NSData* cipherText = nil;
    if (canEncrypt) {
        CFErrorRef error = NULL;
        cipherText = (NSData*)CFBridgingRelease(      // ARC takes ownership
                                                SecKeyCreateEncryptedData(publicKey,
                                                                          algorithm,
                                                                          (__bridge CFDataRef)plainText,
                                                                          &error));

        if (!cipherText) {
            NSError *err = CFBridgingRelease(error);  // ARC takes ownership
            // Handle the error. . .
            NSLog(@"err = %@",err);
        }else{
            NSLog(@"cipherText = %@",cipherText);
            [self decryptDataPrivateKey:privateKey algorithm:algorithm data:cipherText];
        }
    }else{
        NSLog(@"无法加密");
    }
    
}

-(void)decryptDataPrivateKey:(SecKeyRef)privateKey algorithm:(SecKeyAlgorithm)algorithm data:(NSData *)cipherText{
    
//    CFDataRef SecKeyCreateDecryptedData(SecKeyRef key, SecKeyAlgorithm algorithm, CFDataRef ciphertext, CFErrorRef  _Nullable *error);
    
    // From keychain or identity
    BOOL canDecrypt = SecKeyIsAlgorithmSupported(privateKey,
                                                 kSecKeyOperationTypeDecrypt,
                                                 algorithm);

    canDecrypt &= ([cipherText length] == SecKeyGetBlockSize(privateKey));

    NSData* clearText = nil;
    if (canDecrypt) {
        CFErrorRef error = NULL;
        clearText = (NSData*)CFBridgingRelease(       // ARC takes ownership
                                               SecKeyCreateDecryptedData(privateKey,
                                                                         algorithm,
                                                                         (__bridge CFDataRef)cipherText,
                                                                         &error));
        if (!clearText) {
            NSError *err = CFBridgingRelease(error);  // ARC takes ownership
            // Handle the error. . .
            NSLog(@"err = %@",err);
        }else{
            NSLog(@"clearText = %@",[[NSString alloc]initWithData:clearText encoding:NSUTF8StringEncoding]);
        }
    }else{
        NSLog(@"无法解密");
    }
}


#pragma mark - iOS10+的签名验证
-(void)signDataWithPrivateKey:(SecKeyRef)privateKey publicKeyalgorithm:(SecKeyRef)publicKey algorithm:(SecKeyAlgorithm)algorithm{
  
    //CFDataRef SecKeyCreateSignature(SecKeyRef key, SecKeyAlgorithm algorithm, CFDataRef dataToSign, CFErrorRef  _Nullable *error);
    BOOL canSign = SecKeyIsAlgorithmSupported(privateKey,
                                              kSecKeyOperationTypeSign,
                                              algorithm);
    
    NSData* data2sign = [@"我就是我,不一样的烟火" dataUsingEncoding:NSUTF8StringEncoding];
    NSData* signature = nil;
    if (canSign) {
        CFErrorRef error = NULL;
        signature = (NSData*)CFBridgingRelease(       // ARC takes ownership
                                               SecKeyCreateSignature(privateKey,
                                                                     algorithm,
                                                                     (__bridge CFDataRef)data2sign,
                                                                     &error));
        if (!signature) {
            NSError *err = CFBridgingRelease(error);  // ARC takes ownership
            // Handle the error. . .
            NSLog(@"err = %@",err);
            
        }else{
            NSLog(@"signature = %@",signature);
            
            [self verifyDataWithPublicKeyalgorithm:publicKey algorithm:algorithm data2sign:data2sign signature:signature];
        }
    }else{
        NSLog(@"不支持签名");
    }
}

-(void)verifyDataWithPublicKeyalgorithm:(SecKeyRef)publicKey algorithm:(SecKeyAlgorithm)algorithm data2sign:(NSData *)data2sign signature:(NSData *)signature {

    //Boolean SecKeyVerifySignature(SecKeyRef key, SecKeyAlgorithm algorithm, CFDataRef signedData, CFDataRef signature, CFErrorRef  _Nullable *error);
    BOOL canVerify = SecKeyIsAlgorithmSupported(publicKey,
                                                kSecKeyOperationTypeVerify,
                                                algorithm);
    BOOL result = NO;
    if (canVerify) {
        CFErrorRef error = NULL;
        result = SecKeyVerifySignature(publicKey,
                                       algorithm,
                                       (__bridge CFDataRef)data2sign,
                                       (__bridge CFDataRef)signature,
                                       &error);
        if (!result) {
            NSError *err = CFBridgingRelease(error);  // ARC takes ownership
            // Handle the error. . .
            NSLog(@"err = %@",err);
        }else{
            NSLog(@"验证成功");
        }
    }else{
        NSLog(@"不支持验证");
    }
}


#pragma mark - iOS2.0+的加密解密
-(void)encryptDataWithKey:(SecKeyRef)publicKey privateKey:(SecKeyRef)privateKey{
    
    uint8_t encData[2048/8] = {0};
    size_t blockSize = 2048 / 8 ;
    NSData* plainText = [@"哈哈哈哈" dataUsingEncoding:NSUTF8StringEncoding];
    OSStatus sanityCheck = SecKeyEncrypt(publicKey, kSecPaddingPKCS1, plainText.bytes, plainText.length, encData, &blockSize);

    NSLog(@"加密%@",(__bridge id)SecCopyErrorMessageString(sanityCheck,NULL));
    
    
    uint8_t decArr[2048/8] = {0};
    SecKeyDecrypt(privateKey, kSecPaddingPKCS1, encData, blockSize, decArr, &blockSize);
    NSLog(@"解密%@",(__bridge id)SecCopyErrorMessageString(sanityCheck,NULL));

    NSData *decryData = [NSData dataWithBytes:decArr length:blockSize];
    NSString *decryStr = [[NSString alloc]initWithData:decryData encoding:NSUTF8StringEncoding];
    NSLog(@"%@",decryStr);
}

#pragma mark - iOS2.0+的签名
-(void)signDataWithKey:(SecKeyRef)publicKey privateKey:(SecKeyRef)privateKey{
    
    //1.签名
    NSData *dataToSign = [@"iOS2.0以下的签名" dataUsingEncoding:NSUTF8StringEncoding];
    uint8_t sig[2048/8] = {0};
    size_t blockSize = 2048 / 8 ;
    
    OSStatus sanityCheck = SecKeyRawSign(privateKey, kSecPaddingPKCS1SHA256, dataToSign.bytes, dataToSign.length, sig, &blockSize);
    NSLog(@"签名%@",(__bridge id)SecCopyErrorMessageString(sanityCheck,NULL));

    sanityCheck = SecKeyRawVerify(publicKey, kSecPaddingPKCS1SHA256, dataToSign.bytes, dataToSign.length, sig, blockSize);
    NSLog(@"验证%@",(__bridge id)SecCopyErrorMessageString(sanityCheck,NULL));
}



@end

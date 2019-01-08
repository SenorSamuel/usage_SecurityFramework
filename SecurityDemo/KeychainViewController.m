//
//  ViewController.m
//  SecurityDemo
//
//  Created by 1 on 2018/10/12.
//  Copyright © 2018 Samuel. All rights reserved.
//

#import "KeychainViewController.h"
#import <LocalAuthentication/LocalAuthentication.h>
@interface KeychainViewController ()<UITextViewDelegate>

@property (weak, nonatomic) IBOutlet UITextView *textView;

@property (strong,nonatomic) LAContext *context;

@end

@implementation KeychainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.context = [LAContext new];
}


- (NSString *)errormMessageWithOSStatus:(OSStatus)status{
    if (@available(iOS 11.3, *)) {
        return [NSString stringWithFormat:@"\n%@",(__bridge id)SecCopyErrorMessageString(status,NULL)];
    } else {
        // Fallback on earlier versions
        return [NSString stringWithFormat:@"\n%d",(int)status];
    }
}

//测试钥匙串创建
-(IBAction)testCreateKeychain {
    
    CFErrorRef error = NULL;
    SecAccessControlRef aclRef = SecAccessControlCreateWithFlags(NULL, kSecAttrAccessibleWhenUnlocked, kSecAccessControlDevicePasscode, &error);
    //创建一条类型为kSecClassGenericPassword，需要输入passcode验证的item
    NSDictionary *query = @{
                            (__bridge __strong id)kSecClass : (__bridge id)kSecClassGenericPassword,
                            (__bridge __strong id)kSecAttrAccount : @"Samuel",
                            (__bridge __strong id)kSecAttrService : @"samuel.testKeychain.com",
                            (__bridge __strong id)kSecValueData : [@"passwordOfSamuel" dataUsingEncoding:NSUTF8StringEncoding],
                            (__bridge __strong id)kSecAttrAccessControl : (__bridge_transfer id)aclRef
                            };
    OSStatus sanityCheck = SecItemAdd((__bridge CFDictionaryRef)(query), NULL);
    
    self.textView.text = [self.textView.text stringByAppendingString:[self errormMessageWithOSStatus:sanityCheck]];
}

-(IBAction)testSearchKeychain {
    
    //查找钥匙串中kSecClass = kSecClassGenericPassword，kSecAttrService = @"samuel.testKeychain.com"，查找前需要验证身份(创建时设置的ACL)，kSecMatchLimitOne返回来第一条符合搜索条件的记录，kSecUseAuthenticationContext可以把LAContext存放起来，下次就不需要验证
    NSDictionary *query = @{
                            (__bridge __strong id)kSecClass : (__bridge id)kSecClassGenericPassword,
                            (__bridge __strong id)kSecAttrService : @"samuel.testKeychain.com",
                            (__bridge __strong id)kSecReturnData:@(YES),
                            (__bridge __strong id)kSecReturnAttributes:@(YES),
                            (__bridge __strong id)kSecMatchLimit:(__bridge id)kSecMatchLimitOne,
                            (__bridge __strong id)kSecUseOperationPrompt : @"验证你的身份",
                            (__bridge __strong id)kSecUseAuthenticationContext:self.context
                            };

    CFTypeRef ref = NULL;
    OSStatus sanityCheck = SecItemCopyMatching((__bridge CFDictionaryRef)query, &ref);
    
    self.textView.text = [self.textView.text stringByAppendingString:[self errormMessageWithOSStatus:sanityCheck]];

    if (ref == NULL) return;

    /*打印返回的item对象
     {
     accc = "<SecAccessControlRef: 0x280ff2ea0>";
     acct = Samuel;
     agrp = "U4TFFP6YD3.com.feiyu.SecurityDemo";
     cdat = "2018-12-21 09:58:09 +0000";
     mdat = "2018-12-21 09:58:22 +0000";
     musr = <>;
     pdmn = ak;
     persistref = <>;
     sha1 = <89d35aef cab530c7 b69041e6 f5915ffb a737f9c6>;
     svce = "samuel.testKeychain.com";
     sync = 0;
     tomb = 0;
     "v_Data" = <6e657770 61737377 6f7264>;
     }
     */
    NSDictionary *dict = (__bridge_transfer NSDictionary *)ref;
    self.textView.text = [self.textView.text stringByAppendingString:dict.description];
    //获取其中的SecItemValue
    NSString *passwordData = [[NSString alloc]initWithData:dict[@"v_Data"] encoding:NSUTF8StringEncoding];
    self.textView.text = [self.textView.text stringByAppendingString:passwordData];
}


-(IBAction)testUpdateKeyChain{
    
    NSDictionary *query = @{
                            (__bridge __strong id)kSecClass : (__bridge id)kSecClassGenericPassword,
                            (__bridge __strong id)kSecAttrAccount : @"Samuel",
                            (__bridge __strong id)kSecAttrService : @"samuel.testKeychain.com",
                            };

    NSDictionary *updateAttributesDict = @{
                                           (__bridge __strong id)kSecValueData:[@"newpassword" dataUsingEncoding:NSUTF8StringEncoding]
                                           };
    
    OSStatus sanityCheck = SecItemUpdate((__bridge CFDictionaryRef)query, (__bridge CFDictionaryRef)updateAttributesDict);

    self.textView.text = [self.textView.text stringByAppendingString:[self errormMessageWithOSStatus:sanityCheck]];

}

-(IBAction)testDeleteKeychain{
    
    NSDictionary *query = @{
                            (__bridge __strong id)kSecClass : (__bridge id)kSecClassGenericPassword,
                            (__bridge __strong id)kSecAttrAccount : @"Samuel",
                            (__bridge __strong id)kSecAttrService : @"samuel.testKeychain.com",
                            };
    
    OSStatus sanityCheck = SecItemDelete((__bridge CFDictionaryRef)query);
    
    self.textView.text = [self.textView.text stringByAppendingString:[self errormMessageWithOSStatus:sanityCheck]];
}

@end

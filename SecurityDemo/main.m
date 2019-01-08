//
//  main.m
//  SecurityDemo
//
//  Created by 1 on 2018/10/12.
//  Copyright © 2018 Samuel. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"

int main(int argc, char * argv[]) {
    @autoreleasepool {
        return UIApplicationMain(argc, argv, nil, NSStringFromClass([AppDelegate class]));
    }
}

////测试文件创建的保护等级
//-(void)testFileCreate {
//
//    NSString *filePath = [NSString stringWithFormat:@"%@/Documents/test1.plist",NSHomeDirectory()];
//
//    if ([[NSFileManager defaultManager] createFileAtPath:filePath contents:[@"hello world" dataUsingEncoding: NSUTF8StringEncoding] attributes:@{NSFileProtectionKey:NSFileProtectionComplete}]) {
//        NSLog(@"创建成功");
//        NSDictionary *fileAttrs=[[NSFileManager defaultManager] attributesOfItemAtPath:filePath error:nil];
//        NSLog(@"文件的基本信息  %@",fileAttrs);
//    };
//}

//
//  ContainerViewController.m
//  SecurityDemo
//
//  Created by 1 on 2018/12/11.
//  Copyright © 2018 Samuel. All rights reserved.
//

#import "ContainerViewController.h"

#import "KeychainViewController.h"
#import "SecureEnclaveViewController.h"
@interface ContainerViewController ()

@end

@implementation ContainerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}


- (IBAction)keychainBtnDidClick:(id)sender {

    UIStoryboard *sb = [UIStoryboard storyboardWithName:@"Main" bundle:nil];

    KeychainViewController *keychainVc = [sb instantiateViewControllerWithIdentifier:@"KeychainViewController"];

    [self.navigationController pushViewController:keychainVc animated:YES];
}

- (IBAction)secureEnclaveBtnDidClick:(id)sender {
    
    UIStoryboard *sb = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    
    SecureEnclaveViewController *sepVC = [sb instantiateViewControllerWithIdentifier:@"SecureEnclaveViewController"];
    
    [self.navigationController pushViewController:sepVC animated:YES];
}

@end

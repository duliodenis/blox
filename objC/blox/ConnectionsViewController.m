//
//  ConnectionsViewController.m
//  blox
//
//  Created by Dulio Denis on 6/24/15.
//  Copyright (c) 2015 Dulio Denis. All rights reserved.
//

#import "ConnectionsViewController.h"
#import <FBSDKCoreKit/FBSDKCoreKit.h>
#import <FBSDKLoginKit/FBSDKLoginKit.h>

@interface ConnectionsViewController ()

@end

@implementation ConnectionsViewController

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [FBSDKLoginButton class]; // load FBSDKLoginButton before the connection view displays
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    if ([FBSDKAccessToken currentAccessToken]) {
        // User is logged in to FB already - change FB button
        UIAlertController * alert=   [UIAlertController
                                      alertControllerWithTitle:@"FB Logged In"
                                      message:@"You Are Already Logged In To Facebook"
                                      preferredStyle:UIAlertControllerStyleAlert];
        
        [self presentViewController:alert animated:YES completion:nil];
    }
}

@end

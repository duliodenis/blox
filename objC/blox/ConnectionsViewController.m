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
        // Get Profile Info
        if ([FBSDKAccessToken currentAccessToken]) {
            [[[FBSDKGraphRequest alloc] initWithGraphPath:@"me" parameters:nil]
             startWithCompletionHandler:^(FBSDKGraphRequestConnection *connection, id result, NSError *error) {
                 if (!error) {
                     NSLog(@"fetched user:%@", result);
                 }
             }];
        }
    }
}

@end

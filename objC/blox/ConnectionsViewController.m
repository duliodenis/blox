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

            /* Confirmed working for posting on FB Wall - move to PostViewController
             
            FBSDKLoginManager *login = [[FBSDKLoginManager alloc] init];

            // request publish access
            [login logInWithPublishPermissions:@[@"publish_actions"] handler:^(FBSDKLoginManagerLoginResult *result, NSError *error) {
                if (error) {
                    // Process error
                } else if (result.isCancelled) {
                    // Handle cancellations
                } else {
                    // check if specific permissions is granted
                    if ([result.grantedPermissions containsObject:@"publish_actions"]) {
                        // Post on Wall
                        if ([[FBSDKAccessToken currentAccessToken] hasGranted:@"publish_actions"]) {
                            [[[FBSDKGraphRequest alloc]
                              initWithGraphPath:@"me/feed"
                              parameters: @{ @"message" : @"hello, world."}
                              HTTPMethod:@"POST"]
                             startWithCompletionHandler:^(FBSDKGraphRequestConnection *connection, id result, NSError *error) {
                                 if (!error) {
                                     NSLog(@"Post id:%@", result[@"id"]);
                                 }
                             }];
                        }
                    }
                }
            }];
*/

        }
    }
}

@end

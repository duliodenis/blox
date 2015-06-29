//
//  PostViewController.m
//  blox
//
//  Created by Dulio Denis on 6/28/15.
//  Copyright (c) 2015 Dulio Denis. All rights reserved.
//

#import "ComposeViewController.h"
#import <FBSDKCoreKit/FBSDKCoreKit.h>
#import <FBSDKLoginKit/FBSDKLoginKit.h>

@interface ComposeViewController ()
@property (weak, nonatomic) IBOutlet UITextView *post;

@end

@implementation ComposeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"compose";
}

- (IBAction)postMessage:(id)sender {
    
    if (self.post.text.length > 0) {
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
                          parameters: @{ @"message" : self.post.text}
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
    }
}

@end

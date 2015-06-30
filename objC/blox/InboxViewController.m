//
//  InboxViewController.m
//  blox
//
//  Created by Dulio Denis on 6/26/15.
//  Copyright (c) 2015 Dulio Denis. All rights reserved.
//

#import "InboxViewController.h"
#import "SWRevealViewController.h"
#import <FBSDKCoreKit/FBSDKCoreKit.h>

@interface InboxViewController () <UITableViewDataSource, UITableViewDelegate, SWRevealViewControllerDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *menuBarButtonItem;
@property (nonatomic) NSMutableArray *stream;

@end

@implementation InboxViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.stream = [NSMutableArray array];
    
    // Read your Facebook feed, parse and push into self.stream
    if ([FBSDKAccessToken currentAccessToken]) {
        // Get Feed
        if ([FBSDKAccessToken currentAccessToken]) {
            [[[FBSDKGraphRequest alloc] initWithGraphPath:@"me" parameters:nil]
             startWithCompletionHandler:^(FBSDKGraphRequestConnection *connection, id result, NSError *error) {
                 if (!error) {
                     // get profile ID - this will eventually be kept in the database
                     //NSString *graphPath = [NSString stringWithFormat:@"/%@/feed", result[@"id"]];
                     
                     // use hardcoded user to test
                     NSString *graphPath = [NSString stringWithFormat:@"/137893439617162/feed"];
                     [[[FBSDKGraphRequest alloc] initWithGraphPath:graphPath parameters:nil]
                      startWithCompletionHandler:^(FBSDKGraphRequestConnection *connection, id feed, NSError *error) {
                          if (!error) {
                              // parse feed result
                              // NSLog(@"fetched feed:%@", feed);
                              NSArray *list = [feed valueForKey:@"data"];

                              for (NSDictionary *dic in list) {
                                  //NSLog(@"id : %@",[dic valueForKey:@"id"]);
                                  //NSLog(@"type : %@",[dic valueForKey:@"type"]);
                                  if ([[dic valueForKey:@"type"] isEqualToString:@"status"]) {
                                      NSLog(@"- message : %@",[dic valueForKey:@"message"]);
                                      [self.stream addObject:[dic valueForKey:@"message"]];
                                  } else if([[dic valueForKey:@"type"] isEqualToString:@"link"]){
                                      //NSLog(@"- link : %@",[dic valueForKey:@"link"]);
                                  } else if([[dic valueForKey:@"type"] isEqualToString:@"photo"]){
                                      //NSLog(@"- icon : %@",[dic valueForKey:@"icon"]);
                                      NSLog(@"- message : %@",[dic valueForKey:@"message"]);
                                  }
                                  NSLog(@"------");
                              }
                              dispatch_async(dispatch_get_main_queue(), ^{
                                  [self.tableView reloadData];
                              });
                          }
                      }];
                 }
             }];
        }
    }
    
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
    // The Left Bar Button: the Slide Out Menu
    self.revealViewController.delegate = self;
    self.menuBarButtonItem.target = self.revealViewController;
    self.menuBarButtonItem.action = @selector(revealToggle:);
    [self.view addGestureRecognizer:self.revealViewController.panGestureRecognizer];
}


#pragma mark - TableView Delegate Methods

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Cell"];
    }
    
    cell.textLabel.text = self.stream[indexPath.row];
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.stream.count;
}

@end

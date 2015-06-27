//
//  InboxViewController.m
//  blox
//
//  Created by Dulio Denis on 6/26/15.
//  Copyright (c) 2015 Dulio Denis. All rights reserved.
//

#import "InboxViewController.h"

@interface InboxViewController () <UITableViewDataSource, UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic) NSArray *stream;

@end

@implementation InboxViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.stream = @[@"Hello, World.", @"Second Post"];
    
    // Read Facebook Stream and push into self.stream
    
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
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

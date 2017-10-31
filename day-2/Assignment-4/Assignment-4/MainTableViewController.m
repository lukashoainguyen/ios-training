//
//  MainTableViewController.m
//  Assignment-4
//
//  Created by Nguyen Hoai on 10/30/17.
//  Copyright © 2017 Nguyen-Hoai. All rights reserved.
//

#import "MainTableViewController.h"
#import "ViewController.h"

@interface MainTableViewController ()

@end

@implementation MainTableViewController

@synthesize myData;

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    myData = [self getJsonFile];
    [self getJsonFile];
}

- (void)viewDidAppear:(BOOL)animated {
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)getJsonFile {
    [[[NSURLSession sharedSession] dataTaskWithURL:[NSURL URLWithString:@"https://jsonplaceholder.typicode.com/users/"] completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        NSArray *myArray = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableLeaves error:nil];
//        NSLog(@"Data: %@", myArray);
        myData = myArray;
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.tableView reloadData];
        });
    }]resume];
}

- (NSArray *)getJsonFromAPI {
    NSString *path = @"https://jsonplaceholder.typicode.com/users/";
    NSURL *url = [NSURL URLWithString:path];
    NSData *jsonData = [[NSData alloc] initWithContentsOfURL:url];
    NSArray *array = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableLeaves error:NULL];
    return array;
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return myData.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    MyTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"mainCell" forIndexPath:indexPath];
    [cell setBackgroundColor:[UIColor colorWithRed:0.31 green:0.68 blue:0.33 alpha:1.0]];
    
    id item = myData[indexPath.row];
    cell.avatar.image = [UIImage imageNamed:@"user-image"];
    
    cell.name.text = item[@"name"];
    cell.name.textColor = [UIColor colorWithRed:1.00 green:1.00 blue:1.00 alpha:1.0];
    
    cell.email.text = item[@"email"];
    cell.email.textColor = [UIColor colorWithRed:0.86 green:0.86 blue:0.86 alpha:1.0];
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 100;
}

- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    NSIndexPath *path = [self.tableView indexPathForSelectedRow];
    ViewController *data;
    id item = myData[path.row];
    data = [segue destinationViewController];
    data.userData = item;
}

@end

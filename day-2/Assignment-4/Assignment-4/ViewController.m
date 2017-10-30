//
//  ViewController.m
//  Assignment-4
//
//  Created by Nguyen Hoai on 10/30/17.
//  Copyright © 2017 Nguyen-Hoai. All rights reserved.
//

#import "ViewController.h"
#import "SubTableViewCell.h"

@interface ViewController ()<UITableViewDataSource, UITableViewDelegate> {
    
}

@end

@implementation ViewController
@synthesize userData, myArray, avatar, name, email, phone, infoBg, taskBg;

- (void)viewDidLoad {
    [super viewDidLoad];
    infoBg.backgroundColor = [UIColor colorWithRed:0.31 green:0.68 blue:0.33 alpha:1.0];
    taskBg.backgroundColor = [UIColor colorWithRed:0.55 green:0.76 blue:0.32 alpha:1.0];
    avatar.image = [UIImage imageNamed:@"user-image"];
    name.text = userData[@"name"];
    email.text = userData[@"email"];
    phone.text = userData[@"phone"];
    myArray = [self getJsonFile];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (NSArray *)getJsonFile {
    NSString *path = @"https://jsonplaceholder.typicode.com/todos?userId=";
    NSString *fullPath = [NSString stringWithFormat:@"%@%@", path, userData[@"id"]];
    NSURL *url = [NSURL URLWithString:fullPath];
    NSData *data = [[NSData alloc] initWithContentsOfURL:url];
    NSArray *array = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableLeaves error:NULL];
    return array;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return myArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    SubTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"subCell"];
    id item = myArray[indexPath.row];
    cell.taskName.text = item[@"title"];
    NSString *processStatus;
    if ([item[@"completed"] boolValue] == YES) {
        processStatus = @"COMPLETED";
        cell.processStatus.textColor = [UIColor colorWithRed:0.43 green:0.73 blue:0.44 alpha:1.0];
    } else {
        processStatus = @"IN PROGRESS";
        cell.processStatus.textColor = [UIColor colorWithRed:0.99 green:0.70 blue:0.32 alpha:1.0];
    }
    cell.processStatus.text = processStatus;
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 100;
}


@end

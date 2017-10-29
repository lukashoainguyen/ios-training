//
//  ViewController.m
//  Assignment-3
//
//  Created by DXC-Technology on 10/27/17.
//  Copyright © 2017 lukasnguyen. All rights reserved.
//

#import "ViewController.h"
#import "SubTableViewCell.h"
@interface ViewController ()<UITableViewDataSource, UITableViewDelegate> {
    
}

@end

@implementation ViewController

@synthesize myUserData, myOrderDetail, userAvatar, userName, address, phone, email, myTable;

- (void)viewDidLoad {
    [super viewDidLoad];
    myOrderDetail = myUserData[@"orderDetails"];
    userAvatar.image = [UIImage imageNamed:myUserData[@"avatar"]];
    userName.text = myUserData[@"userName"];
    address.text = myUserData[@"address"];
    phone.text = myUserData[@"phoneNumber"];
    email.text = myUserData[@"email"];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return myOrderDetail.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    SubTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    id keyValue = myOrderDetail[indexPath.row];
    cell.subLabelOne.text = keyValue[@"itemName"];
    cell.subImage.image = [UIImage imageNamed:keyValue[@"image"]];
    NSString *unit;
    if ([keyValue[@"type"] isEqualToString:@"table"]) {
        unit = @"table(s)";
    } else {
        unit = @"bottle";
    }
    cell.subLabelTwo.text = [NSString stringWithFormat:@"%@ %@", keyValue[@"amount"], unit];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 60;
}


@end

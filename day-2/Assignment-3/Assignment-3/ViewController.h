//
//  ViewController.h
//  Assignment-3
//
//  Created by DXC-Technology on 10/27/17.
//  Copyright © 2017 lukasnguyen. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface ViewController : UIViewController
@property NSDictionary *myUserData;
@property NSArray *myOrderDetail;

@property (weak, nonatomic) IBOutlet UIImageView *userAvatar;

@property (weak, nonatomic) IBOutlet UILabel *userName;

@property (weak, nonatomic) IBOutlet UILabel *address;

@property (weak, nonatomic) IBOutlet UILabel *phone;

@property (weak, nonatomic) IBOutlet UILabel *email;

@property (weak, nonatomic) IBOutlet UITableView *myTable;

@end


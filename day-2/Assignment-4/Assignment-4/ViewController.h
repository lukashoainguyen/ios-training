//
//  ViewController.h
//  Assignment-4
//
//  Created by Nguyen Hoai on 10/30/17.
//  Copyright © 2017 Nguyen-Hoai. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
@property NSDictionary *userData;
@property NSArray *myArray;

@property (weak, nonatomic) IBOutlet UIImageView *avatar;
@property (weak, nonatomic) IBOutlet UILabel *name;
@property (weak, nonatomic) IBOutlet UILabel *email;
@property (weak, nonatomic) IBOutlet UILabel *phone;
@property (weak, nonatomic) IBOutlet UIView *infoBg;
@property (weak, nonatomic) IBOutlet UIView *taskBg;

@end


//
//  MyTableViewCell.h
//  Assignment-4
//
//  Created by Nguyen Hoai on 10/30/17.
//  Copyright © 2017 Nguyen-Hoai. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MyTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *avatar;
@property (weak, nonatomic) IBOutlet UILabel *name;
@property (weak, nonatomic) IBOutlet UILabel *email;


@end

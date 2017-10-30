//
//  SubTableViewCell.h
//  Assignment-4
//
//  Created by Nguyen Hoai on 10/31/17.
//  Copyright © 2017 Nguyen-Hoai. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SubTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *taskName;
@property (weak, nonatomic) IBOutlet UILabel *processStatus;

@end

//
//  RememberTableViewCell.h
//  Remember Me
//
//  Created by Ryan Wahle on 6/14/15.
//  Copyright (c) 2015 Ryan Wahle. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RMRemember.h"

@interface RememberTableViewCell : UITableViewCell

- (void)updateCellWithModel:(RMRemember *)rememberModel andTableView:(UITableView *)tableView;

@end

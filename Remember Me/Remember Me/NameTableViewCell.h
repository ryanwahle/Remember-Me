//
//  NameTableViewCell.h
//  Remember Me
//
//  Created by Ryan Wahle on 6/10/15.
//  Copyright (c) 2015 Ryan Wahle. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RMName.h"

@interface NameTableViewCell : UITableViewCell

- (void)updateCellWithModel:(RMName *)nameModel andTableView:(UITableView *)tableView;

@end



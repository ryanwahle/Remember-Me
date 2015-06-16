//
//  RememberTableViewCell.m
//  Remember Me
//
//  Created by Ryan Wahle on 6/14/15.
//  Copyright (c) 2015 Ryan Wahle. All rights reserved.
//

#import "RememberTableViewCell.h"

@interface RememberTableViewCell ()

@property RMRemember *rememberModel;

@property (weak, nonatomic) UITableView *tableView;

@end

@implementation RememberTableViewCell

- (void)updateCellWithModel:(RMRemember *)rememberModel andTableView:(UITableView *)tableView {
    self.rememberModel = rememberModel;
    self.tableView = tableView;
    
    self.textLabel.text = self.rememberModel.remember;
    self.detailTextLabel.text = self.rememberModel.information;
}

@end

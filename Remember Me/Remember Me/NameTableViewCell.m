//
//  NameTableViewCell.m
//  Remember Me
//
//  Created by Ryan Wahle on 6/10/15.
//  Copyright (c) 2015 Ryan Wahle. All rights reserved.
//

#import "NameTableViewCell.h"
#import "RMName.h"

@interface NameTableViewCell ()

@property RMName *nameModel;

@property (weak, nonatomic) UITableView *tableView;
@property (weak, nonatomic) IBOutlet UILabel *nameUILabel;

@end

@implementation NameTableViewCell

- (void)updateCellWithModel:(RMName *)nameModel andTableView:(UITableView *)tableView {
    self.nameModel = nameModel;
    self.tableView = tableView;
    
    self.nameUILabel.text = self.nameModel.name;
}

- (IBAction)buttonDelete:(id)sender {
    NSLog(@"%@ deleted and tableview reloaded", self.nameModel.name);
    
    [[RLMRealm defaultRealm] beginWriteTransaction];
    [[RLMRealm defaultRealm] deleteObject:self.nameModel];
    [[RLMRealm defaultRealm] commitWriteTransaction];
    
    //[self.tableView reloadData];
    [self.tableView deleteRowsAtIndexPaths:@[[self.tableView indexPathForCell:self]] withRowAnimation:UITableViewRowAnimationAutomatic];
    //[self.tableView indexPathForCell:self];
}

@end

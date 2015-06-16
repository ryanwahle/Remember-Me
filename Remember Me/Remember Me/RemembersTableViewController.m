//
//  RemembersTableViewController.m
//  Remember Me
//
//  Created by Ryan Wahle on 6/14/15.
//  Copyright (c) 2015 Ryan Wahle. All rights reserved.
//

#import "RemembersTableViewController.h"
#import "RememberTableViewCell.h"

@implementation RemembersTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];

}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return self.nameModel.remembers.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    RememberTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TableViewCellRemember" forIndexPath:indexPath];
    
    [cell updateCellWithModel:self.nameModel.remembers[indexPath.row] andTableView:tableView];
    
    return cell;
}


- (IBAction)buttonAdd:(id)sender {
    UIAlertController *alertControllerAdd = [UIAlertController alertControllerWithTitle:@"Remember Something New"
                                                                                message:@"What do you wish to remember?"
                                                                         preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleCancel handler:^(UIAlertAction *action) {}];
    
    UIAlertAction *addAction = [UIAlertAction actionWithTitle:@"Save" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
        UITextField *remember = alertControllerAdd.textFields[0];
        UITextField *information = alertControllerAdd.textFields[1];
        
        RMRemember *newRememberModel = [RMRemember new];
        newRememberModel.remember = remember.text;
        newRememberModel.information = information.text;
        
        [[RLMRealm defaultRealm] beginWriteTransaction];
        [self.nameModel.remembers addObject:newRememberModel];
        [[RLMRealm defaultRealm] commitWriteTransaction];
        
        dispatch_async(dispatch_get_main_queue(), ^{
            [UIView transitionWithView:self.tableView
                              duration:0.5f
                               options:UIViewAnimationOptionTransitionCrossDissolve
                            animations:^(void) { [self.tableView reloadData]; }
                            completion:nil];
        });
        
    }];
    
    
    [alertControllerAdd addTextFieldWithConfigurationHandler:^(UITextField *textField) {
        textField.placeholder = @"Remember What?";
    }];
    
    [alertControllerAdd addTextFieldWithConfigurationHandler:^(UITextField *textField) {
        textField.placeholder = @"The thing you need to remember . . .";
    }];

    
    [alertControllerAdd addAction:addAction];
    [alertControllerAdd addAction:cancelAction];
    
    [self presentViewController:alertControllerAdd animated:YES completion:nil];
}


@end

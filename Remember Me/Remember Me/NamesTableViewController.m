//
//  NamesTableViewController.m
//  Remember Me
//
//  Created by Ryan Wahle on 6/10/15.
//  Copyright (c) 2015 Ryan Wahle. All rights reserved.
//

#import "NamesTableViewController.h"

#import <Realm/Realm.h>
#import "RMName.h"
#import "NameTableViewCell.h"

@interface NamesTableViewController ()
@property RLMResults *names;
@end

@implementation NamesTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.names = [[RMName allObjects] sortedResultsUsingProperty:@"name" ascending:YES];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return self.names.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NameTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TableViewCellName" forIndexPath:indexPath];
    
    [cell updateCellWithModel:self.names[indexPath.row] andTableView:tableView];
    
    return cell;
}

- (IBAction)buttonAdd:(id)sender {
    UIAlertController *alertControllerAdd = [UIAlertController alertControllerWithTitle:@"Remember Somebody New"
                                                                                message:@"Whom do you wish to remember?"
                                                                         preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleCancel handler:^(UIAlertAction *action) {}];
    
    UIAlertAction *addAction = [UIAlertAction actionWithTitle:@"Save" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
        UITextField *name = alertControllerAdd.textFields[0];
        
        RMName *newNameModel = [RMName new];
        newNameModel.name = name.text;
        
        [[RLMRealm defaultRealm] beginWriteTransaction];
        [[RLMRealm defaultRealm] addObject:newNameModel];
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
        textField.placeholder = @"";
    }];
    
    [alertControllerAdd addAction:addAction];
    [alertControllerAdd addAction:cancelAction];
    
    [self presentViewController:alertControllerAdd animated:YES completion:nil];
}


//- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
//    // Do not remove. Needed for swipe to delete
//}
//
//- (NSArray *)tableView:(UITableView *)tableView editActionsForRowAtIndexPath:(NSIndexPath *)indexPath {
//    UITableViewRowAction *deleteAction = [UITableViewRowAction rowActionWithStyle:UITableViewRowActionStyleNormal title:@"" handler:^(UITableViewRowAction *action, NSIndexPath *indexPath) {
//        NSLog(@"row was deleted");
//    }];
//    
//    deleteAction.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"iconTrash"]];
//    
//    return @[deleteAction];
//}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

@end

//
//  CreatureVCViewController.m
//  WeekTwoDayTwo
//
//  Created by Jamar Gibbs on 1/19/16.
//  Copyright © 2016 M1ndful M3d1a. All rights reserved.
//

#import "CreatureVCViewController.h"

@interface CreatureVCViewController () <UITableViewDelegate,UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITextField *textField;
@property (weak, nonatomic) IBOutlet UITextField *weaponTextField;
@property (weak, nonatomic) IBOutlet UILabel *descriptionLabel;
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation CreatureVCViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = self.creature.name;
    self.textField.hidden = YES;
    self.weaponTextField.hidden = YES;
    self.descriptionLabel.text = [NSString stringWithFormat:@"%@ Fights with a %@", self.creature.name, self.creature.weapon ];
}

- (IBAction)editButtonTapped:(UIBarButtonItem *)sender {
    if ([sender.title isEqualToString:@"Done"]) {
        self.textField.hidden = YES;
        self.weaponTextField.hidden =YES;
        self.creature.name = self.textField.text;
        
        NSUInteger index = [self.weapons indexOfObject:self.creature.weapon];
        
        self.creature.weapon = self.weaponTextField.text;
        self.weapons[index] = self.weaponTextField.text;
        
        self.title = self.textField.text;
        sender.title = @"Edit";
        self.weaponTextField.text =@"";
        self.textField.text = @"";
        self.descriptionLabel.text = [NSString stringWithFormat:@"%@ Fights with a %@", self.creature.name, self.creature.weapon ];
        
        [self.tableView reloadData];
    }
    else {
        self.textField.hidden = NO;
        self.weaponTextField.hidden = NO;
        sender.title = @"Done";
    }
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"weaponCell"];
    cell.textLabel.text = self.weapons[indexPath.row];
    return cell;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.weapons.count;
}



/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

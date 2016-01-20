//
//  CreatureVCViewController.m
//  WeekTwoDayTwo
//
//  Created by Jamar Gibbs on 1/19/16.
//  Copyright © 2016 M1ndful M3d1a. All rights reserved.
//

#import "CreatureVCViewController.h"

@interface CreatureVCViewController ()
@property (weak, nonatomic) IBOutlet UITextField *textField;

@end

@implementation CreatureVCViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = self.creature.name;
    self.textField.hidden = YES;
}

- (IBAction)editButtonTapped:(UIBarButtonItem *)sender {
    if ([sender.title isEqualToString:@"Done"]) {
        self.textField.hidden = YES;
        self.creature.name = self.textField.text;
        self.title = self.textField.text;
        sender.title = @"Edit";
    }
    else {
        self.textField.hidden = NO;
        sender.title = @"Done";
        
    }
    
    
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

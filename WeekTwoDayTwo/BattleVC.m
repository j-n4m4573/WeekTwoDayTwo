//
//  BattleVC.m
//  WeekTwoDayTwo
//
//  Created by Jamar Gibbs on 1/19/16.
//  Copyright © 2016 M1ndful M3d1a. All rights reserved.
//

#import "BattleVC.h"

@interface BattleVC ()

@property (weak, nonatomic) IBOutlet UILabel *battleLabel;
@property (weak, nonatomic) IBOutlet UIImageView *battleImage;

@end

@implementation BattleVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.battleLabel.text = [NSString stringWithFormat:@"%@ fought %@ and %@ won with a %@,",self.fighter1.name, self.fighter2.name,self.fighter1.name, self.fighter1.weapon];
    self.battleImage.image = self.fighter1.picture;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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

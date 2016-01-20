//
//  ViewController.m
//  WeekTwoDayTwo
//
//  Created by Jamar Gibbs on 1/19/16.
//  Copyright © 2016 M1ndful M3d1a. All rights reserved.
//

#import "ViewController.h"
#import "MagicalCreature.h"
#import "CreatureVCViewController.h"
#import "BattleVC.h"

@interface ViewController () <UITableViewDelegate, UITableViewDataSource>

@property NSMutableArray *creatures;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UITextField *textField;
@property (weak, nonatomic) IBOutlet UITextField *weaponTextField;
@property NSMutableArray *weapons;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.weapons = [NSMutableArray new]; 
    MagicalCreature *creature1 = [MagicalCreature new];
    creature1.name =@"Larry";
    creature1.weapon =@"LightSaber";
    creature1.picture = [UIImage imageNamed:@"0.jpg"];
    self.weapons[0] = creature1.weapon;
    
    MagicalCreature *creature2 = [MagicalCreature new];
    creature2.name  = @"Chris";
    creature2.weapon =@"Whip";
    creature2.picture = [UIImage imageNamed:@"1.jpg"];
    self.weapons[1] = creature2.weapon;


    MagicalCreature *creature3 = [MagicalCreature new];
    creature3.name = @"Jack";
    creature3.weapon =@"Battle Axe";
    creature3.picture = [UIImage imageNamed:@"2.jpg"];
    self.weapons[2] = creature3.weapon;

    
    self.creatures = [[NSMutableArray alloc] initWithObjects:creature1,creature2,creature3, nil];
}
-(void)viewWillAppear:(BOOL)animated {
    [self.tableView reloadData];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    MagicalCreature *creature = [self.creatures objectAtIndex:indexPath.row];
    cell.textLabel.text = creature.name;
    cell.detailTextLabel.text = creature.weapon;
    cell.imageView.image = creature.picture;
    return cell;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.creatures.count;
}
- (IBAction)onAddButtonTapped:(id)sender {
    if (![self.textField.text isEqualToString:@""] && ![self.weaponTextField.text isEqualToString:@""]) {
    MagicalCreature *creature = [[MagicalCreature alloc]initWithName:self.textField.text];
        creature.weapon = self.weaponTextField.text;
        [self.weapons addObject:creature.weapon];
        creature.picture = [UIImage imageNamed:[NSString stringWithFormat:@"%lu.jpg",(unsigned long)self.creatures.count]]; 
        [self.creatures addObject:creature];
        self.textField.text =@"";
        self.weaponTextField.text=@"";
        [self.tableView reloadData];
    }
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([sender isKindOfClass:[UITableViewCell class]]) {
        CreatureVCViewController *destination = segue.destinationViewController;
        NSIndexPath *index = [self.tableView indexPathForSelectedRow];
        MagicalCreature *creature = [self.creatures objectAtIndex:index.row];
        destination.creature = creature;
        destination.weapons = self.weapons;
    } else {
        BattleVC *destination = segue.destinationViewController;
        int randomInt1 = rand() % self.creatures.count;
        destination.fighter1 = self.creatures[randomInt1];
        
        
        for (MagicalCreature *fighter in self.creatures) {
            if(destination.fighter1.name != fighter.name){
                destination.fighter2 = fighter;
                continue;
            }
        }
        
        
    }
    
    
}

@end

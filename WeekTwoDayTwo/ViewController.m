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

@interface ViewController () <UITableViewDelegate, UITableViewDataSource>

@property NSMutableArray *creatures;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UITextField *textField;
@property (weak, nonatomic) IBOutlet UITextField *weaponTextField;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    MagicalCreature *creature1 = [MagicalCreature new];
    creature1.name =@"Larry";
    creature1.weapon =@"LightSaber";
    creature1.picture = [UIImage imageNamed:@"0.jpg"];
    
    MagicalCreature *creature2 = [MagicalCreature new];
    creature2.name  = @"Chris";
    creature2.weapon =@"Whip";
    creature2.picture = [UIImage imageNamed:@"1.jpg"];

    MagicalCreature *creature3 = [MagicalCreature new];
    creature3.name = @"Jack";
    creature3.weapon =@"Battle Axe";
    creature3.picture = [UIImage imageNamed:@"2.jpg"];

    
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
        creature.picture = [UIImage imageNamed:[NSString stringWithFormat:@"%lu.jpg",(unsigned long)self.creatures.count]]; 
        [self.creatures addObject:creature];
        self.textField.text =@"";
        self.weaponTextField.text=@"";
        [self.tableView reloadData];
    }
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    CreatureVCViewController *destination = segue.destinationViewController;
    NSIndexPath *index = [self.tableView indexPathForSelectedRow];
    MagicalCreature *creature = [self.creatures objectAtIndex:index.row];
    destination.creature = creature;
    
}

@end

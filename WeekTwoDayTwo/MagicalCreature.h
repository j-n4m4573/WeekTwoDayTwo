//
//  MagicalCreature.h
//  WeekTwoDayTwo
//
//  Created by Jamar Gibbs on 1/19/16.
//  Copyright © 2016 M1ndful M3d1a. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h> 

@interface MagicalCreature : NSObject
@property NSString *name;
@property NSString *weapon;
@property UIImage *picture;

-(instancetype)initWithName:(NSString *)name;

@end

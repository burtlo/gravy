//
//  AchievementRequirement.m
//  asset manager
//
//  Created by Franklin Webber on 11/3/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "AchievementRequirement.h"

@implementation AchievementRequirement

@synthesize achievement;

@synthesize identifier;
@synthesize description;

- (NSString *)description {
    // When the description has not been specified it is likely a leveling requirement
    // but this should be changed in the future to generate something that considers
    // all the fields of the requirement
    return ((description == nil || [description isEqualToString:@""]) ? [NSString stringWithFormat:@"%@ to %@", [self action],[self number]] : description);
    
}

@synthesize rewards;
@synthesize action; 
@synthesize fidList;

- (void)setfidList:(id)aFids {
    fidList = [(NSString *)aFids componentsSeparatedByString:@"-"];
}

@synthesize number;
@synthesize time;
@synthesize classList;

- (void)setClassList:(id)aClassList {
    classList = [(NSString *)aClassList componentsSeparatedByString:@"-"];
}

@synthesize category;

@synthesize icon;

- (NSImage *)icon {
    return [[NSImage alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForImageResource:@"requirement.png"]];
}

@end

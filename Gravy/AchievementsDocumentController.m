//
//  DocumentController.m
//  asset manager
//
//  Created by Franklin Webber on 11/9/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "DocumentController.h"

@implementation DocumentController

@synthesize window, achievementsData, baseAchievements;
@synthesize achievementRepresentation, achievements;

- (id)initWithWindowNibName:(NSString *)windowNibName withAchievementsData:(Achievements *)aAchievements {
    
    self = [super initWithWindowNibName:windowNibName];
    
    if ( self ) {
        [self setWindow:window];
        [self setAchievementsData:aAchievements];
    }
    
    return self;
    
}


- (void)windowDidLoad
{
    [super windowDidLoad];
    
    // Implement this method to handle any initialization after your window controller's window has been loaded from its nib file.
}


- (NSMutableArray *)achievements {
    return [achievementsData achievements];
}

- (NSMutableArray *)baseAchievements {
    return [achievementsData baseAchievements];
}

- (void)setAchievements:(NSMutableArray *)achievements {
    
}

-(void)insertObject:(id)object inAchievementsAtIndex:(NSUInteger)index {
    
}

-(void)removeObjectFromAchievementsAtIndex:(NSUInteger)index {
    
}

# pragma mark - Achievement Representation

- (void)setAchievementRepresentation:(NSInteger)newAchievementRepresentation {
    achievementRepresentation = newAchievementRepresentation;
}

@end

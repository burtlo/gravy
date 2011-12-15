//
//  AchievementsDocumentController.m
//  asset manager
//
//  Created by Franklin Webber on 11/9/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "AchievementsDocumentController.h"

@implementation AchievementsDocumentController

@synthesize window, achievementsData, baseAchievements;
@synthesize achievementRepresentation, achievements;
@synthesize baseResourcesURL;

- (id)initWithAchievements:(Achievements *)_achievements rootResourcesFolder:(NSURL *)resourcesURL {
    self = [super init];
    if (self) {
        [self setAchievementsData:_achievements];
        [self setBaseResourcesURL:resourcesURL];
        
        [NSBundle loadNibNamed:@"Achievements" owner:self];
    }
    return self;
}

- (NSMutableArray *)achievements {
    return [achievementsData achievements];
}

- (NSMutableArray *)baseAchievements {
    return [achievementsData baseAchievements];
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

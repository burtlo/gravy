//
//  AchievementsDocumentController.m
//  asset manager
//
//  Created by Franklin Webber on 11/9/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "AchievementsDocumentController.h"
#import "AchievementView.h"

@implementation AchievementsDocumentController

@synthesize window;

@synthesize achievementsData, baseAchievements;
@synthesize achievementRepresentation, achievements;
@synthesize baseResourcesURL;

- (id)initWithAchievements:(Achievements *)_achievements assetDictionary:(NSDictionary *)_assetDictionary {
    self = [super init];
    
    if (self) {
        [self setAchievementsData:_achievements];
        assetDictionary = [_assetDictionary retain];
        
        [NSBundle loadNibNamed:@"Achievements" owner:self];
        
        // find all the icons for each of the fields
        
    }
    return self;
}

- (NSMutableArray *)achievements {

    NSMutableArray *achievementViews = [NSMutableArray array];
    
    for (Achievement *achievement in [achievementsData achievements]) {
        AchievementView *achievementView = [[[AchievementView alloc] initWithAchievement:achievement 
                                                                         assetDictionary:assetDictionary] autorelease];
        [achievementViews addObject:achievementView];
    }
    
    return achievementViews;
}

- (NSMutableArray *)baseAchievements {
    return [achievementsData baseAchievements];
}

- (id)objectInAchievementsAtIndex:(NSUInteger)index {
    return [[self achievements] objectAtIndex:index];
}


- (void)removeAchievementsAtIndexes:(NSIndexSet *)indexes {
    DLOG(@"Not supported");
}

# pragma mark - Achievement Representation

- (void)setAchievementRepresentation:(NSInteger)newAchievementRepresentation {
    achievementRepresentation = newAchievementRepresentation;
}

- (void)dealloc {
    [achievementsData release];
    [assetDictionary release];
    [super dealloc];
}

@end

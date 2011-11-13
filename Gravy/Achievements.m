//
//  Achievements.m
//  asset manager
//
//  Created by Franklin Webber on 11/2/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "Achievements.h"
#import "Achievement.h"
#import "AchievementRequirement.h"
#import "CSVParser.h"

@interface Achievements ()

- (void)linkAchievements:(NSMutableArray *)toAchievements toRequirements:(NSMutableArray *)toRequirements;
- (void)findPrerequisitesFor:(NSMutableArray *)toAchievements;
@end

@implementation Achievements

@synthesize achievements, requirements;

- (id)initWithAchievementFile:(NSString *)achievementFile andRequirementsfile:(NSString *)requirementsFile {
    
    self = [super init];
    
    if ( self ) {
    
        [self setRequirements:[CSVParser parseFilepath:requirementsFile andCreateObjectsOf:@"AchievementRequirement"]];
        
        [self setAchievements:[CSVParser parseFilepath:achievementFile andCreateObjectsOf:@"Achievement"]];

        [self findPrerequisitesFor:[self achievements]];
        [self linkAchievements:[self achievements] toRequirements:[self requirements]];

    }
    
    return self;
    
}

- (void)findPrerequisitesFor:(NSMutableArray *)toAchievements {
    
    for (Achievement *achievement in toAchievements) {
        
        NSMutableArray *prerequisites = [NSMutableArray array];
        
        for (NSString *prereqName in [achievement prerequisites]) {
            
            for (Achievement *matchingAchievement in toAchievements) {

                if ([[matchingAchievement identifier] isEqualToString:prereqName]) {
                    [prerequisites addObject:matchingAchievement];
                    [matchingAchievement addIsPrerequisitesFor:achievement];
                }
            }
        }
        
        [achievement setPrerequisites:prerequisites];
    }
    
}

- (void)linkAchievements:(NSMutableArray *)toAchievements 
          toRequirements:(NSMutableArray *)toRequirements {
    
    // look through every requirement and create a reference to the achievements
    for (AchievementRequirement *requirement in toRequirements) {
        
        for (Achievement *achievement in toAchievements) {
        
            if ([[achievement identifier] isEqualToString:[requirement achievement]]) {
                [requirement setAchievement:achievement];
                [achievement addRequirement:requirement];
            }
            
        }
    }
    
}

#pragma mark - Tree Controller Data

- (NSMutableArray *)baseAchievements {
    
    NSMutableArray *baseAchievements = [NSMutableArray array];
    
    for (Achievement *achievement in achievements) {
        if ([[achievement prerequisites] count] == 0) {
            [baseAchievements addObject:achievement];
        }
    }
    
    return baseAchievements;
}

@end

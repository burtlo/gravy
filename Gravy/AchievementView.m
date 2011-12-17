//
//  AchievementView.m
//  Gravy
//
//  Created by Franklin Webber on 12/14/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "AchievementView.h"
#import "AchievementRequirementView.h"

@implementation AchievementView

@synthesize achievement;

@dynamic identifier, name, priority, prerequisites, rewards, invisible, isPrerequisitesForCount;
@dynamic requirements, isPrerequisitesFor;

#pragma mark - Initialization

- (id)initWithAchievement:(Achievement *)_achievement assetDictionary:(NSDictionary *)_assetDictionary {
    self = [super init];
    if (self) {
        [self setAchievement:_achievement];
        assetDictionary = [_assetDictionary retain];
    }
    return self;
}

#pragma mark - Description

- (NSImage *)imageForFile:(NSString *)relativeFileName {
    NSURL *imageURL = [assetDictionary objectForKey:relativeFileName];
    
    if ( imageURL ) {
        return [[NSImage alloc] initWithContentsOfURL:imageURL];
    }
    
    return nil;
}

#pragma mark - Icons & Defaults

- (NSImage *)icon {
    if ([achievement trophyIcon]) {
        return [self imageForFile:[achievement trophyIcon]];
    } else {
        return [self imageForFile:@"large_trophy_achievement_icon.png"];
    }
}

- (NSImage *)trophyIcon {
    if ([achievement trophyIcon]) {
        return [self imageForFile:[achievement trophyIcon]];
    } else {
        return [self imageForFile:@"large_trophy_achievement_icon.png"];
    }
}

- (NSImage *)descriptionIcon {
    if ([achievement trophyIcon]) {
        return [self imageForFile:[achievement descriptionIcon]];
    } else {
        return [self imageForFile:@"large_trophy_achievement_icon.png"];
    }
}

#pragma mark - Required Overrides

- (NSString *)description { 
    return [achievement description];
}

- (BOOL)isIsPrerequisitesFor {
    return [achievement isIsPrerequisitesFor];
}

- (NSMutableArray *)requirements {
    
    NSMutableArray *requirements = [NSMutableArray array];
    
    for (AchievementRequirement *requirement in [achievement requirements]) {
        
        AchievementRequirementView *requirementView = [[[AchievementRequirementView alloc] initWithRequirement:requirement 
                                                                         assetDictionary:assetDictionary] autorelease];
        [requirements addObject:requirementView];

    }
    
    return requirements;
}

- (id)prerequisites {
    NSMutableArray *achievementViews = [NSMutableArray array];
    
    for (Achievement *prerequisite in [achievement prerequisites]) {
        if (prerequisite) {
            AchievementView *achievementView = [[[AchievementView alloc] initWithAchievement:prerequisite 
                                                                             assetDictionary:assetDictionary] autorelease];
            [achievementViews addObject:achievementView];
            
        }
    }
    
    return achievementViews; 
}

#pragma mark - Method Dispatching

- (id)valueForUndefinedKey:(NSString *)key {
    
    if ( [achievement respondsToSelector:NSSelectorFromString(key)] ) {
        return [achievement performSelector:NSSelectorFromString(key)];
    } else {
        return nil;
    }
    
}

#pragma mark - Deallocation

- (void)dealloc {
    [achievement release];
    [assetDictionary release];
    [super dealloc];
}

@end

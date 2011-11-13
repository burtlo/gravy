//
//  Achievement.m
//  asset manager
//
//  Created by Franklin Webber on 11/2/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "Achievement.h"

@implementation Achievement

@synthesize identifier;
@synthesize name, description;

- (NSString *)name {
    // When a name has not been specified default to the identifier
    return ((name == nil || [name isEqualToString:@""]) ? identifier : name);
}

- (NSString *)description {
    // When the description has not been specified default to stating an accomplishment
    return ((description == nil || [description isEqualToString:@""]) ? [NSString stringWithFormat:@"Accomplish %@", [self name]] : description);
}

@synthesize priority;

@synthesize trophyIcon, descriptionIcon;

- (void)setTrophyIcon:(id)aTrophyIcon {
    
    NSString *aTrophyIconFilename = [[NSBundle mainBundle] pathForImageResource:aTrophyIcon];
    
    if (aTrophyIconFilename) {
        NSImage *image = [[NSImage alloc] initWithContentsOfFile:aTrophyIconFilename];
        trophyIcon = image;
    }
    
}

- (void)setDescriptionIcon:(id)aDescriptionIcon {

    NSString *aDescriptionIconFilename = [[NSBundle mainBundle] pathForImageResource:aDescriptionIcon];
    
    if (aDescriptionIconFilename) {
        NSImage *image = [[NSImage alloc] initWithContentsOfFile:aDescriptionIconFilename];
        descriptionIcon = image;
    }

}


@synthesize prerequisites, rewards;

// TODO: convert to the actual requirements
- (void)setPrerequisites:(id)aPrerequisites {
    if ([aPrerequisites isKindOfClass:[NSString class]]) {
        prerequisites = [(NSString *)aPrerequisites componentsSeparatedByString:@"-"];
    } else {
        prerequisites = aPrerequisites;
    }
    
}

@synthesize isPrerequisitesFor;

- (NSMutableArray *)isPrerequisitesFor {
    if (isPrerequisitesFor == nil) { isPrerequisitesFor = [NSMutableArray array]; }
    return isPrerequisitesFor;
}

- (void)addIsPrerequisitesFor:(Achievement *)achievement {
    
    if ( [achievement isPrerequisitesForCount] > 0 ) {
        [[self isPrerequisitesFor] addObject:achievement];
    } else {
        [[self isPrerequisitesFor] insertObject:achievement atIndex:0];
    }
    
}

- (BOOL)isIsPrerequisitesFor {
    return [[self isPrerequisitesFor] count] == 0;
}

- (NSInteger)isPrerequisitesForCount {
    return [[self isPrerequisitesFor] count];
}


// TODO: convert to currency
- (void)setRewards:(id)aRewards {
    rewards = [(NSString *)aRewards componentsSeparatedByString:@"-"];
}

@synthesize invisible;

- (void)setInvisible:(id)aInvisible {
    invisible = [NSNumber numberWithBool:[(NSString *)aInvisible boolValue]];
}


@synthesize requirements;

- (void)addRequirement:(AchievementRequirement *)requirement {
    
    NSMutableArray *currentRequirements = [self requirements];
    if ( currentRequirements == nil ) { currentRequirements = [NSMutableArray array]; }
    
    [currentRequirements addObject:requirement];
    [self setRequirements:currentRequirements];
}

@end


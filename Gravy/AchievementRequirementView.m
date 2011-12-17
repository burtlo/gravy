//
//  AchievementRequirementView.m
//  Gravy
//
//  Created by Franklin Webber on 12/15/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "AchievementRequirementView.h"

@implementation AchievementRequirementView

@dynamic identifier, description, rewards, action, category;
@dynamic number, time;
@dynamic achievement, fidList, classList;

#pragma mark - Initialization

- (id)initWithRequirement:(AchievementRequirement *)_requirement assetDictionary:(NSDictionary *)_assetDictionary {
    self = [super init];
    if (self) {
        requirement = [_requirement retain];
        assetDictionary = [_assetDictionary retain];
    }
    return self;
}

- (AchievementRequirement *)requirement {
    return requirement;
}

#pragma mark - Icons & Defaults

- (NSImage *)imageForFile:(NSString *)relativeFileName {
    NSURL *imageURL = [assetDictionary objectForKey:relativeFileName];
    
    if ( imageURL ) {
        return [[NSImage alloc] initWithContentsOfURL:imageURL];
    }
    
    return nil;
}

- (NSImage *)icon {
    return [self imageForFile:@"achievement_checkmark.png"];
}


#pragma mark - Required Overrides

- (NSString *)description {
    return [requirement description];
}

#pragma mark - Method Dispatching

- (id)valueForUndefinedKey:(NSString *)key {
    
    if ( [requirement respondsToSelector:NSSelectorFromString(key)] ) {
        DLOG(@"Sending key: %@",key);
        return [requirement performSelector:NSSelectorFromString(key)];
    } else {
        DLOG(@"Missing key: %@");
        return nil;
    }
    
}


# pragma mark - Deallocation

- (void)dealloc {
    [requirement release];
    [assetDictionary release];
    [super dealloc];
}

@end

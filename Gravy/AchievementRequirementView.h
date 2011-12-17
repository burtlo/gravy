//
//  AchievementRequirementView.h
//  Gravy
//
//  Created by Franklin Webber on 12/15/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AchievementRequirement.h"

@interface AchievementRequirementView : NSObject {
    AchievementRequirement *requirement;
    NSDictionary *assetDictionary;
}

- (id)initWithRequirement:(AchievementRequirement *)requirement assetDictionary:(NSDictionary *)assetDictionary;

- (AchievementRequirement *)requirement;

@property (nonatomic,readonly) NSString *identifier, *description, *rewards, *action, *category;
@property (nonatomic,readonly) NSNumber *number, *time;
@property (nonatomic,readonly) id achievement, fidList, classList;

- (NSImage *)icon;

@end

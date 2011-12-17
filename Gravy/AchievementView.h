//
//  AchievementView.h
//  Gravy
//
//  Created by Franklin Webber on 12/14/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Achievement.h"

@interface AchievementView : NSObject {
    NSDictionary *assetDictionary;
}

- (id)initWithAchievement:(Achievement *)achievement assetDictionary:(NSDictionary *)assetDictionary;

@property (nonatomic,retain) Achievement *achievement;

- (NSImage *)icon;
- (NSImage *)trophyIcon;
- (NSImage *)descriptionIcon;

@property (nonatomic,readonly) id identifier, name, priority, prerequisites, rewards, invisible;
@property (nonatomic,readonly) BOOL isIsPrerequisitesFor;
@property (nonatomic,readonly) NSInteger isPrerequisitesForCount;

@property (nonatomic,readonly) NSMutableArray *requirements, *isPrerequisitesFor;

@end

//
//  Achievement.h
//  asset manager
//
//  Created by Franklin Webber on 11/2/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
@class AchievementRequirement;

@interface Achievement : NSObject

// This value is the unique identifier generally ALPHADIGIT format
// This ties to the AchievementRequirements
@property (nonatomic,readwrite,retain) NSString *identifier;

// NOTE: level achievements do not have names or descriptions (and are flagged as invisible)
@property (nonatomic,retain) NSString *name;
@property (nonatomic,retain) NSString *description;

@property (nonatomic,readwrite,retain) NSNumber *priority;

// prerequisites (parsed from a - separated entry
@property (nonatomic,readwrite,retain) id prerequisites;

//rewards is a dash separated value with each type name : value (e.g. Coins:200000-Exp:1000)
@property (nonatomic,readwrite,retain) id rewards;

//trophyIcon
@property (nonatomic,readwrite,retain) id trophyIcon;

//descriptionIcon
@property (nonatomic,readwrite,retain) id descriptionIcon;

//invisible to the user, as these achievements are only used internally for pre-req
@property (nonatomic,readwrite,assign) id invisible;


@property (nonatomic,readwrite,retain) NSMutableArray *requirements;

- (void)addRequirement:(AchievementRequirement *)requirement;

@property (nonatomic,readwrite,retain) NSMutableArray *isPrerequisitesFor;

- (void)addIsPrerequisitesFor:(Achievement *)achievement;
- (BOOL)isIsPrerequisitesFor;
- (NSInteger)isPrerequisitesForCount;

@end

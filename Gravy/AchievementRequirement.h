//
//  AchievementRequirement.h
//  asset manager
//
//  Created by Franklin Webber on 11/3/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Achievement.h"

@interface AchievementRequirement : NSObject

//achievement,identifier (NOT USED),description,rewards,action,fidList,number,time,classList,category

@property (nonatomic,readwrite,retain) id achievement;
// THIS is actually listed under the achievement column as the identifier column
// is not used.
@property (nonatomic,readwrite,retain) NSString *identifier;

@property (nonatomic,readwrite,retain) NSString *description;

// Currently the rewards column appears to be blank across all the files - this
// likely would be some representation of coins, treats, xp or fids
// NOTE: rewards are not usually paid out on the requirements and instead on the
// rewards
@property (nonatomic,readwrite,retain) NSString *rewards;

// What the user has to do to accomplish the goal:
// Get, PopBalloons, PopHappyBalloons, Expand, MadeNeighborHappy, GetKids,
// FillFoodBowl, Unlock, Rating, VisitNeighbor, DailyBonus, Level
@property (nonatomic,readwrite,retain) NSString *action;

// The fids here are - seperated values which influence some of these actions
// ideally these would be mapped back to the items when they are eventually parsed
@property (nonatomic,readwrite,retain) id fidList;

// For the other goals like leveling or number of rooms or number of kids, 
@property (nonatomic,readwrite,retain) NSNumber *number; 

// For some goals they have a time requirement for them to reach
@property (nonatomic,readwrite,retain) NSNumber *time;

// Class name used for Get. e.g. Get 15 pet rooms (GuestRoom)
@property (nonatomic,readwrite,retain) id classList;

// The category name for this achievement
@property (nonatomic,readwrite,retain) NSString *category;

@end

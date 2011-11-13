//
//  Achievements.h
//  asset manager
//
//  Created by Franklin Webber on 11/2/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


//identifier,name,priority,description,prerequisites,rewards,trophyIcon,descriptionIcon,invisible

//achievement,identifier (NOT USED),description,rewards,action,fidList,number,time,classList,category

@interface Achievements : NSObject

- (id)initWithAchievementFile:(NSString *)achievementFile andRequirementsfile:(NSString *)requirementsFile;

@property (nonatomic,readwrite,retain) NSMutableArray *achievements;
@property (nonatomic,readwrite,retain) NSMutableArray *requirements;

- (NSMutableArray *)baseAchievements;

@end

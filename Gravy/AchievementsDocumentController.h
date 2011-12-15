//
//  AchievementsDocumentController.h
//  asset manager
//
//  Created by Franklin Webber on 11/9/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "Achievements.h"

@interface AchievementsDocumentController : NSObject {
    Achievements *achievementsData;
    NSInteger achievementRepresentation;
}

- (id)initWithAchievements:(Achievements *)achievements rootResourcesFolder:(NSURL *)resourcesURL;

@property (assign) IBOutlet NSWindow *window;
@property (nonatomic,assign) IBOutlet NSMutableArray *achievements;
@property (nonatomic,assign) IBOutlet NSMutableArray *baseAchievements;
@property (nonatomic,assign) IBOutlet NSInteger achievementRepresentation;

@property (nonatomic,retain) Achievements *achievementsData;
@property (nonatomic,retain) NSURL *baseResourcesURL;

-(void)insertObject:(id)object inAchievementsAtIndex:(NSUInteger)index;
-(void)removeObjectFromAchievementsAtIndex:(NSUInteger)index;

@end

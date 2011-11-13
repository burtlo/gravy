//
//  AchievementBox.m
//  asset manager
//
//  Created by Franklin Webber on 11/5/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "AchievementBox.h"

@implementation AchievementBox

// -------------------------------------------------------------------------------
//	hitTest:aPoint
// -------------------------------------------------------------------------------
- (NSView *)hitTest:(NSPoint)aPoint
{
    // don't allow any mouse clicks for subviews in this NSBox
    return nil;
}

@end

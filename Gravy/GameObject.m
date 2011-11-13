//
//  GameObject.m
//  asset manager
//
//  Created by Franklin Webber on 11/10/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "GameObject.h"

@implementation GameObject

@synthesize fID, type, itemName, iconFilename, requiredLevel, width, height, petRoomName, petFaceIcon;

@synthesize dateOfStartOffer, dateOfEndOffer, percentOffBuildCost, percentOffRushCost, dateOfStartSale, dateOfEndSale;

@synthesize category;

@synthesize levels;

@synthesize level0Filename, level0PNGColorSpace, level0BuildCost, level0BuildUnit, level0BuildTime, level0BuildXP, level0EarnTime, level0EarnUnit, level0EarnAmount, level0EarnXP;

@synthesize level1Filename, level1PNGColorSpace, level1BuildCost, level1BuildUnit, level1BuildTime, level1BuildXP, level1EarnTime, level1EarnUnit, level1EarnAmount, level1EarnXP;

@synthesize level2Filename, level2PNGColorSpace, level2BuildCost, level2BuildUnit, level2BuildTime, level2BuildXP, level2EarnTime, level2EarnUnit, level2EarnAmount, level2EarnXP;

@end

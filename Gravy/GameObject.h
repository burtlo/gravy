//
//  GameObject.h
//  asset manager
//
//  Created by Franklin Webber on 11/10/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GameObject : NSObject

//FID,Type,Item name,Icon filename,Required level,Levels,Level0Filename,Level0PNGColorSpace,Level0BuildUnit,Level0BuildCost,Level0BuildXP,Level0EarnTime,Level0EarnUnit,Level0EarnAmount,Level0EarnXP,Level0BuildTime,Level1Filename,Level1PNGColorSpace,Level1BuildUnit,Level1BuildCost,Level1BuildXP,Level1EarnTime,Level1EarnUnit,Level1EarnAmount,Level1EarnXP,Level1BuildTime,Level2Filename,Level2PNGColorSpace,Level2BuildUnit,Level2BuildCost,Level2BuildXP,Level2EarnTime,Level2EarnUnit,Level2EarnAmount,Level2EarnXP,Level2BuildTime,Width,Height,PetRoomName,PetFaceIcon,DateOfStartOffer,DateOfEndOffer,PercentOffBuildCost,PercentOffRushCost,DateOfStartSale,DateOfEndSale,Category

@property (nonatomic,retain,readwrite) NSString *fID;
@property (nonatomic,retain,readwrite) NSString *type;

@property (nonatomic,retain,readwrite) NSString *itemName;
@property (nonatomic,retain,readwrite) NSString *iconFilename;
@property (nonatomic,retain,readwrite) NSString *requiredLevel;
@property (nonatomic,retain,readwrite) NSString *levels;

@property (nonatomic,retain,readwrite) NSString *width;
@property (nonatomic,retain,readwrite) NSString *height;
@property (nonatomic,retain,readwrite) NSString *petRoomName;
@property (nonatomic,retain,readwrite) NSString *petFaceIcon;

@property (nonatomic,retain,readwrite) NSString *dateOfStartOffer;
@property (nonatomic,retain,readwrite) NSString *dateOfEndOffer;
@property (nonatomic,retain,readwrite) NSString *percentOffBuildCost;
@property (nonatomic,retain,readwrite) NSString *percentOffRushCost;
@property (nonatomic,retain,readwrite) NSString *dateOfStartSale;
@property (nonatomic,retain,readwrite) NSString *dateOfEndSale;

@property (nonatomic,retain,readwrite) NSString *category;
@property (nonatomic,retain,readwrite) NSString *isMysteryLTO;

@property (nonatomic,retain,readwrite) NSString *level0Filename;
@property (nonatomic,retain,readwrite) NSString *level0PNGColorSpace;
@property (nonatomic,retain,readwrite) NSString *level0BuildCost;
@property (nonatomic,retain,readwrite) NSString *level0BuildUnit;
@property (nonatomic,retain,readwrite) NSString *level0BuildTime;
@property (nonatomic,retain,readwrite) NSString *level0BuildXP;
@property (nonatomic,retain,readwrite) NSString *level0EarnTime;
@property (nonatomic,retain,readwrite) NSString *level0EarnUnit;
@property (nonatomic,retain,readwrite) NSString *level0EarnAmount;
@property (nonatomic,retain,readwrite) NSString *level0EarnXP;

@property (nonatomic,retain,readwrite) NSString *level1Filename;
@property (nonatomic,retain,readwrite) NSString *level1PNGColorSpace;
@property (nonatomic,retain,readwrite) NSString *level1BuildCost;
@property (nonatomic,retain,readwrite) NSString *level1BuildUnit;
@property (nonatomic,retain,readwrite) NSString *level1BuildTime;
@property (nonatomic,retain,readwrite) NSString *level1BuildXP;
@property (nonatomic,retain,readwrite) NSString *level1EarnTime;
@property (nonatomic,retain,readwrite) NSString *level1EarnUnit;
@property (nonatomic,retain,readwrite) NSString *level1EarnAmount;
@property (nonatomic,retain,readwrite) NSString *level1EarnXP;

@property (nonatomic,retain,readwrite) NSString *level2Filename;
@property (nonatomic,retain,readwrite) NSString *level2PNGColorSpace;
@property (nonatomic,retain,readwrite) NSString *level2BuildCost;
@property (nonatomic,retain,readwrite) NSString *level2BuildUnit;
@property (nonatomic,retain,readwrite) NSString *level2BuildTime;
@property (nonatomic,retain,readwrite) NSString *level2BuildXP;
@property (nonatomic,retain,readwrite) NSString *level2EarnTime;
@property (nonatomic,retain,readwrite) NSString *level2EarnUnit;
@property (nonatomic,retain,readwrite) NSString *level2EarnAmount;
@property (nonatomic,retain,readwrite) NSString *level2EarnXP;

@end

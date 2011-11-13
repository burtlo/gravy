//
//  Pet.h
//  asset manager
//
//  Created by Franklin Webber on 11/10/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GameObject.h"

@interface Pet : NSObject

// Room FID,Name,Filename,Icon filename,Unit,Cost,Width,Height,PNG colorspace,Num Walk Frames,Num Happy Frames,Num Reaction Frames,CafÈ,Disco,Karaoke,Flight,

@property (nonatomic,retain,readwrite) NSString *roomFid;
@property (nonatomic,retain,readwrite) NSString *name;
@property (nonatomic,retain,readwrite) NSString *filename;
@property (nonatomic,retain,readwrite) NSString *iconFilename;
@property (nonatomic,retain,readwrite) NSString *unit;
@property (nonatomic,retain,readwrite) NSString *cost;
@property (nonatomic,retain,readwrite) NSString *width;
@property (nonatomic,retain,readwrite) NSString *height;
@property (nonatomic,retain,readwrite) NSString *PngColorspace;
@property (nonatomic,retain,readwrite) NSString *numWalkFrames;
@property (nonatomic,retain,readwrite) NSString *numHappyFrames;
@property (nonatomic,retain,readwrite) NSString *numReactionFrames;
@property (nonatomic,retain,readwrite) NSString *cafA;
@property (nonatomic,retain,readwrite) NSString *disco;
@property (nonatomic,retain,readwrite) NSString *karaoke;
@property (nonatomic,retain,readwrite) NSString *flight;

@property (nonatomic,retain,readwrite) GameObject *room;

@end

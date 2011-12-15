//
//  Pet.m
//  asset manager
//
//  Created by Franklin Webber on 11/10/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "Pet.h"

@implementation Pet

@synthesize roomFid, room;

@synthesize name, filename, iconFilename, unit, cost, width, height;
@synthesize PngColorspace, numWalkFrames, numHappyFrames, numReactionFrames;
@synthesize cafA, disco, karaoke;
@synthesize flight;

- (void)setValue:(id)value forUndefinedKey:(NSString *)key {
    DLOG(@"Attempting to set a property that we currently do not maintain: %@",key);
}

@end

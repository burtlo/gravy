//
//  PetsAnimationLayer.m
//  Gravy
//
//  Created by Franklin Webber on 11/13/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "PetsAnimationLayer.h"


@implementation PetsAnimationLayer

+(CCScene *) scene
{
	// 'scene' is an autorelease object.
	CCScene *scene = [CCScene node];
	
	// 'layer' is an autorelease object.
	PetsAnimationLayer *layer = [PetsAnimationLayer node];
	
	// add layer as a child to scene
	[scene addChild: layer];
	
	// return the scene
	return scene;
}

- (id)init {
    
    // always call "super" init
	// Apple recommends to re-assign "self" with the "super" return value
	if( (self=[super init])) {
		
		// create and initialize a Label
		CCLabelTTF *label = [CCLabelTTF labelWithString:@"Hello World" fontName:@"Marker Felt" fontSize:24];
        
		// ask director the the window size
		CGSize size = [[CCDirector sharedDirector] winSize];
        
		// position the label on the center of the screen
		label.position =  ccp( size.width/2 , size.height/2 );
		
		// add the label as a child to this Layer
		[self addChild: label];
	}
	return self;
    
}

// on "dealloc" you need to release all your retained objects
- (void) dealloc
{
	// in case you have something to dealloc, do it in this method
	// in this particular example nothing needs to be released.
	// cocos2d will automatically release all the children (Label)
	
	// don't forget to call "super dealloc"
	[super dealloc];
}

@end

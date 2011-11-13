//
//  PetsDocumentController.m
//  asset manager
//
//  Created by Franklin Webber on 11/13/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "PetsDocumentController.h"
#import "cocos2d.h"
#import "PetsAnimationLayer.h"

@interface PetsDocumentController ()

- (void)prepareAnimationView;

@end

@implementation PetsDocumentController
@synthesize animationView;

@synthesize window;
@synthesize gameObjects, pets;

- (id)initWithWindowNibName:(NSString *)windowNibName withGameObjects:(GameObjects *)aGameObjects;
{
    self = [super initWithWindowNibName:windowNibName];
    
    if ( self ) {
        [self setWindow:window];
        [self setGameObjects:aGameObjects];
        
        [self prepareAnimationView];
    }
    
    return self;
}

- (NSMutableArray *)pets {
    return [[self gameObjects] pets];
}

- (void)prepareAnimationView {
    CCDirectorMac *director = (CCDirectorMac*) [CCDirector sharedDirector];
	
	[director setDisplayFPS:YES];
	
	[director setOpenGLView:[self animationView]];
    
	// EXPERIMENTAL stuff.
	// 'Effects' don't work correctly when autoscale is turned on.
	// Use kCCDirectorResize_NoScale if you don't want auto-scaling.
	[director setResizeMode:kCCDirectorResize_NoScale];
    //[director setResizeMode:kCCDirectorResize_AutoScale];
    
	[director runWithScene:[PetsAnimationLayer scene]];
}

@end

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

#define kPetAnimationView 2


@interface PetsDocumentController ()

- (void)prepareAnimationView;

@end

@implementation PetsDocumentController

@synthesize window, animationView;

@synthesize gameObjects, pets;

- (id)initWithGameObjects:(GameObjects *)aGameObjects {
    
    self = [super init];
    
    if ( self ) {
    
        [self setGameObjects:aGameObjects];
        
        [NSBundle loadNibNamed:@"Pets" owner:self];
        
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
    [director setResizeMode:kCCDirectorResize_AutoScale];
    
    [director runWithScene:[PetsAnimationLayer scene]];
}

@end

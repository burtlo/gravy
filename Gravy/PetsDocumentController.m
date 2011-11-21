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
#import "Pet.h"
#import "GuestRoomView.h"

#define kPetAnimationView 2


@interface PetsDocumentController ()

- (void)prepareAnimationView;

@end

@implementation PetsDocumentController
@synthesize collectionView;
@synthesize arrayController;

@synthesize window, animationView;

@synthesize gameObjects, pets, baseResourcesURL;

- (id)initWithGameObjects:(GameObjects *)aGameObjects rootResourcesFolder:(NSURL *)resourcesURL {
    
    self = [super init];
    
    if ( self ) {
    
        [self setGameObjects:aGameObjects];
        [self setBaseResourcesURL:resourcesURL];
        
        [self addObserver:self 
               forKeyPath:@"arrayController.selectionIndex" options:NSKeyValueChangeSetting 
                  context:nil];
        
        [NSBundle loadNibNamed:@"Pets" owner:self];
        
        [self prepareAnimationView];
    }
    
    return self;
    
}

- (NSMutableArray *)pets {
    
    NSMutableArray *guestRoomViews = [NSMutableArray array];
    
    for (Pet *pet in [gameObjects pets]) {
        GuestRoomView *guestRoomView = [[GuestRoomView alloc] initWithPet:pet rootResourcesFolder:[self baseResourcesURL]];
        [guestRoomView imageIcon];
        [guestRoomViews addObject:guestRoomView];
    }
    
    return guestRoomViews;
//    return [[self gameObjects] pets];
}

- (void)prepareAnimationView {
    CCDirectorMac *director = (CCDirectorMac*) [CCDirector sharedDirector];
    [director setDisplayFPS:YES];

    [director setOpenGLView:[self animationView]];
    
	// EXPERIMENTAL stuff.
	// 'Effects' don't work correctly when autoscale is turned on.
	// Use kCCDirectorResize_NoScale if you don't want auto-scaling.
    [director setResizeMode:kCCDirectorResize_AutoScale];

    [CCTexture2D setDefaultAlphaPixelFormat:kTexture2DPixelFormat_RGBA8888];
    
    // 'scene' is an autorelease object.
	CCScene *scene = [CCScene node];
	
	// 'layer' is an autorelease object.
	petAnimationLayer = [PetsAnimationLayer node];
	
	// add layer as a child to scene
	[scene addChild: petAnimationLayer];
    
    [director runWithScene:scene];
}

#pragma mark - Observation

- (void)observeValueForKeyPath:(NSString *)keyPath 
                      ofObject:(id)valueObject
                        change:(NSDictionary *)change 
                       context:(void *)context {
    
    NSLog(@"Array Controller changed index to %@",[arrayController selectedObjects]);
    
    if ( [[arrayController selectedObjects] count] > 0 ) {
        
        GuestRoomView *guestRoomView = [[arrayController selectedObjects] objectAtIndex:0];
        
        [petAnimationLayer removeAllChildrenWithCleanup:YES];
        
        CCSprite *constructionImage = [guestRoomView spriteForLevel2Construction];
        
        if (constructionImage) {
            [petAnimationLayer addChild:constructionImage z:1];
        }
        
    }
    
    

}


@end

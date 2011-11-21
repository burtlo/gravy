//
//  PetsDocumentController.h
//  asset manager
//
//  Created by Franklin Webber on 11/13/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "GameObjects.h"
#import "cocos2d.h"
#import "PetsAnimationLayer.h"

@interface PetsDocumentController : NSObject {
    PetsAnimationLayer *petAnimationLayer;
}

- (id)initWithGameObjects:(GameObjects *)aGameObjects rootResourcesFolder:(NSURL *)resourcesURL;

@property (nonatomic,assign) IBOutlet NSWindow *window;

@property (nonatomic,assign) IBOutlet GameObjects *gameObjects;
@property (nonatomic,retain) IBOutlet MacGLView *animationView;

@property (assign) IBOutlet NSCollectionView *collectionView;
@property (assign) IBOutlet NSArrayController *arrayController;
@property (nonatomic,assign) IBOutlet NSMutableArray *pets;

@property (nonatomic,assign) NSURL *baseResourcesURL;

@end

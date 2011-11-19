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

@interface PetsDocumentController : NSObject

- (id)initWithGameObjects:(GameObjects *)aGameObjects;
//- (id)initWithWindowNibName:(NSString *)windowNibName withGameObjects:(GameObjects *)aGameObjects;

@property (nonatomic,assign) IBOutlet NSWindow *window;
@property (nonatomic,assign) IBOutlet GameObjects *gameObjects;
@property (nonatomic,assign) IBOutlet NSMutableArray *pets;

@property (nonatomic,retain) IBOutlet MacGLView *animationView;

@end

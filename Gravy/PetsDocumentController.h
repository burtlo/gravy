//
//  PetsDocumentController.h
//  asset manager
//
//  Created by Franklin Webber on 11/13/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "GameObjects.h"


@interface PetsDocumentController : NSWindowController

- (id)initWithWindowNibName:(NSString *)windowNibName withGameObjects:(GameObjects *)aGameObjects;

@property (assign) IBOutlet NSWindow *window;
@property (nonatomic,assign) IBOutlet GameObjects *gameObjects;
@property (nonatomic,assign) IBOutlet NSMutableArray *pets;

@end

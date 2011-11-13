//
//  PetsDocumentController.m
//  asset manager
//
//  Created by Franklin Webber on 11/13/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "PetsDocumentController.h"

@implementation PetsDocumentController

@synthesize window;
@synthesize gameObjects, pets;

- (id)initWithWindowNibName:(NSString *)windowNibName withGameObjects:(GameObjects *)aGameObjects;
{
    self = [super initWithWindowNibName:windowNibName];
    
    if ( self ) {
        [self setWindow:window];
        [self setGameObjects:aGameObjects];
    }
    
    return self;
}

- (NSMutableArray *)pets {
    return [[self gameObjects] pets];
}

@end

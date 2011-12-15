//
//  GuestRoomView.m
//  Gravy
//
//  Created by Franklin Webber on 11/18/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "GuestRoomView.h"

@implementation GuestRoomView

@synthesize pet;

#pragma mark - Initialization

- (id)initWithPet:(Pet *)aPet rootResourcesFolder:(NSURL *)resourcesURL {
    self = [super init];
    if (self) {
        [self setPet:aPet];
        baseResourcesURL = [resourcesURL retain];
    }
    return self;
}

#pragma mark - Helper Methods

- (NSImage *)imageIcon {
    
    
    NSDirectoryEnumerator *de = [[NSFileManager defaultManager] enumeratorAtURL:baseResourcesURL 
                         includingPropertiesForKeys:nil
                                            options:NSDirectoryEnumerationSkipsHiddenFiles | NSDirectoryEnumerationSkipsPackageDescendants
                                       errorHandler:^BOOL(NSURL *url, NSError *error) {
                                           
                                           NSLog(@"Error finding files");
                                           return YES;
                                           
                                       }];
    
    NSURL *file;
    
    while ((file = [de nextObject])) {
        //NSLog(@"Looking at %@",file);
    
        if ( [[file absoluteString] hasSuffix:[[pet room] iconFilename]] ) {
            NSLog(@"Found image at %@",[file absoluteString]);
            return [[[NSImage alloc] initWithContentsOfURL:file] autorelease];
        }
    }
    
    return nil;
}

- (NSString *)filename {
    return [pet filename];
}

- (NSString *)name {
    return [pet name];
}

- (CCSprite *)spriteForLevel2Construction {
   return [CCSprite node]; 
}



#pragma mark - Deallocation

- (void)dealloc {
    [pet release];
    [baseResourcesURL release];
    [super dealloc];
}

@end

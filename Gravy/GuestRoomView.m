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
        
        if ( [[file absoluteString] hasSuffix:[[pet room] level2Filename]] ) {
            
            NSString *localFilename = [[file absoluteString] substringFromIndex:[@"file://localhost" length]];
            
            NSLog(@"Found image at %@",localFilename);
            
            CCTexture2D *texture = [[CCTextureCache sharedTextureCache] addImage:localFilename];
            
            CCSprite *sprite = nil;
            
            if ( texture ) {
                sprite = [CCSprite spriteWithTexture:texture rect:CGRectMake(0.0, 0.0, 100.0, 100.0)];
            }
//            CCSprite *sprite = [CCSprite spriteWithFile:localFilename];
            
            [sprite setScaleX:1.0];
            [sprite setScaleY:1.0];
            
            [sprite setContentSize:CGSizeMake(100.00, 100.0)];
            
            return sprite;
        }
    }
    
    return nil;
}



#pragma mark - Deallocation

- (void)dealloc {
    [pet release];
    [baseResourcesURL release];
    [super dealloc];
}

@end

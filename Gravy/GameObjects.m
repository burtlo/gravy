//
//  GameObjects.m
//  asset manager
//
//  Created by Franklin Webber on 11/10/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "GameObjects.h"
#import "CSVParser.h"
#import "GameObject.h"
#import "Pet.h"

@interface GameObjects ()

- (void)linkPets:(NSMutableArray *)pets toGameObjects:(NSMutableArray *)objects;

@end


@implementation GameObjects

@synthesize gameObjects, pets;

- (id)initWithGameObjectsFile:(NSString *)gameObjectFile andPetsFile:(NSString *)petsFile {
    
    self = [super init];
    
    if ( self ) {
        
        [self setGameObjects:[CSVParser parseFilepath:gameObjectFile andCreateObjectsOf:@"GameObject"]];
        
        [self setPets:[CSVParser parseFilepath:petsFile andCreateObjectsOf:@"Pet"]];
        
        [self linkPets:[self pets] toGameObjects:[self gameObjects]];
        
    }
    
    return self;
}

- (void)linkPets:(NSMutableArray *)pets toGameObjects:(NSMutableArray *)objects {
    
    for (Pet *pet in pets) {
        
        for (GameObject *object in objects) {
            if ([[pet roomFid] isEqualToString:[object fID]]) {
                [pet setRoom:object];
            }
        }
        
    }
    
}


- (NSMutableArray *)guestRooms {
    
    NSMutableArray *guestRooms = [NSMutableArray array];
    
    for (GameObject *gameObject in [self gameObjects]) {
        if ([[gameObject type] isEqualToString:@"GuestRoom"]) {
            [guestRooms addObject:gameObject];
        }
    }
    
    return guestRooms;
}


@end

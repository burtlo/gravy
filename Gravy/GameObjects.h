//
//  GameObjects.h
//  asset manager
//
//  Created by Franklin Webber on 11/10/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GameObjects : NSObject

- (id)initWithGameObjectsFile:(NSString *)gameObjectFile andPetsFile:(NSString *)petsFile;

@property (nonatomic,readwrite,retain) NSMutableArray *gameObjects;
@property (nonatomic,readwrite,retain) NSMutableArray *pets;

- (NSMutableArray *)guestRooms;

@end

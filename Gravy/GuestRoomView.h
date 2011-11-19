//
//  GuestRoomView.h
//  Gravy
//
//  Created by Franklin Webber on 11/18/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Pet.h"
#import "cocos2d.h"

@interface GuestRoomView : NSObject {
    NSURL *baseResourcesURL;
}

- (id)initWithPet:(Pet *)pet rootResourcesFolder:(NSURL *)resourcesURL;

@property (nonatomic,readwrite,retain) Pet *pet;

- (NSImage *)imageIcon;
- (CCSprite *)spriteForLevel2Construction;
- (NSString *)filename;
- (NSString *)name;

@end

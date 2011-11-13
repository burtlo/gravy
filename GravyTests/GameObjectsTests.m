//
//  GameObjectsTests.m
//  asset manager
//
//  Created by Franklin Webber on 11/13/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <SenTestingKit/SenTestingKit.h>
#import "GameObjects.h"

@interface GameObjectsTests : SenTestCase {
    GameObjects *gameObjects;
}

- (NSString *)gameObjectsFile;
- (NSString *)petsFile;

@end

@implementation GameObjectsTests

- (NSString *)gameObjectsFile {
    return [[NSBundle bundleForClass:[self class]] pathForResource:@"GameObjectTypes" ofType:@"csv"];
}

- (NSString *)petsFile {
    return [[NSBundle bundleForClass:[self class]] pathForResource:@"Pets" ofType:@"csv"];
}

- (void)setUp
{
    [super setUp];
    gameObjects = [[GameObjects alloc] initWithGameObjectsFile:[self gameObjectsFile] andPetsFile:[self petsFile]];
}

- (void)tearDown
{
    [super tearDown];
}

- (void)test_gameObjectsShouldBePresent {
    
    STAssertTrue([[gameObjects gameObjects] count] != 0,@"There are no Game Objects");
    
}

- (void)test_petsShouldBePresent {
    
    STAssertTrue([[gameObjects pets] count] != 0,@"There are no Pets");
    
}

@end

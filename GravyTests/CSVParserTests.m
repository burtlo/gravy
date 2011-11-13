//
//  CSVParserTests.m
//  asset manager
//
//  Created by Franklin Webber on 11/2/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <SenTestingKit/SenTestingKit.h>
#import "CSVParser.h"
#import "Achievement.h"

@interface CSVParserTests : SenTestCase

- (NSString *)achievementsFile;
- (NSString *)gameObjectsFile;
- (NSString *)petsFile;

@end

@implementation CSVParserTests

- (NSString *)achievementsFile {
    return [[NSBundle bundleForClass:[self class]] pathForResource:@"Achievements" ofType:@"csv"];
}

- (NSString *)gameObjectsFile {
    return [[NSBundle bundleForClass:[self class]] pathForResource:@"GameObjectTypes" ofType:@"csv"];
}

- (NSString *)petsFile {
    return [[NSBundle bundleForClass:[self class]] pathForResource:@"Pets" ofType:@"csv"];
}


- (void)testInitWithFile_fileExists_allShouldReturnArrayWithElements {

    CSVParser *csvParser = [[CSVParser alloc] initWithFilepath:[self achievementsFile]];
    
    STAssertTrue([[csvParser all] count] == 133,@"No Achievements should have been found");
}

- (void)testParseFileWithClass_fileExists_objectsShouldBeReturnedInArray {
    
    NSMutableArray *givenData = [CSVParser parseFilepath:[self achievementsFile] andCreateObjectsOf:@"Achievement"];
    
    STAssertTrue([givenData count] != 0, @"Resulting data returned is empty");
}

- (void)testParseFileWithClass_fileColumnsContainSpecialCharacters_objectsShouldBeReturnedInArray {
    
    NSMutableArray *givenData = [CSVParser parseFilepath:[self petsFile] andCreateObjectsOf:@"Pet"];
    
    STAssertTrue([givenData count] != 0, @"Resulting data returned is empty");
}

@end

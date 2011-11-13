//
//  AchievementsTests.m
//  asset manager
//
//  Created by Franklin Webber on 11/2/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//
#import <SenTestingKit/SenTestingKit.h>
#import "Achievements.h"

@interface AchievementsTests : SenTestCase {
    Achievements *achievements;
}

- (NSString *)achievementFile;
- (NSString *)requirementsFile;

@end

@implementation AchievementsTests

- (NSString *)achievementFile {
    return [[NSBundle bundleForClass:[self class]] pathForResource:@"Achievements" ofType:@"csv"];
    
}

- (NSString *)requirementsFile {
    return [[NSBundle bundleForClass:[self class]] pathForResource:@"AchievementsRequirements" ofType:@"csv"];
    
}

//- (void)setUp
//{
//    [super setUp];
//    achievements = [[Achievements alloc] initWithAchievementFile:[self achievementFile] andRequirementsfile:[self requirementsFile]];
//}
//
//- (void)tearDown
//{
//    [super tearDown];
//}
//
//- (void)test_achievementsShouldBePresent {
//    
//    STAssertTrue([[achievements achievements] count] != 0,@"There are no achievements");
//}
//
//- (void)test_requirementsShouldBePresent {
//    
//    STAssertTrue([[achievements requirements] count] != 0,@"There are no requirements");
//}
//
//- (void)test_anAchievementShouldHaveARequirement {
//    
//    STAssertTrue([[[[achievements achievements] objectAtIndex:0] requirements] count] != 0,@"Achievement does not have a requirement");
//    
//}

@end

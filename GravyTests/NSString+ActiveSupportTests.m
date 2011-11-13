//
//  NSString+ActiveSupport.h
//  asset manager
//
//  Created by Franklin Webber on 11/12/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

//  Logic unit tests contain unit test code that is designed to be linked into an independent test executable.

#import <SenTestingKit/SenTestingKit.h>
#import "NSString+ActiveSupport.h"

@interface NSStringTests : SenTestCase

@end

@implementation NSStringTests

- (void)testPropertyize {
    STAssertTrue([[@"Class   List" propertyize] isEqualToString:@"classList"],@"Propertyize did not create the correct NSString");
}

- (void)testPropertyize_shouldNotChangeNamesAlreadyInPropertyNameForm {
    STAssertTrue([[@"classList" propertyize] isEqualToString:@"classList"],@"Propertyize did not create the correct NSString");
}

- (void)testPropertyize_shouldLevelAllCapitalizedOneWordItemsAlone {
    STAssertTrue([[@"FID" propertyize] isEqualToString:@"fID"],@"Propertyize did not create the correct NSString");
}

- (void)testPropertyize_shouldRemoveNonANSICharacters {
    STAssertTrue([[@"class CafÈ" propertyize] isEqualToString:@"classCafe"],@"Propertyize did not create the correct NSString");
}

- (void)testPropertyize_shouldRemoveUnallowedCharacters {
    STAssertTrue([[@"something (in pixels)" propertyize] isEqualToString:@"somethingInPixels"],@"Propertyize did not create the correct NSString");
}

- (void)testCamelize {
    STAssertTrue([[@"Class List" camelize] isEqualToString:@"ClassList"],@"Camelize did not create the correct NSString");
}

- (void)testUnderscore {
    STAssertTrue([[@"Class List" underscore] isEqualToString:@"class_list"],@"Underscore did not create the correct NSString %@");
}

- (void)testDasherize {
    STAssertTrue([[@"Class List" dasherize] isEqualToString:@"class-list"],@"Dasherize did not create the correct NSString");
}

@end

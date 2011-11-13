//
//  NSString+ActiveSupport.m
//  asset manager
//
//  Created by Franklin Webber on 11/12/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "NSString+ActiveSupport.h"

@implementation NSString (ActiveSupport)


- (NSString *)camelize {
    if ([[self componentsSeparatedByCharactersInSet:[NSCharacterSet whitespaceCharacterSet]] count] > 1) {
        return [[[self capitalizedString] componentsSeparatedByCharactersInSet:[NSCharacterSet whitespaceCharacterSet]] componentsJoinedByString:@""];
    } else {
        return self;
    }
    
}

- (NSString *)propertyize {
    
    // Convert all characters that are not in the ASCII characters set to ASCII characters (when it cannot find an equivalent it will convert to ?)
    
    NSMutableString *propertyName = [[NSMutableString alloc] initWithData:[self dataUsingEncoding:NSASCIIStringEncoding allowLossyConversion:YES] encoding:NSASCIIStringEncoding];

    // Strip any characters that are not letters or digits
    // NOTE: the alphanumeric characterSet contains ^ and ` so a specific one has to be built
    
    NSMutableCharacterSet *propertySet = [NSMutableCharacterSet lowercaseLetterCharacterSet];
    [propertySet formUnionWithCharacterSet:[NSMutableCharacterSet uppercaseLetterCharacterSet]];
    [propertySet formUnionWithCharacterSet:[NSMutableCharacterSet decimalDigitCharacterSet]];
    
    NSMutableString *camelized = [[[[propertyName camelize] componentsSeparatedByCharactersInSet:[propertySet invertedSet]] componentsJoinedByString:@""] mutableCopy];

    [camelized replaceCharactersInRange:NSMakeRange(0, 1) withString:[[camelized substringToIndex:1] lowercaseString]];
    
    return camelized;
}

- (NSString *)dasherize {
    return [[[self lowercaseString] componentsSeparatedByCharactersInSet:[NSCharacterSet whitespaceCharacterSet]] componentsJoinedByString:@"-"];
}

- (NSString *)underscore {
    return [[[self lowercaseString] componentsSeparatedByCharactersInSet:[NSCharacterSet whitespaceCharacterSet]] componentsJoinedByString:@"_"];
}

@end

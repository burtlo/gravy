//
//  NSString+ActiveSupport.h
//  asset manager
//
//  Created by Franklin Webber on 11/12/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (ActiveSupport)

- (NSString *)camelize;
- (NSString *)dasherize;
- (NSString *)propertyize;
- (NSString *)underscore;

@end

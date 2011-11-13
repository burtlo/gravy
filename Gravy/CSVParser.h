/*
 * cCSVParse, a small CVS file parser
 *
 * © 2007-2009 Michael Stapelberg and contributors
 * http://michael.stapelberg.de/
 *
 * This source code is BSD-licensed, see LICENSE for the complete license.
 *
 */
#import <Foundation/Foundation.h>


@interface CSVParser:NSObject {
	int fileHandle;
	int bufferSize;
	char delimiter;
	NSStringEncoding encoding;
    
}

- (id)init;
- (id)initWithFilepath:(NSString *)filepath;

+ (NSMutableArray *)parseFilepath:(NSString *)filepath andCreateObjectsOf:(NSString *)className;

- (void)handle:(NSArray *)rows;

- (NSMutableArray *)all;
- (NSMutableArray *)findByValue:(NSString *)value forKey:(NSString *)key;

@property (readonly,nonatomic,retain) NSMutableArray* objects;

@end
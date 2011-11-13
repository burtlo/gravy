//
//  AMAppDelegate.h
//  asset manager
//
//  Created by Franklin Webber on 11/2/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "Achievements.h"
#import "DocumentController.h"

@interface AMAppDelegate : NSObject <NSApplicationDelegate> {

}

@property (nonatomic,retain) DocumentController *documentController;

@end

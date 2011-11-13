//
//  AMDocumentController.m
//  asset manager
//
//  Created by Franklin Webber on 11/8/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "AMDocumentController.h"
#import "Achievements.h"
#import "GVAppDelegate.h"
#import "DocumentController.h"
#import "GameObjects.h"
#import "PetsDocumentController.h"

@interface AMDocumentController ()

- (NSURL *)urlForCSVFileWithName:(NSString *)fileName withBase:(NSURL *)baseFolder;
- (Achievements *)achievementsFromBaseFolder:(NSURL *)baseFolder;
- (GameObjects *)gameObjectsFromBaseFolder:(NSURL *)baseFolder;

@end

@implementation AMDocumentController

- (void)openDocument:(id)sender {
    
    NSOpenPanel *openPanel = [NSOpenPanel openPanel];
    [openPanel setFloatingPanel:NO];
    [openPanel setCanChooseDirectories:YES];
    [openPanel setCanChooseFiles:NO];
    
    NSInteger result = [openPanel runModal];
    
    if (result == NSOKButton) {
        NSLog(@"Folder Selected: %@",[openPanel URLs]);
        
        // From the given URL find the achievements and achievementsRequirements file
        
        NSURL *baseFolder = [[openPanel URLs] objectAtIndex:0];
        
        DocumentController *documentController = [[DocumentController alloc] initWithWindowNibName:@"Document" 
                                                                              withAchievementsData:[self achievementsFromBaseFolder:baseFolder]];
        
        [documentController loadWindow];
        
        PetsDocumentController *petsDocController = [[PetsDocumentController alloc] initWithWindowNibName:@"Pets" withGameObjects:[self gameObjectsFromBaseFolder:baseFolder]];
        
        
        [petsDocController loadWindow];
        
//        GVAppDelegate *appDelegate = (AMAppDelegate *)[[NSApplication sharedApplication] delegate];
//        [appDelegate setDocumentController:documentController];

    }
    
}


- (NSURL *)urlForCSVFileWithName:(NSString *)fileName withBase:(NSURL *)base {
    
    NSURL *csvFilePath = [NSURL URLWithString:[NSString stringWithFormat:@"%@.csv",fileName] relativeToURL:base];
    
    return csvFilePath;
}

- (Achievements *)achievementsFromBaseFolder:(NSURL *)baseFolder {
    
    NSURL *achievementsFile = [self urlForCSVFileWithName:@"Achievements" withBase:baseFolder];
    NSURL *requirementsFile = [self urlForCSVFileWithName:@"AchievementRequirements" withBase:baseFolder];
    
    Achievements *achievementData = [[Achievements alloc] initWithAchievementFile:[achievementsFile path]
                                                              andRequirementsfile:[requirementsFile path]];
    
    return achievementData;

}

- (GameObjects *)gameObjectsFromBaseFolder:(NSURL *)baseFolder {
    
    NSURL *gameObjectsFile = [self urlForCSVFileWithName:@"GameObjectTypes" withBase:baseFolder];
    NSURL *petsFile = [self urlForCSVFileWithName:@"Pets" withBase:baseFolder];
    
    GameObjects *gameObjectsData = [[GameObjects alloc] initWithGameObjectsFile:[gameObjectsFile path]
                                                                    andPetsFile:[petsFile path]];
    
    return gameObjectsData;
    
}

@end

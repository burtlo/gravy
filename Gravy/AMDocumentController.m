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
#import "AchievementsDocumentController.h"
#import "GameObjects.h"
#import "PetsDocumentController.h"

@interface AMDocumentController ()

- (NSURL *)urlForCSVFileWithName:(NSString *)fileName withBase:(NSURL *)baseFolder;
- (Achievements *)achievementsFromBaseFolder:(NSURL *)baseFolder;
- (GameObjects *)gameObjectsFromBaseFolder:(NSURL *)baseFolder;

- (NSMutableDictionary *)dictionaryWithRelativePathKeyToFullURLFromBaseFolder:(NSURL *)baseFolder;

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
        
        NSMutableDictionary *assetDictionary = [self dictionaryWithRelativePathKeyToFullURLFromBaseFolder:baseFolder];
        
        Achievements *achievements = [self achievementsFromBaseFolder:baseFolder];
        
        AchievementsDocumentController *achievementDocController = [[AchievementsDocumentController alloc] initWithAchievements:achievements
                                                                              assetDictionary:assetDictionary];
        
//        PetsDocumentController *petsDocController = [[PetsDocumentController alloc] initWithGameObjects:[self gameObjectsFromBaseFolder:baseFolder] 
//                                                                                    rootResourcesFolder:baseFolder];
        
    }
    
}


- (NSURL *)urlForCSVFileWithName:(NSString *)fileName withBase:(NSURL *)base {
    
    NSURL *csvFilePath = [NSURL URLWithString:[NSString stringWithFormat:@"Parameters/%@.csv",fileName] relativeToURL:base];
    
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

#pragma mark - Image Assets

- (NSMutableDictionary *)dictionaryWithRelativePathKeyToFullURLFromBaseFolder:(NSURL *)baseFolder {
    
    NSMutableDictionary *imageDictionary = [NSMutableDictionary dictionary];
    
    NSDirectoryEnumerator *de = [[NSFileManager defaultManager] enumeratorAtURL:baseFolder
                                                     includingPropertiesForKeys:nil
                                                                        options:NSDirectoryEnumerationSkipsHiddenFiles | NSDirectoryEnumerationSkipsPackageDescendants
                                                                   errorHandler:^BOOL(NSURL *url, NSError *error) {
                                                                       
                                                                       NSLog(@"Error finding files");
                                                                       return YES;
                                                                       
                                                                   }];
    
    NSURL *fileURL;
    
    while ((fileURL = [de nextObject])) {
//        NSLog(@"Looking at %@",fileURL);
        
        if ( [[fileURL absoluteString] hasSuffix:@"png"] ) {
            
//            NSLog(@"Found image at %@",[fileURL absoluteString]);
            
            [imageDictionary setObject:fileURL forKey:[[fileURL absoluteString] lastPathComponent]];
            
        }
    }
    
    return imageDictionary;
    
}

@end

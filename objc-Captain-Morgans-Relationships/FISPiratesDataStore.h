//
//  FISPiratesDataStore.h
//  objc-Captain-Morgans-Relationships
//
//  Created by Zachary Drossman on 10/22/14.
//  Copyright (c) 2014 Zachary Drossman. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Pirate.h"

@interface FISPiratesDataStore : NSObject

@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (strong, nonatomic) NSArray *pirates;

- (void)fetchData;
- (void)save;
- (NSURL *)applicationDocumentsDirectory;

+ (instancetype) sharedPiratesDataStore;

@end


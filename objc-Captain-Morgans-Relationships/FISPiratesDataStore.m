//
//  FISPiratesDataStore.m
//  objc-Captain-Morgans-Relationships
//
//  Created by Zachary Drossman on 10/22/14.
//  Copyright (c) 2014 Zachary Drossman. All rights reserved.
//

#import "FISPiratesDataStore.h"
#import "Pirate.h"
#import "Ship.h"
#import "Engine.h"

@implementation FISPiratesDataStore
@synthesize managedObjectContext = _managedObjectContext;

# pragma mark - Singleton

+ (instancetype)sharedPiratesDataStore {
    static FISPiratesDataStore *_sharedPiratesDataStore = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedPiratesDataStore = [[FISPiratesDataStore alloc] init];
    });

    return _sharedPiratesDataStore;
}

- (void)saveContext
{
    NSError *error = nil;
    NSManagedObjectContext *managedObjectContext = self.managedObjectContext;
    if (managedObjectContext != nil) {
        if ([managedObjectContext hasChanges] && ![managedObjectContext save:&error]) {
            // Replace this implementation with code to handle the error appropriately.
            // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
            NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
            abort();
        }
    }
}

#pragma mark - Core Data stack

// Returns the managed object context for the application.
// If the context doesn't already exist, it is created and bound to the persistent store coordinator for the application.
- (NSManagedObjectContext *)managedObjectContext
{
    if (_managedObjectContext != nil) {
        return _managedObjectContext;
    }


    NSURL *storeURL = [[self applicationDocumentsDirectory] URLByAppendingPathComponent:@"objcCMR.sqlite"];

    NSError *error = nil;

    NSURL *modelURL = [[NSBundle mainBundle] URLForResource:@"objcCMR" withExtension:@"momd"];
    NSManagedObjectModel *managedObjectModel = [[NSManagedObjectModel alloc] initWithContentsOfURL:modelURL];
    NSPersistentStoreCoordinator *coordinator = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:managedObjectModel];

    [coordinator addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:storeURL options:nil error:&error];
    if (coordinator != nil) {
        _managedObjectContext = [[NSManagedObjectContext alloc] init];
        [_managedObjectContext setPersistentStoreCoordinator:coordinator];
    }
    return _managedObjectContext;
}

#pragma mark - Application's Documents directory

// Returns the URL to the application's Documents directory.
- (NSURL *)applicationDocumentsDirectory
{
    return [[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] lastObject];
}

#pragma mark - test data

-(void) generateTestData
{
    Pirate *blackbeard = [NSEntityDescription insertNewObjectForEntityForName:@"Pirate" inManagedObjectContext:self.managedObjectContext];
    [blackbeard setName:@"Blackbeard"];
    
    Engine *queenAnnesEngine = [NSEntityDescription insertNewObjectForEntityForName:@"Engine" inManagedObjectContext:self.managedObjectContext];
    [queenAnnesEngine setPropulsionType:@"sail"];
    
    Ship *queenAnnesRevenge = [NSEntityDescription insertNewObjectForEntityForName:@"Ship" inManagedObjectContext:self.managedObjectContext];
    [queenAnnesRevenge setName:@"Queen Anne's Revenge"];
    [queenAnnesRevenge setEngine:queenAnnesEngine];
    [queenAnnesRevenge setPirate:blackbeard];
    
    Engine *adventureEngine = [NSEntityDescription insertNewObjectForEntityForName:@"Engine" inManagedObjectContext:self.managedObjectContext];
    [adventureEngine setPropulsionType:@"electric"];
    
    Ship *adventure = [NSEntityDescription insertNewObjectForEntityForName:@"Ship" inManagedObjectContext:self.managedObjectContext];
    [adventure setName:@"Adventure"];
    [adventure setEngine:adventureEngine];
    [adventure setPirate:blackbeard];
    
    Pirate *anneBonny = [NSEntityDescription insertNewObjectForEntityForName:@"Pirate" inManagedObjectContext:self.managedObjectContext];
    [anneBonny setName:@"Anne Bonny"];
    
    Engine *revengeEngine = [NSEntityDescription insertNewObjectForEntityForName:@"Engine" inManagedObjectContext:self.managedObjectContext];
    [revengeEngine setPropulsionType:@"gas"];
    
    Ship *revenge = [NSEntityDescription insertNewObjectForEntityForName:@"Ship" inManagedObjectContext:self.managedObjectContext];
    [revenge setName:@"Revenge"];
    [revenge setEngine:revengeEngine];
    [revenge setPirate:anneBonny];
    
    Pirate *chingShih = [NSEntityDescription insertNewObjectForEntityForName:@"Pirate" inManagedObjectContext:self.managedObjectContext];
    [chingShih setName:@"Ching Shih"];
    
    Engine *chingShihShipEngine = [NSEntityDescription insertNewObjectForEntityForName:@"Engine" inManagedObjectContext:self.managedObjectContext];
    [chingShihShipEngine setPropulsionType:@"sail"];
    
    Ship *chingShihShip = [NSEntityDescription insertNewObjectForEntityForName:@"Ship" inManagedObjectContext:self.managedObjectContext];
    [chingShihShip setEngine:chingShihShipEngine];
    [chingShihShip setPirate:chingShih];
    
    // save and refetch
    [self saveContext];
    [self fetchData];
}

- (void)fetchData
{
    // TODO: make an NSFetchRequest, execute and fill datastore
    
    NSFetchRequest *piratesRequest = [NSFetchRequest fetchRequestWithEntityName:@"Pirate"];
    NSError *error;
    NSArray *pirates = [self.managedObjectContext executeFetchRequest:piratesRequest error:&error];
    if (error) return;
    
    // TODO: finish this so it will generate test data if your datastore is empty
    if (pirates.count == 0) {
        [self generateTestData];
        return;
    }
    
    [self setPirates:pirates];
}


@end

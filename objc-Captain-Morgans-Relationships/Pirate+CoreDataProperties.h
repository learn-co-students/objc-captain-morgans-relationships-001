//
//  Pirate+CoreDataProperties.h
//  objc-Captain-Morgans-Relationships
//
//  Created by Ken M. Haggerty on 2/10/16.
//  Copyright © 2016 Zachary Drossman. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "Pirate.h"

NS_ASSUME_NONNULL_BEGIN

@interface Pirate (CoreDataProperties)

@property (nullable, nonatomic, retain) NSString *name;
@property (nullable, nonatomic, retain) NSSet<Ship *> *ships;

@end

@interface Pirate (CoreDataGeneratedAccessors)

- (void)addShipsObject:(Ship *)value;
- (void)removeShipsObject:(Ship *)value;
- (void)addShips:(NSSet<Ship *> *)values;
- (void)removeShips:(NSSet<Ship *> *)values;

@end

NS_ASSUME_NONNULL_END

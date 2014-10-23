//
//  Pirate.h
//  objc-Captain-Morgans-Relationships
//
//  Created by Zachary Drossman on 10/23/14.
//  Copyright (c) 2014 Zachary Drossman. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Ship;

@interface Pirate : NSManagedObject

@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSSet *ships;
@end

@interface Pirate (CoreDataGeneratedAccessors)

- (void)addShipsObject:(Ship *)value;
- (void)removeShipsObject:(Ship *)value;
- (void)addShips:(NSSet *)values;
- (void)removeShips:(NSSet *)values;

@end

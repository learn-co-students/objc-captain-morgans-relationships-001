//
//  Ship+CoreDataProperties.h
//  objc-Captain-Morgans-Relationships
//
//  Created by Ken M. Haggerty on 2/10/16.
//  Copyright © 2016 Zachary Drossman. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "Ship.h"

NS_ASSUME_NONNULL_BEGIN

@interface Ship (CoreDataProperties)

@property (nullable, nonatomic, retain) NSString *name;
@property (nullable, nonatomic, retain) Engine *engine;
@property (nullable, nonatomic, retain) Pirate *pirate;

@end

NS_ASSUME_NONNULL_END

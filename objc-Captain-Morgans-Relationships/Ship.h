//
//  Ship.h
//  objc-Captain-Morgans-Relationships
//
//  Created by Zachary Drossman on 10/23/14.
//  Copyright (c) 2014 Zachary Drossman. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Engine, Pirate;

@interface Ship : NSManagedObject

@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) Engine *engine;
@property (nonatomic, retain) Pirate *pirate;

@end

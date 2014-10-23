//
//  Engine.h
//  objc-Captain-Morgans-Relationships
//
//  Created by Zachary Drossman on 10/23/14.
//  Copyright (c) 2014 Zachary Drossman. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Ship;

@interface Engine : NSManagedObject

@property (nonatomic, retain) NSString * engineType;
@property (nonatomic, retain) Ship *ship;

@end

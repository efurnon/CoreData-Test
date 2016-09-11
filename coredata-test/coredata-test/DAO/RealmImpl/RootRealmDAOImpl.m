//
//  RootRealmDAOImpl.m
//  CoreData Test
//
//  Created by Emmanuel Furnon on 11/09/2016.
//  Copyright © 2016 Keyrus. All rights reserved.
//

#import "RootRealmDAOImpl.h"

@implementation RootRealmDAOImpl

// Create.
- (NSObject *)new:(Class)class
{
    return [class init];
}

// Save.
- (void)save:(NSError *)error
{
    // Save the object
}

// Delete.
- (void)delete:(NSObject *)object error:(NSError *)error
{
    // Delete the object
}

// Get all.
- (NSArray *)all:(Class)class error:(NSError *)error
{
    return [NSArray array];
}

@end

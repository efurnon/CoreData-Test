//
//  RootRealmDAOImpl.h
//  CoreData Test
//
//  Created by Emmanuel Furnon on 11/09/2016.
//  Copyright © 2016 Keyrus. All rights reserved.
//

@interface RootRealmDAOImpl : NSObject

- (NSObject *)new:(Class)class;

- (void)save:(NSError *)error;

- (void)delete:(NSObject *)object error:(NSError *)error;

- (NSArray *)all:(Class)class error:(NSError *)error;

@end

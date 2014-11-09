//
//  AppDelegate.m
//  MogeneratorMagicalRecord
//
//  Created by Luka Gabric on 24/10/14.
//  Copyright (c) 2014 Luka Gabric. All rights reserved.
//

#import "AppDelegate.h"
#import "CoreData+MagicalRecord.h"
#import "Contact.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    [MagicalRecord setupCoreDataStackWithAutoMigratingSqliteStoreNamed:@"SampleDataModel"];
    
    [self addContact];
    NSLog(@"Contacts : %@", [Contact MR_findAll]);

    // Override point for customization after application launch.
    return YES;
}

- (void)addContact {
    Contact *contact = [Contact MR_createInContext:[NSManagedObjectContext MR_defaultContext]];
    contact.firstName = @"First";
    contact.lastName = @"Last";
    contact.ageValue = 30;
    contact.dateOfBirth = [NSDate dateWithTimeIntervalSince1970:0];
    contact.phone = @"+01 555 11 31";
    [[NSManagedObjectContext MR_defaultContext] MR_saveToPersistentStoreAndWait];
}

@end

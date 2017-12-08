//
//  AppDelegate.h
//  AwesomeIOS
//
//  Created by GLB-311-PC on 01/12/17.
//  Copyright © 2017 Globussoft. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong) NSPersistentContainer *persistentContainer;

- (void)saveContext;


@end


//
//  AppDelegate.h
//  LearnOCProject
//
//  Created by Felix on 08/12/2016.
//  Copyright © 2016 Felix. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong) NSPersistentContainer *persistentContainer;

- (void)saveContext;


@end


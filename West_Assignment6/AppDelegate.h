//
//  AppDelegate.h
//  West_Assignment6
//
//  Created by Gabriel West on 2/20/13.
//  Copyright (c) 2013 Gabriel West. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WelcomePop.h"
#import "ObjectManager.h"

@class ViewController;

@interface AppDelegate : UIResponder <UIApplicationDelegate>


@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) ViewController *viewController;
@property (strong, nonatomic) WelcomePop *welcomePop;
@property (strong, nonatomic) ObjectManager *objMan;

@end

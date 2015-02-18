//
//  AppDelegate.m
//  DemoLumberjack
//
//  Created by Ivan Zezyulya on 18.02.15.
//  Copyright (c) 2015 Ivan. All rights reserved.
//

#import "AppDelegate.h"
#import "MasterViewController.h"
#import "DDASLLogger.h"
#import "DDTTYLogger.h"
#import "LogglyFormatter.h"
#import "LogglyLogger.h"

static NSString * const kLogglyKey = @"d7405077-3555-46e3-887d-815f6f0a156e";

@implementation AppDelegate

- (void) setupLogging
{
    [DDLog addLogger:[DDASLLogger sharedInstance]];
    [DDLog addLogger:[DDTTYLogger sharedInstance]];

    LogglyLogger *logglyLogger = [LogglyLogger new];
    logglyLogger.logFormatter = [LogglyFormatter new];
    logglyLogger.logglyKey = kLogglyKey;
    logglyLogger.saveInterval = 15;
    [DDLog addLogger:logglyLogger];
}

- (BOOL) application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    [self setupLogging];

    DDLogVerbose(@"Hello!");

    return YES;
}

@end

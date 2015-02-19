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
#import "ZZNSLogger.h"
#import "ZZLogFormatter.h"

static NSString * const kLogglyKey = @"d7405077-3555-46e3-887d-815f6f0a156e";

@implementation AppDelegate

- (void) setupLogging
{
    ZZLogFormatter *formatter = [ZZLogFormatter new];
    formatter.printDateInTimestamp = NO;
    formatter.printMachThreadID = NO;
    formatter.maxLineWidth = 100;

    [[DDASLLogger sharedInstance] setLogFormatter:formatter];
    [DDLog addLogger:[DDTTYLogger sharedInstance]];

    [[DDTTYLogger sharedInstance] setLogFormatter:formatter];
    [DDLog addLogger:[DDASLLogger sharedInstance]];

    LogglyLogger *logglyLogger = [LogglyLogger new];
    logglyLogger.logFormatter = [LogglyFormatter new];
    logglyLogger.logglyKey = kLogglyKey;
    logglyLogger.saveInterval = 15;
    [DDLog addLogger:logglyLogger];

    [DDLog addLogger:[ZZNSLogger sharedInstance]];
}

- (BOOL) application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    [self setupLogging];

    LogCommonInfo(@"Hello!");

    LogApiVerbose(@"got 23KB of json data");

    LogDbErrorf(@"Database corrupted!");

    return YES;
}

@end

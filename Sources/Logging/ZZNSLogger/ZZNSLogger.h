//
//  ZZNSLogger.h
//  DemoLumberjack
//
//  Created by Ivan Zezyulya on 19.02.15.
//  Copyright (c) 2015 Ivan. All rights reserved.
//

#import "DDLog.h"

@interface ZZNSLogger : DDAbstractLogger <DDLogger>

+ (ZZNSLogger *)sharedInstance;

@end

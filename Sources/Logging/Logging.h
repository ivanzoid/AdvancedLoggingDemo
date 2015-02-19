//
//  Logging.h
//  iHerb
//
//  Created by Ivan Zezyulya on 21.03.14.
//  Copyright (c) 2014 aldigit. All rights reserved.
//

#import "DDLog.h"
#import "ConfigDefinitions.h"

ConfigVarWithProductionValue(int, ddLogLevel, LOG_LEVEL_INFO)
ConfigVarWithProductionValue(BOOL, kLogCommonEnabled, YES)
ConfigVarWithProductionValue(BOOL, kLogApiEnabled, NO)
ConfigVarWithProductionValue(BOOL, kLogDbEnabled, NO)

#if DEBUG
static BOOL const kLogAsync = NO;
#else
static BOOL const kLogAsync = YES;
#endif

#import "LoggingCollections.h"

#define NSLog(x, ...) DontUseNSLog

//
//  Logging.m
//  iHerb
//
//  Created by Ivan Zezyulya on 21.03.14.
//  Copyright (c) 2014 aldigit. All rights reserved.
//

#import "Logging.h"

ConfigVarImplWithDefaultDevelValue(int, ddLogLevel, LOG_LEVEL_VERBOSE)
ConfigVarImplWithDefaultDevelValue(BOOL, kLogCommonEnabled, YES)
ConfigVarImplWithDefaultDevelValue(BOOL, kLogApiEnabled, NO)
ConfigVarImplWithDefaultDevelValue(BOOL, kLogDbEnabled, YES)

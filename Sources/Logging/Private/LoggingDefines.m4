dnl $1 = logLevel, $2 = async
define(`loggingCommon', `

#import "LoggingDefines.h"

#define LOGGING_LOG(atag, logLevel, aflag, async, func, printFunction, fmt, ...) \
{ \
    if (atag && (logLevel & aflag)) { \
        [DDLog log:async \
             level:logLevel \
              flag:aflag \
           context:printFunction \
              file:__FILE__ \
          function:func \
              line:__LINE__ \
               tag:atag \
            format:fmt, ##__VA_ARGS__]; \
    } \
}

#define LogError(tag, fmt, ...)     LOGGING_LOG(tag, $1, LOG_FLAG_ERROR, $2, sel_getName(_cmd), 0,                                    fmt, ##__VA_ARGS__)
#define LogErrorf(tag, fmt, ...)    LOGGING_LOG(tag, $1, LOG_FLAG_ERROR, $2, __FUNCTION__,      LoggingContextFlagPrintFunction,      fmt, ##__VA_ARGS__)
#define LogErrorC(tag, fmt, ...)    LOGGING_LOG(tag, $1, LOG_FLAG_ERROR, $2, __FUNCTION__,      0,                                    fmt, ##__VA_ARGS__)
#define LogErrorCf(tag, fmt, ...)   LOGGING_LOG(tag, $1, LOG_FLAG_ERROR, $2, __FUNCTION__,      LoggingContextFlagPrintFunction,      fmt, ##__VA_ARGS__)
#define LogWarn(tag, fmt, ...)      LOGGING_LOG(tag, $1, LOG_FLAG_WARN,  $2, sel_getName(_cmd), 0,                                    fmt, ##__VA_ARGS__)
#define LogWarnf(tag, fmt, ...)     LOGGING_LOG(tag, $1, LOG_FLAG_WARN,  $2, __FUNCTION__,      LoggingContextFlagPrintFunction,      fmt, ##__VA_ARGS__)
#define LogWarnC(tag, fmt, ...)     LOGGING_LOG(tag, $1, LOG_FLAG_WARN,  $2, __FUNCTION__,      0,                                    fmt, ##__VA_ARGS__)
#define LogWarnCf(tag, fmt, ...)    LOGGING_LOG(tag, $1, LOG_FLAG_WARN,  $2, __FUNCTION__,      LoggingContextFlagPrintFunction,      fmt, ##__VA_ARGS__)
#define LogInfo(tag, fmt, ...)      LOGGING_LOG(tag, $1, LOG_FLAG_INFO,  $2, sel_getName(_cmd), 0,                                    fmt, ##__VA_ARGS__)
#define LogInfof(tag, fmt, ...)     LOGGING_LOG(tag, $1, LOG_FLAG_INFO,  $2, __FUNCTION__,      LoggingContextFlagPrintFunction,      fmt, ##__VA_ARGS__)
#define LogInfoC(tag, fmt, ...)     LOGGING_LOG(tag, $1, LOG_FLAG_INFO,  $2, __FUNCTION__,      0,                                    fmt, ##__VA_ARGS__)
#define LogInfoCf(tag, fmt, ...)    LOGGING_LOG(tag, $1, LOG_FLAG_INFO,  $2, __FUNCTION__,      LoggingContextFlagPrintFunction,      fmt, ##__VA_ARGS__)
#define LogDebug(tag, fmt, ...)     LOGGING_LOG(tag, $1, LOG_FLAG_DEBUG, $2, sel_getName(_cmd), 0,                                    fmt, ##__VA_ARGS__)
#define LogDebugf(tag, fmt, ...)    LOGGING_LOG(tag, $1, LOG_FLAG_DEBUG, $2, __FUNCTION__,      LoggingContextFlagPrintFunction,      fmt, ##__VA_ARGS__)
#define LogDebugC(tag, fmt, ...)    LOGGING_LOG(tag, $1, LOG_FLAG_DEBUG, $2, __FUNCTION__,      0,                                    fmt, ##__VA_ARGS__)
#define LogDebugCf(tag, fmt, ...)   LOGGING_LOG(tag, $1, LOG_FLAG_DEBUG, $2, __FUNCTION__,      LoggingContextFlagPrintFunction,      fmt, ##__VA_ARGS__)
#define LogVerbose(tag, fmt, ...)   LOGGING_LOG(tag, $1, LOG_FLAG_VERBOSE,$2,sel_getName(_cmd), 0,                                    fmt, ##__VA_ARGS__)
#define LogVerbosef(tag, fmt, ...)  LOGGING_LOG(tag, $1, LOG_FLAG_VERBOSE,$2,__FUNCTION__,      LoggingContextFlagPrintFunction,      fmt, ##__VA_ARGS__)
#define LogVerboseC(tag, fmt, ...)  LOGGING_LOG(tag, $1, LOG_FLAG_VERBOSE,$2,__FUNCTION__,      0,                                    fmt, ##__VA_ARGS__)
#define LogVerboseCf(tag, fmt, ...) LOGGING_LOG(tag, $1, LOG_FLAG_VERBOSE,$2,__FUNCTION__,      LoggingContextFlagPrintFunction,      fmt, ##__VA_ARGS__)

')

dnl $1 = tag, $2 = enabled, $3 = level, $4 = async
define(`loggingCollection', `
#define Log$1Error(fmt, ...)    LogError(($2 ? @"$1" : nil), fmt, ##__VA_ARGS__)
#define Log$1Errorf(fmt, ...)   LogErrorf(($2 ? @"$1" : nil), fmt, ##__VA_ARGS__)
#define Log$1ErrorC(fmt, ...)   LogErrorC(($2 ? @"$1" : nil), fmt, ##__VA_ARGS__)
#define Log$1ErrorCf(fmt, ...)  LogErrorCf(($2 ? @"$1" : nil), fmt, ##__VA_ARGS__)
#define Log$1Warn(fmt, ...)     LogWarn(($2 ? @"$1" : nil), fmt, ##__VA_ARGS__)
#define Log$1Warnf(fmt, ...)    LogWarnf(($2 ? @"$1" : nil), fmt, ##__VA_ARGS__)
#define Log$1WarnC(fmt, ...)    LogWarnC(($2 ? @"$1" : nil), fmt, ##__VA_ARGS__)
#define Log$1WarnCf(fmt, ...)   LogWarnCf(($2 ? @"$1" : nil), fmt, ##__VA_ARGS__)
#define Log$1Info(fmt, ...)     LogInfo(($2 ? @"$1" : nil), fmt, ##__VA_ARGS__)
#define Log$1Infof(fmt, ...)    LogInfof(($2 ? @"$1" : nil), fmt, ##__VA_ARGS__)
#define Log$1InfoC(fmt, ...)    LogInfoC(($2 ? @"$1" : nil), fmt, ##__VA_ARGS__)
#define Log$1InfoCf(fmt, ...)   LogInfoCf(($2 ? @"$1" : nil), fmt, ##__VA_ARGS__)
#define Log$1Debug(fmt, ...)    LogDebug(($2 ? @"$1" : nil), fmt, ##__VA_ARGS__)
#define Log$1Debugf(fmt, ...)   LogDebugf(($2 ? @"$1" : nil), fmt, ##__VA_ARGS__)
#define Log$1DebugC(fmt, ...)   LogDebugC(($2 ? @"$1" : nil), fmt, ##__VA_ARGS__)
#define Log$1DebugCf(fmt, ...)  LogDebugCf(($2 ? @"$1" : nil), fmt, ##__VA_ARGS__)
#define Log$1Verbose(fmt, ...)  LogVerbose(($2 ? @"$1" : nil), fmt, ##__VA_ARGS__)
#define Log$1Verbosef(fmt, ...) LogVerboseC(($2 ? @"$1" : nil), fmt, ##__VA_ARGS__)
#define Log$1VerboseC(fmt, ...) LogVerboseC(($2 ? @"$1" : nil), fmt, ##__VA_ARGS__)
#define Log$1VerboseCf(fmt, ...) LogVerboseCf(($2 ? @"$1" : nil), fmt, ##__VA_ARGS__)

')

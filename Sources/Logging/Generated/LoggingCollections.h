






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

#define LogError(tag, fmt, ...)     LOGGING_LOG(tag, ddLogLevel, LOG_FLAG_ERROR, kLogAsync, sel_getName(_cmd), 0,                                    fmt, ##__VA_ARGS__)
#define LogErrorf(tag, fmt, ...)    LOGGING_LOG(tag, ddLogLevel, LOG_FLAG_ERROR, kLogAsync, __FUNCTION__,      LoggingContextFlagPrintFunction,      fmt, ##__VA_ARGS__)
#define LogErrorC(tag, fmt, ...)    LOGGING_LOG(tag, ddLogLevel, LOG_FLAG_ERROR, kLogAsync, __FUNCTION__,      0,                                    fmt, ##__VA_ARGS__)
#define LogErrorCf(tag, fmt, ...)   LOGGING_LOG(tag, ddLogLevel, LOG_FLAG_ERROR, kLogAsync, __FUNCTION__,      LoggingContextFlagPrintFunction,      fmt, ##__VA_ARGS__)
#define LogWarn(tag, fmt, ...)      LOGGING_LOG(tag, ddLogLevel, LOG_FLAG_WARN,  kLogAsync, sel_getName(_cmd), 0,                                    fmt, ##__VA_ARGS__)
#define LogWarnf(tag, fmt, ...)     LOGGING_LOG(tag, ddLogLevel, LOG_FLAG_WARN,  kLogAsync, __FUNCTION__,      LoggingContextFlagPrintFunction,      fmt, ##__VA_ARGS__)
#define LogWarnC(tag, fmt, ...)     LOGGING_LOG(tag, ddLogLevel, LOG_FLAG_WARN,  kLogAsync, __FUNCTION__,      0,                                    fmt, ##__VA_ARGS__)
#define LogWarnCf(tag, fmt, ...)    LOGGING_LOG(tag, ddLogLevel, LOG_FLAG_WARN,  kLogAsync, __FUNCTION__,      LoggingContextFlagPrintFunction,      fmt, ##__VA_ARGS__)
#define LogInfo(tag, fmt, ...)      LOGGING_LOG(tag, ddLogLevel, LOG_FLAG_INFO,  kLogAsync, sel_getName(_cmd), 0,                                    fmt, ##__VA_ARGS__)
#define LogInfof(tag, fmt, ...)     LOGGING_LOG(tag, ddLogLevel, LOG_FLAG_INFO,  kLogAsync, __FUNCTION__,      LoggingContextFlagPrintFunction,      fmt, ##__VA_ARGS__)
#define LogInfoC(tag, fmt, ...)     LOGGING_LOG(tag, ddLogLevel, LOG_FLAG_INFO,  kLogAsync, __FUNCTION__,      0,                                    fmt, ##__VA_ARGS__)
#define LogInfoCf(tag, fmt, ...)    LOGGING_LOG(tag, ddLogLevel, LOG_FLAG_INFO,  kLogAsync, __FUNCTION__,      LoggingContextFlagPrintFunction,      fmt, ##__VA_ARGS__)
#define LogDebug(tag, fmt, ...)     LOGGING_LOG(tag, ddLogLevel, LOG_FLAG_DEBUG, kLogAsync, sel_getName(_cmd), 0,                                    fmt, ##__VA_ARGS__)
#define LogDebugf(tag, fmt, ...)    LOGGING_LOG(tag, ddLogLevel, LOG_FLAG_DEBUG, kLogAsync, __FUNCTION__,      LoggingContextFlagPrintFunction,      fmt, ##__VA_ARGS__)
#define LogDebugC(tag, fmt, ...)    LOGGING_LOG(tag, ddLogLevel, LOG_FLAG_DEBUG, kLogAsync, __FUNCTION__,      0,                                    fmt, ##__VA_ARGS__)
#define LogDebugCf(tag, fmt, ...)   LOGGING_LOG(tag, ddLogLevel, LOG_FLAG_DEBUG, kLogAsync, __FUNCTION__,      LoggingContextFlagPrintFunction,      fmt, ##__VA_ARGS__)
#define LogVerbose(tag, fmt, ...)   LOGGING_LOG(tag, ddLogLevel, LOG_FLAG_VERBOSE,kLogAsync,sel_getName(_cmd), 0,                                    fmt, ##__VA_ARGS__)
#define LogVerbosef(tag, fmt, ...)  LOGGING_LOG(tag, ddLogLevel, LOG_FLAG_VERBOSE,kLogAsync,__FUNCTION__,      LoggingContextFlagPrintFunction,      fmt, ##__VA_ARGS__)
#define LogVerboseC(tag, fmt, ...)  LOGGING_LOG(tag, ddLogLevel, LOG_FLAG_VERBOSE,kLogAsync,__FUNCTION__,      0,                                    fmt, ##__VA_ARGS__)
#define LogVerboseCf(tag, fmt, ...) LOGGING_LOG(tag, ddLogLevel, LOG_FLAG_VERBOSE,kLogAsync,__FUNCTION__,      LoggingContextFlagPrintFunction,      fmt, ##__VA_ARGS__)




#define LogCommonError(fmt, ...)    LogError((kLogCommonEnabled ? @"Common" : nil), fmt, ##__VA_ARGS__)
#define LogCommonErrorf(fmt, ...)   LogErrorf((kLogCommonEnabled ? @"Common" : nil), fmt, ##__VA_ARGS__)
#define LogCommonErrorC(fmt, ...)   LogErrorC((kLogCommonEnabled ? @"Common" : nil), fmt, ##__VA_ARGS__)
#define LogCommonErrorCf(fmt, ...)  LogErrorCf((kLogCommonEnabled ? @"Common" : nil), fmt, ##__VA_ARGS__)
#define LogCommonWarn(fmt, ...)     LogWarn((kLogCommonEnabled ? @"Common" : nil), fmt, ##__VA_ARGS__)
#define LogCommonWarnf(fmt, ...)    LogWarnf((kLogCommonEnabled ? @"Common" : nil), fmt, ##__VA_ARGS__)
#define LogCommonWarnC(fmt, ...)    LogWarnC((kLogCommonEnabled ? @"Common" : nil), fmt, ##__VA_ARGS__)
#define LogCommonWarnCf(fmt, ...)   LogWarnCf((kLogCommonEnabled ? @"Common" : nil), fmt, ##__VA_ARGS__)
#define LogCommonInfo(fmt, ...)     LogInfo((kLogCommonEnabled ? @"Common" : nil), fmt, ##__VA_ARGS__)
#define LogCommonInfof(fmt, ...)    LogInfof((kLogCommonEnabled ? @"Common" : nil), fmt, ##__VA_ARGS__)
#define LogCommonInfoC(fmt, ...)    LogInfoC((kLogCommonEnabled ? @"Common" : nil), fmt, ##__VA_ARGS__)
#define LogCommonInfoCf(fmt, ...)   LogInfoCf((kLogCommonEnabled ? @"Common" : nil), fmt, ##__VA_ARGS__)
#define LogCommonDebug(fmt, ...)    LogDebug((kLogCommonEnabled ? @"Common" : nil), fmt, ##__VA_ARGS__)
#define LogCommonDebugf(fmt, ...)   LogDebugf((kLogCommonEnabled ? @"Common" : nil), fmt, ##__VA_ARGS__)
#define LogCommonDebugC(fmt, ...)   LogDebugC((kLogCommonEnabled ? @"Common" : nil), fmt, ##__VA_ARGS__)
#define LogCommonDebugCf(fmt, ...)  LogDebugCf((kLogCommonEnabled ? @"Common" : nil), fmt, ##__VA_ARGS__)
#define LogCommonVerbose(fmt, ...)  LogVerbose((kLogCommonEnabled ? @"Common" : nil), fmt, ##__VA_ARGS__)
#define LogCommonVerbosef(fmt, ...) LogVerboseC((kLogCommonEnabled ? @"Common" : nil), fmt, ##__VA_ARGS__)
#define LogCommonVerboseC(fmt, ...) LogVerboseC((kLogCommonEnabled ? @"Common" : nil), fmt, ##__VA_ARGS__)
#define LogCommonVerboseCf(fmt, ...) LogVerboseCf((kLogCommonEnabled ? @"Common" : nil), fmt, ##__VA_ARGS__)



#define LogApiError(fmt, ...)    LogError((kLogApiEnabled ? @"Api" : nil), fmt, ##__VA_ARGS__)
#define LogApiErrorf(fmt, ...)   LogErrorf((kLogApiEnabled ? @"Api" : nil), fmt, ##__VA_ARGS__)
#define LogApiErrorC(fmt, ...)   LogErrorC((kLogApiEnabled ? @"Api" : nil), fmt, ##__VA_ARGS__)
#define LogApiErrorCf(fmt, ...)  LogErrorCf((kLogApiEnabled ? @"Api" : nil), fmt, ##__VA_ARGS__)
#define LogApiWarn(fmt, ...)     LogWarn((kLogApiEnabled ? @"Api" : nil), fmt, ##__VA_ARGS__)
#define LogApiWarnf(fmt, ...)    LogWarnf((kLogApiEnabled ? @"Api" : nil), fmt, ##__VA_ARGS__)
#define LogApiWarnC(fmt, ...)    LogWarnC((kLogApiEnabled ? @"Api" : nil), fmt, ##__VA_ARGS__)
#define LogApiWarnCf(fmt, ...)   LogWarnCf((kLogApiEnabled ? @"Api" : nil), fmt, ##__VA_ARGS__)
#define LogApiInfo(fmt, ...)     LogInfo((kLogApiEnabled ? @"Api" : nil), fmt, ##__VA_ARGS__)
#define LogApiInfof(fmt, ...)    LogInfof((kLogApiEnabled ? @"Api" : nil), fmt, ##__VA_ARGS__)
#define LogApiInfoC(fmt, ...)    LogInfoC((kLogApiEnabled ? @"Api" : nil), fmt, ##__VA_ARGS__)
#define LogApiInfoCf(fmt, ...)   LogInfoCf((kLogApiEnabled ? @"Api" : nil), fmt, ##__VA_ARGS__)
#define LogApiDebug(fmt, ...)    LogDebug((kLogApiEnabled ? @"Api" : nil), fmt, ##__VA_ARGS__)
#define LogApiDebugf(fmt, ...)   LogDebugf((kLogApiEnabled ? @"Api" : nil), fmt, ##__VA_ARGS__)
#define LogApiDebugC(fmt, ...)   LogDebugC((kLogApiEnabled ? @"Api" : nil), fmt, ##__VA_ARGS__)
#define LogApiDebugCf(fmt, ...)  LogDebugCf((kLogApiEnabled ? @"Api" : nil), fmt, ##__VA_ARGS__)
#define LogApiVerbose(fmt, ...)  LogVerbose((kLogApiEnabled ? @"Api" : nil), fmt, ##__VA_ARGS__)
#define LogApiVerbosef(fmt, ...) LogVerboseC((kLogApiEnabled ? @"Api" : nil), fmt, ##__VA_ARGS__)
#define LogApiVerboseC(fmt, ...) LogVerboseC((kLogApiEnabled ? @"Api" : nil), fmt, ##__VA_ARGS__)
#define LogApiVerboseCf(fmt, ...) LogVerboseCf((kLogApiEnabled ? @"Api" : nil), fmt, ##__VA_ARGS__)



#define LogDbError(fmt, ...)    LogError((kLogDbEnabled ? @"Db" : nil), fmt, ##__VA_ARGS__)
#define LogDbErrorf(fmt, ...)   LogErrorf((kLogDbEnabled ? @"Db" : nil), fmt, ##__VA_ARGS__)
#define LogDbErrorC(fmt, ...)   LogErrorC((kLogDbEnabled ? @"Db" : nil), fmt, ##__VA_ARGS__)
#define LogDbErrorCf(fmt, ...)  LogErrorCf((kLogDbEnabled ? @"Db" : nil), fmt, ##__VA_ARGS__)
#define LogDbWarn(fmt, ...)     LogWarn((kLogDbEnabled ? @"Db" : nil), fmt, ##__VA_ARGS__)
#define LogDbWarnf(fmt, ...)    LogWarnf((kLogDbEnabled ? @"Db" : nil), fmt, ##__VA_ARGS__)
#define LogDbWarnC(fmt, ...)    LogWarnC((kLogDbEnabled ? @"Db" : nil), fmt, ##__VA_ARGS__)
#define LogDbWarnCf(fmt, ...)   LogWarnCf((kLogDbEnabled ? @"Db" : nil), fmt, ##__VA_ARGS__)
#define LogDbInfo(fmt, ...)     LogInfo((kLogDbEnabled ? @"Db" : nil), fmt, ##__VA_ARGS__)
#define LogDbInfof(fmt, ...)    LogInfof((kLogDbEnabled ? @"Db" : nil), fmt, ##__VA_ARGS__)
#define LogDbInfoC(fmt, ...)    LogInfoC((kLogDbEnabled ? @"Db" : nil), fmt, ##__VA_ARGS__)
#define LogDbInfoCf(fmt, ...)   LogInfoCf((kLogDbEnabled ? @"Db" : nil), fmt, ##__VA_ARGS__)
#define LogDbDebug(fmt, ...)    LogDebug((kLogDbEnabled ? @"Db" : nil), fmt, ##__VA_ARGS__)
#define LogDbDebugf(fmt, ...)   LogDebugf((kLogDbEnabled ? @"Db" : nil), fmt, ##__VA_ARGS__)
#define LogDbDebugC(fmt, ...)   LogDebugC((kLogDbEnabled ? @"Db" : nil), fmt, ##__VA_ARGS__)
#define LogDbDebugCf(fmt, ...)  LogDebugCf((kLogDbEnabled ? @"Db" : nil), fmt, ##__VA_ARGS__)
#define LogDbVerbose(fmt, ...)  LogVerbose((kLogDbEnabled ? @"Db" : nil), fmt, ##__VA_ARGS__)
#define LogDbVerbosef(fmt, ...) LogVerboseC((kLogDbEnabled ? @"Db" : nil), fmt, ##__VA_ARGS__)
#define LogDbVerboseC(fmt, ...) LogVerboseC((kLogDbEnabled ? @"Db" : nil), fmt, ##__VA_ARGS__)
#define LogDbVerboseCf(fmt, ...) LogVerboseCf((kLogDbEnabled ? @"Db" : nil), fmt, ##__VA_ARGS__)


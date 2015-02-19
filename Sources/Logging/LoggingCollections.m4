include(`Private/LoggingDefines.m4')

dnl 1st argument: global variable defining general logging level
dnl 2nd argument: global variable defining whether async logging should be used
loggingCommon(ddLogLevel, kLogAsync)

dnl 1st argument: name of the collection
dnl 2nd argument: global variable defining whether this collection is enabled or not
dnl 3rd argument: global variable defining general logging level
dnl 4th argument: global variable defining whether async logging should be used
loggingCollection(Common, kLogCommonEnabled, ddLogLevel, kLogAsync)
loggingCollection(Api, kLogApiEnabled, ddLogLevel, kLogAsync)
loggingCollection(Db, kLogDbEnabled, ddLogLevel, kLogAsync)
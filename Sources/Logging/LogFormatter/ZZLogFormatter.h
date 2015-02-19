//
//  LogFormatter.h
//
//  Created by Ivan on 24.01.13.
//
//

#import "DDLog.h"

@interface ZZLogFormatter : NSObject <DDLogFormatter>

@property (nonatomic) BOOL printTimestamp;
@property (nonatomic) BOOL printDateInTimestamp;
@property (nonatomic) BOOL printMachThreadID;
@property (nonatomic) NSInteger maxLineWidth;

@end

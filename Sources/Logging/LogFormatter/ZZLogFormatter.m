//
//  LogFormatter.m
//  StartFX-iOS
//
//  Created by Ivan on 24.01.13.
//
//

#import "ZZLogFormatter.h"
#import "LoggingDefines.h"

static NSString * const kWarningHeader = @"............................ Warning ............................";
static NSString * const kWarningFooter = @".................................................................";
static NSString * const kErrorHeader = @"**************************** ERROR ****************************";
static NSString * const kErrorFooter = @"***************************************************************";
static NSString * const kIndent = @"\n             :            :     ";

@implementation ZZLogFormatter {
    NSDateFormatter *formatter;
}

- (id) init
{
    if ((self = [super init])) {
        self.printTimestamp = YES;
        self.printDateInTimestamp = YES;
        self.printMachThreadID = YES;
        formatter = [NSDateFormatter new];
    }
    return self;
}

- (void) setPrintDateInTimestamp:(BOOL)printDateInTimestamp
{
    _printDateInTimestamp = printDateInTimestamp;
    if (printDateInTimestamp) {
        [formatter setDateFormat:@"yyyyMMdd HH:mm:ss.SSS"];
    } else {
        [formatter setDateFormat:@"HH:mm:ss.SSS"];
    }
}

+ (NSArray *) splitLineForMaximumLineWidth:(NSString *)line withMaxLineWidth:(NSInteger)maxLineWidth
{
    const NSInteger cutLength = MIN(maxLineWidth, 15);

    NSMutableArray *lines = [NSMutableArray new];

    NSInteger prevCutIndex = 0;
    NSInteger index = 0;

    while (YES) {
        index = prevCutIndex + maxLineWidth;
        if (index >= [line length]) {
            NSString *lastLine = [line substringFromIndex:prevCutIndex];
            [lines addObject:lastLine];
            break;
        }

        NSInteger cutIndex = index;
        for (NSInteger i = index; i >= index - cutLength; i--) {
            if ([line characterAtIndex:i] == ' ') {
                cutIndex = i + 1;
                break;
            }
        }

        NSString *currentLine = [line substringWithRange:NSMakeRange(prevCutIndex, cutIndex - prevCutIndex)];
        [lines addObject:currentLine];

        prevCutIndex = cutIndex;
    }

    return lines;
}

- (NSString *) formatLogMessage:(DDLogMessage *)msg
{
    BOOL logFunction = (msg->logContext & LoggingContextFlagPrintFunction);

    NSMutableArray *components = [NSMutableArray new];

    NSString *timestampString = [formatter stringFromDate:msg->timestamp];
    [components addObject:timestampString];

    if (self.printMachThreadID) {
        NSString *threadIdString = [NSString stringWithFormat:@"{%04X}", msg->machThreadID];
        [components addObject:threadIdString];
    }

    if (msg->tag) {
        NSMutableString *tagString = [NSMutableString stringWithFormat:@"%@", msg->tag];
        while ([tagString length] < 10) {
            [tagString appendString:@" "];
        }
        [components addObject:tagString];
    }
    
    NSMutableArray *messageContentComponents = [NSMutableArray new];

    if (logFunction && msg->function) {
        NSString *functionString = [NSString stringWithFormat:@"%s", msg->function];
        [messageContentComponents addObject:functionString];
    }
    
    if ([msg->logMsg length]) {
        [messageContentComponents addObject:msg->logMsg];
    }

    NSString *messageContent = [messageContentComponents componentsJoinedByString:@" | "];

    NSArray *messageLines = [messageContent componentsSeparatedByString:@"\n"];
    if (self.maxLineWidth) {
        NSMutableArray *messageLinesWordWrapped = [NSMutableArray new];
        for (NSString *line in messageLines) {
            NSArray *wordWrappedLines = [[self class] splitLineForMaximumLineWidth:line withMaxLineWidth:self.maxLineWidth];
            [messageLinesWordWrapped addObjectsFromArray:wordWrappedLines];
        }
        messageLines = messageLinesWordWrapped;
    }
    NSString *indentedMessage = [messageLines componentsJoinedByString:kIndent];
    [components addObject:indentedMessage];

    NSString *resultMessageWithoutHeaderFooter = [components componentsJoinedByString:@" | "];
    
    NSString *resultMessage = resultMessageWithoutHeaderFooter;

    if (msg->logFlag == LOG_FLAG_ERROR) {
        resultMessage = [NSString stringWithFormat:@"\n%@\n%@\n%@\n", kErrorHeader, resultMessageWithoutHeaderFooter, kErrorFooter];
    } else if (msg->logFlag == LOG_FLAG_WARN) {
        resultMessage = [NSString stringWithFormat:@"\n%@\n%@\n%@\n", kWarningHeader, resultMessageWithoutHeaderFooter, kWarningFooter];
    }

    return resultMessage;
}

@end

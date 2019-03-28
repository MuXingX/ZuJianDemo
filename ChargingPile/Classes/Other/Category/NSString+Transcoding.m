//
//  NSString+Transcoding.m
//  BusilinqMall
//
//  Created by MuXingXing on 2018/5/10.
//  Copyright © 2018年 busilinq. All rights reserved.
//

#import "NSString+Transcoding.h"

@implementation NSString (Transcoding)

- (NSString *)stringByReplaceUnicode:(NSString *)unicodeString
{
    NSMutableString *convertedString = [unicodeString mutableCopy];
    [convertedString replaceOccurrencesOfString:@"\\U" withString:@"\\u" options:0 range:NSMakeRange(0, convertedString.length)];
    CFStringRef transform = CFSTR("Any-Hex/Java");
    CFStringTransform((__bridge CFMutableStringRef)convertedString, NULL, transform, YES);
    
    return convertedString;
}



@end

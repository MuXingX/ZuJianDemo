//
//  BSHttpTool.h
//  BusilinqMall
//
//  Created by MuXingXing on 2018/4/17.
//  Copyright © 2018年 busilinq. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BSHttpTool : NSObject

/**
 *  请求成功Block
 */
__strong typedef void(^RequestSuccessBlock)(id successResponse , NSString *message , NSInteger result);

/**
 *  请求失败Block
 */
__strong typedef void(^RequestFailBlock)(NSString *errorStr);

/** post请求 */
+ (void)postData:(NSString *)url
           param:(NSDictionary *)param
         success:(RequestSuccessBlock)success
          failer:(RequestFailBlock)failure;

/** get 请求 */
+ (void)getData:(NSString *)url
          param:(NSDictionary *)param
        success:(RequestSuccessBlock)success
         failer:(RequestFailBlock)failure;
@end

//
//  HomeViewController.h
//  FunctionDemoTest
//
//  Created by lizhenzhen on 2020/3/5.
//  Copyright © 2020 devlzz. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

#pragma mark - 服务协议
@protocol YMMServiceProtocol <NSObject>

@optional
//是否作为单例使用
+ (BOOL)singleton;
//服务名称
- (NSString *)serviceName;

@end

@interface HomeViewController : UIViewController

@end

NS_ASSUME_NONNULL_END

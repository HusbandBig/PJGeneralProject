//
//  ThirdFramework.h
//  PJGeneralProject
//
//  Created by 张佩金 on 2018/9/27.
//  Copyright © 2018年 张佩金. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <SystemConfiguration/SystemConfiguration.h>
#import <netinet/in.h>


typedef enum : NSInteger {
    NotReachable = 0,
    ReachableViaWiFi,
    ReachableViaWWAN
} NetworkStatus;

#pragma mark IPv6 Support
//Reachability fully support IPv6.  For full details, see ReadMe.md.


extern NSString *kReachabilityChangedNotification;


@interface Reachability : NSObject

/*! Use to check the reachability of a given host name. */
+ (instancetype)reachabilityWithHostName:(NSString *)hostName;

/*! Use to check the reachability of a given IP address.*/
+ (instancetype)reachabilityWithAddress:(const struct sockaddr *)hostAddress;

/*! Checks whether the default route is available. Should be used by applications that do not connect to a particular host.*/
+ (instancetype)reachabilityForInternetConnection;


#pragma mark reachabilityForLocalWiFi
//reachabilityForLocalWiFi has been removed from the sample.  See ReadMe.md for more information.
//+ (instancetype)reachabilityForLocalWiFi;

/*!Start listening for reachability notifications on the current run loop.*/
- (BOOL)startNotifier;
- (void)stopNotifier;

- (NetworkStatus)currentReachabilityStatus;
/*! WWAN may be available, but not active until a connection has been established. WiFi may require a connection for VPN on Demand.*/
- (BOOL)connectionRequired;

@end





/** 网络状态 */
typedef enum{
    
    /** 无网络 */
    PJNetWorkStatusNone=0,
    /** Wifi网络 */
    PJNetWorkStatusWifi,
    /** 蜂窝网络 */
    PJNetWorkStatusWWAN,
    /** 2G网络 */
    PJNetWorkStatus2G,
    /** 3G网络 */
    PJNetWorkStatus3G,
    /** 4G网络 */
    PJNetWorkStatus4G,
    //未知网络
    PJNetWorkStatusUnknown
    
}PJNetWorkStatus;


@protocol PJNetworkStatusProtocol <NSObject>
/** 网络状态变更 */
- (void)coreNetworkChangeNotification:(NSNotification *)notification;
@end


@interface PJNetworkStatusManager : NSObject

/** 获取当前网络状态：枚举 */
+ (PJNetWorkStatus)currentNetWorkStatus;

/** 获取当前网络状态：字符串 */
+ (NSString *)currentNetWorkStatusString;


/** 开始网络监听 */
+ (void)beginNotiNetwork:(id<PJNetworkStatusProtocol>)listener;

/** 停止网络监听 NetworkStatusManager*/
+ (void)endNotiNetwork:(id<PJNetworkStatusProtocol>)listener;

/** 是否是Wifi */
+ (BOOL)isWifiEnable;

/** 是否有网络 */
+ (BOOL)isNetworkEnable;

/** 是否处于高速网络环境：3G、4G、Wifi */
+ (BOOL)isHighSpeedNetwork;



@end

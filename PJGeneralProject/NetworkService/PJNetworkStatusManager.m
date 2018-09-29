//
//  ThirdFramework.h
//  PJGeneralProject
//
//  Created by 张佩金 on 2018/9/27.
//  Copyright © 2018年 张佩金. All rights reserved.
//

#import "PJNetworkStatusManager.h"
#import <CoreTelephony/CTTelephonyNetworkInfo.h>

#import <arpa/inet.h>
#import <ifaddrs.h>
#import <netdb.h>
#import <sys/socket.h>
#import <netinet/in.h>
#import <CoreFoundation/CoreFoundation.h>

#pragma mark IPv6 Support
//Reachability fully support IPv6.  For full details, see ReadMe.md.


NSString *kReachabilityChangedNotification = @"kNetworkReachabilityChangedNotification";


#pragma mark - Supporting functions

#define kShouldPrintReachabilityFlags 1

static void PrintReachabilityFlags(SCNetworkReachabilityFlags flags, const char* comment)
{
#if kShouldPrintReachabilityFlags
    
    NSLog(@"Reachability Flag Status: %c%c %c%c%c%c%c%c%c %s\n",
          (flags & kSCNetworkReachabilityFlagsIsWWAN)               ? 'W' : '-',
          (flags & kSCNetworkReachabilityFlagsReachable)            ? 'R' : '-',
          
          (flags & kSCNetworkReachabilityFlagsTransientConnection)  ? 't' : '-',
          (flags & kSCNetworkReachabilityFlagsConnectionRequired)   ? 'c' : '-',
          (flags & kSCNetworkReachabilityFlagsConnectionOnTraffic)  ? 'C' : '-',
          (flags & kSCNetworkReachabilityFlagsInterventionRequired) ? 'i' : '-',
          (flags & kSCNetworkReachabilityFlagsConnectionOnDemand)   ? 'D' : '-',
          (flags & kSCNetworkReachabilityFlagsIsLocalAddress)       ? 'l' : '-',
          (flags & kSCNetworkReachabilityFlagsIsDirect)             ? 'd' : '-',
          comment
          );
#endif
}


static void ReachabilityCallback(SCNetworkReachabilityRef target, SCNetworkReachabilityFlags flags, void* info)
{
#pragma unused (target, flags)
    NSCAssert(info != NULL, @"info was NULL in ReachabilityCallback");
    NSCAssert([(__bridge NSObject*) info isKindOfClass: [Reachability class]], @"info was wrong class in ReachabilityCallback");
    
    Reachability* noteObject = (__bridge Reachability *)info;
    // Post a notification to notify the client that the network reachability changed.
    [[NSNotificationCenter defaultCenter] postNotificationName: kReachabilityChangedNotification object: noteObject];
}


#pragma mark - Reachability implementation

@implementation Reachability
{
    SCNetworkReachabilityRef _reachabilityRef;
}

+ (instancetype)reachabilityWithHostName:(NSString *)hostName
{
    Reachability* returnValue = NULL;
    SCNetworkReachabilityRef reachability = SCNetworkReachabilityCreateWithName(NULL, [hostName UTF8String]);
    if (reachability != NULL)
    {
        returnValue= [[self alloc] init];
        if (returnValue != NULL)
        {
            returnValue->_reachabilityRef = reachability;
        }
        else {
            CFRelease(reachability);
        }
    }
    return returnValue;
}


+ (instancetype)reachabilityWithAddress:(const struct sockaddr *)hostAddress
{
    SCNetworkReachabilityRef reachability = SCNetworkReachabilityCreateWithAddress(kCFAllocatorDefault, hostAddress);
    
    Reachability* returnValue = NULL;
    
    if (reachability != NULL)
    {
        returnValue = [[self alloc] init];
        if (returnValue != NULL)
        {
            returnValue->_reachabilityRef = reachability;
        }
        else {
            CFRelease(reachability);
        }
    }
    return returnValue;
}


+ (instancetype)reachabilityForInternetConnection
{
    struct sockaddr_in6 zeroAddress;
    bzero(&zeroAddress, sizeof(zeroAddress));
    
    zeroAddress.sin6_len = sizeof(zeroAddress);
    zeroAddress.sin6_family = AF_INET6;
    
    return [self reachabilityWithAddress: (const struct sockaddr *) &zeroAddress];
}

#pragma mark reachabilityForLocalWiFi
//reachabilityForLocalWiFi has been removed from the sample.  See ReadMe.md for more information.
//+ (instancetype)reachabilityForLocalWiFi



#pragma mark - Start and stop notifier

- (BOOL)startNotifier
{
    BOOL returnValue = NO;
    SCNetworkReachabilityContext context = {0, (__bridge void *)(self), NULL, NULL, NULL};
    
    if (SCNetworkReachabilitySetCallback(_reachabilityRef, ReachabilityCallback, &context))
    {
        if (SCNetworkReachabilityScheduleWithRunLoop(_reachabilityRef, CFRunLoopGetCurrent(), kCFRunLoopDefaultMode))
        {
            returnValue = YES;
        }
    }
    
    return returnValue;
}


- (void)stopNotifier
{
    if (_reachabilityRef != NULL)
    {
        SCNetworkReachabilityUnscheduleFromRunLoop(_reachabilityRef, CFRunLoopGetCurrent(), kCFRunLoopDefaultMode);
    }
}


- (void)dealloc
{
    [self stopNotifier];
    if (_reachabilityRef != NULL)
    {
        CFRelease(_reachabilityRef);
    }
}


#pragma mark - Network Flag Handling

- (NetworkStatus)networkStatusForFlags:(SCNetworkReachabilityFlags)flags
{
    PrintReachabilityFlags(flags, "networkStatusForFlags");
    if ((flags & kSCNetworkReachabilityFlagsReachable) == 0)
    {
        // The target host is not reachable.
        return NotReachable;
    }
    
    NetworkStatus returnValue = NotReachable;
    
    if ((flags & kSCNetworkReachabilityFlagsConnectionRequired) == 0)
    {
        /*
         If the target host is reachable and no connection is required then we'll assume (for now) that you're on Wi-Fi...
         */
        returnValue = ReachableViaWiFi;
    }
    
    if ((((flags & kSCNetworkReachabilityFlagsConnectionOnDemand ) != 0) ||
         (flags & kSCNetworkReachabilityFlagsConnectionOnTraffic) != 0))
    {
        /*
         ... and the connection is on-demand (or on-traffic) if the calling application is using the CFSocketStream or higher APIs...
         */
        
        if ((flags & kSCNetworkReachabilityFlagsInterventionRequired) == 0)
        {
            /*
             ... and no [user] intervention is needed...
             */
            returnValue = ReachableViaWiFi;
        }
    }
    
    if ((flags & kSCNetworkReachabilityFlagsIsWWAN) == kSCNetworkReachabilityFlagsIsWWAN)
    {
        /*
         ... but WWAN connections are OK if the calling application is using the CFNetwork APIs.
         */
        returnValue = ReachableViaWWAN;
    }
    
    return returnValue;
}


- (BOOL)connectionRequired
{
    NSAssert(_reachabilityRef != NULL, @"connectionRequired called with NULL reachabilityRef");
    SCNetworkReachabilityFlags flags;
    
    if (SCNetworkReachabilityGetFlags(_reachabilityRef, &flags))
    {
        return (flags & kSCNetworkReachabilityFlagsConnectionRequired);
    }
    
    return NO;
}


- (NetworkStatus)currentReachabilityStatus
{
    NSAssert(_reachabilityRef != NULL, @"currentNetworkStatus called with NULL SCNetworkReachabilityRef");
    NetworkStatus returnValue = NotReachable;
    SCNetworkReachabilityFlags flags;
    
    if (SCNetworkReachabilityGetFlags(_reachabilityRef, &flags))
    {
        returnValue = [self networkStatusForFlags:flags];
    }
    
    return returnValue;
}


@end










static NSString *const NetworkStatusChangedNotification = @"NetworkStatusChangedNotification";
static PJNetworkStatusManager *_manager = nil;

@interface PJNetworkStatusManager ()

/** 2G数组 */
@property (nonatomic,strong) NSArray *technology2GArray;

/** 3G数组 */
@property (nonatomic,strong) NSArray *technology3GArray;

/** 4G数组 */
@property (nonatomic,strong) NSArray *technology4GArray;

/** 网络状态中文数组 */
@property (nonatomic,strong) NSArray *coreNetworkStatusStringArray;

@property (nonatomic,strong) Reachability *reachability;

@property (nonatomic,strong) CTTelephonyNetworkInfo *telephonyNetworkInfo;

@property (nonatomic,copy) NSString *currentRaioAccess;

/** 是否正在监听 */
@property (nonatomic,assign) BOOL isNotification;

@end




@implementation PJNetworkStatusManager

+ (PJNetworkStatusManager*)shareInstance{
    
    if (_manager == nil) {
        static dispatch_once_t onceToken;
        dispatch_once(&onceToken, ^{
            _manager = [[PJNetworkStatusManager alloc] init];
        });
    }
    return _manager;
}


+ (void)initialize{
    
    [PJNetworkStatusManager shareInstance].telephonyNetworkInfo =  [[CTTelephonyNetworkInfo alloc] init];
}




#pragma mark - 获取当前网络状态：枚举
+ (PJNetWorkStatus)currentNetWorkStatus{
    
    return [[PJNetworkStatusManager shareInstance] statusWithRadioAccessTechnology];
}

#pragma mark - 获取当前网络状态：字符串
+ (NSString *)currentNetWorkStatusString{
    
    return [PJNetworkStatusManager shareInstance].coreNetworkStatusStringArray[[self currentNetWorkStatus]];
}

- (Reachability *)reachability{
    
    if(_reachability == nil){
        
        _reachability = [Reachability reachabilityForInternetConnection];
    }
    
    return _reachability;
}


- (CTTelephonyNetworkInfo *)telephonyNetworkInfo{
    
    if(_telephonyNetworkInfo == nil){
        
        _telephonyNetworkInfo = [[CTTelephonyNetworkInfo alloc] init];
        
    }
    
    return _telephonyNetworkInfo;
}


- (NSString *)currentRaioAccess{
    
    if(_currentRaioAccess == nil){
        
        _currentRaioAccess = self.telephonyNetworkInfo.currentRadioAccessTechnology;
    }
    
    return _currentRaioAccess;
}


#pragma mark -  开始网络监听
+ (void)beginNotiNetwork:(id<PJNetworkStatusProtocol>)listener{
    
    if([PJNetworkStatusManager shareInstance].isNotification){
    
        NSLog(@"CoreStatus已经处于监听中，请检查其他页面是否关闭监听！");
        
        [self endNotiNetwork:(id<PJNetworkStatusProtocol>)listener];
    }
    
    //注册监听
    [[NSNotificationCenter defaultCenter] addObserver:listener selector:@selector(coreNetworkChangeNotification:) name:NetworkStatusChangedNotification object:[PJNetworkStatusManager shareInstance]];
    [[NSNotificationCenter defaultCenter] addObserver:[PJNetworkStatusManager shareInstance] selector:@selector(coreNetWorkStatusChanged:) name:kReachabilityChangedNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:[PJNetworkStatusManager shareInstance] selector:@selector(coreNetWorkStatusChanged:) name:CTRadioAccessTechnologyDidChangeNotification object:nil];

    [[PJNetworkStatusManager shareInstance].reachability startNotifier];
    
    //标记
    [PJNetworkStatusManager shareInstance].isNotification = YES;
    

}







#pragma mark -  停止网络监听
+ (void)endNotiNetwork:(id<PJNetworkStatusProtocol>)listener{

    if(![PJNetworkStatusManager shareInstance].isNotification){
        
        NSLog(@"CoreStatus监听已经被关闭"); return;
    }
    
    //解除监听
    [[NSNotificationCenter defaultCenter] removeObserver:[PJNetworkStatusManager shareInstance] name:kReachabilityChangedNotification object:nil];
    [[NSNotificationCenter defaultCenter] removeObserver:[PJNetworkStatusManager shareInstance] name:CTRadioAccessTechnologyDidChangeNotification object:nil];
    [[NSNotificationCenter defaultCenter] removeObserver:listener name:NetworkStatusChangedNotification object:[PJNetworkStatusManager shareInstance]];
    
    //标记
    [PJNetworkStatusManager shareInstance].isNotification = NO;
    

}







- (void)coreNetWorkStatusChanged:(NSNotification *)notification
{
    //发送通知
    
    if (notification.name == CTRadioAccessTechnologyDidChangeNotification &&
        notification.object != nil) {
        
        self.currentRaioAccess = self.telephonyNetworkInfo.currentRadioAccessTechnology;
    }
    
    //再次发出通知
    NSDictionary *userInfo = @{@"currentStatusEnum":@([PJNetworkStatusManager currentNetWorkStatus]),@"currentStatusString":[PJNetworkStatusManager currentNetWorkStatusString]};
    
    [[NSNotificationCenter defaultCenter] postNotificationName:NetworkStatusChangedNotification object:self userInfo:userInfo];
}





- (PJNetWorkStatus)statusWithRadioAccessTechnology{
    
    PJNetWorkStatus status = (PJNetWorkStatus)[self.reachability currentReachabilityStatus];
    
    NSString *technology = self.currentRaioAccess;
    
    if (status == PJNetWorkStatusWWAN &&
        technology != nil) {
        
        if ([self.technology2GArray containsObject:technology]){
        
            status = PJNetWorkStatus2G;
            
        }else if ([self.technology3GArray containsObject:technology])
            
            status = PJNetWorkStatus3G;
        
        else if ([self.technology4GArray containsObject:technology]){
            status = PJNetWorkStatus4G;
        }
        
    }
    
    return status;
}


#pragma mark - 2G数组
- (NSArray *)technology2GArray{
    
    if(_technology2GArray == nil){
        
        _technology2GArray = @[CTRadioAccessTechnologyEdge,CTRadioAccessTechnologyGPRS];
    }
    
    return _technology2GArray;
}


#pragma mark - 3G数组
-(NSArray *)technology3GArray{
    
    if(_technology3GArray == nil){
        
        _technology3GArray = @[CTRadioAccessTechnologyHSDPA,
                               CTRadioAccessTechnologyWCDMA,
                               CTRadioAccessTechnologyHSUPA,
                               CTRadioAccessTechnologyCDMA1x,
                               CTRadioAccessTechnologyCDMAEVDORev0,
                               CTRadioAccessTechnologyCDMAEVDORevA,
                               CTRadioAccessTechnologyCDMAEVDORevB,
                               CTRadioAccessTechnologyeHRPD];
    }
    
    return _technology3GArray;
}

#pragma mark - 4G数组
-(NSArray *)technology4GArray{
    
    if(_technology4GArray == nil){
        
        _technology4GArray = @[CTRadioAccessTechnologyLTE];
    }
    
    return _technology4GArray;
}

#pragma mark - 网络状态中文数组
-(NSArray *)coreNetworkStatusStringArray{
    
    if(_coreNetworkStatusStringArray == nil){
        
        _coreNetworkStatusStringArray = @[@"无网络",@"Wifi",@"蜂窝网络",@"2G",@"3G",@"4G",@"未知网络"];
    }
    
    return _coreNetworkStatusStringArray;
}






#pragma mark - 是否是Wifi
+(BOOL)isWifiEnable{
    
    return [self currentNetWorkStatus] == PJNetWorkStatusWifi;
}


#pragma mark - 是否有网络
+(BOOL)isNetworkEnable{
    
    PJNetWorkStatus networkStatus = [self currentNetWorkStatus];
    
    return networkStatus!=PJNetWorkStatusUnknown && networkStatus != PJNetWorkStatusNone;
}

#pragma mark - 是否处于高速网络环境：3G、4G、Wifi
+(BOOL)isHighSpeedNetwork{
    PJNetWorkStatus networkStatus = [self currentNetWorkStatus];
    return networkStatus == PJNetWorkStatus3G || networkStatus == PJNetWorkStatus4G || networkStatus == PJNetWorkStatusWifi;
}

@end

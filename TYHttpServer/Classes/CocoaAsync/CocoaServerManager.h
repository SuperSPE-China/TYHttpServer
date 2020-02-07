//
//  CocoaServerManager.h
//  CocoaHTTPServer
//
//  Created by NEEARN on 2/1/20.
//  Copyright © 2020 superspe.com. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface CocoaServerManager : NSObject

@property (nonatomic, assign, readonly) NSUInteger serverPort;

+ (instancetype)sharedInstance;
- (void)startCocoaServer;
- (void)stopCocoaServer;


@end

NS_ASSUME_NONNULL_END

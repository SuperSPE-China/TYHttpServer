//
//  CocoaServerManager.m
//  CocoaHTTPServer
//
//  Created by NEEARN on 2/1/20.
//  Copyright © 2020 superspe.com. All rights reserved.
//

#import "CocoaServerManager.h"
#import "HTTPServer.h"
#import "MyHTTPConnection.h"

@interface CocoaServerManager(){
    HTTPServer *_httpServer; /** 创建服务 */
}

@end

@implementation CocoaServerManager

+ (instancetype)sharedInstance {
    static CocoaServerManager *_sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedInstance = [[CocoaServerManager alloc] init];
    });
    return _sharedInstance;
}

- (void)startCocoaServer {
    _serverPort = 60000;
    if (!_httpServer) {
        _httpServer = [[HTTPServer alloc] init];
        [_httpServer setConnectionClass:[MyHTTPConnection class]];
        [_httpServer setType:@"_http._tcp."];
        [_httpServer setPort:_serverPort];
        NSString * webLocalPath = [[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:@"Resource"];
        [_httpServer setDocumentRoot:webLocalPath];
        NSLog(@"Setting document root: %@", webLocalPath);
    }
    if (_httpServer && ![_httpServer isRunning]) {
        NSError *error;
        if([_httpServer start:&error]) {
            NSLog(@"start server success in port %d %@", [_httpServer listeningPort], [_httpServer publishedName]);
            NSLog(@"启动成功");
        } else {
            NSLog(@"启动失败");
        }
    }
    
}

- (void)stopCocoaServer {
    if (_httpServer && [_httpServer isRunning]) {
        [_httpServer stop];
    }
}



@end

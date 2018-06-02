//
//  NetworkService.m
//  Jokes
//
//  Created by Benjamin Kolosov on 02/06/2018.
//  Copyright © 2018 Benjamin Kolosov. All rights reserved.
//

#import "NetworkService.h"

@interface NetworkService ()
@property (nonatomic, copy) void(^completion)(NSData*);
@end

@implementation NetworkService

- (void)receiveData:(NSURL*)url completion:(void(^)(NSData*))completion{
    self.completion = completion;
    
    NSURLSessionDataTask *task = [[NSURLSession sharedSession] dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (error != nil){
            NSLog(@"Error = %@", error);
            return;
        }
        self.completion(data);
    }];
    
    [task resume];
}

@end

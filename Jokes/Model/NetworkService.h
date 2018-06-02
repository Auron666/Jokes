//
//  NetworkService.h
//  Jokes
//
//  Created by Benjamin Kolosov on 02/06/2018.
//  Copyright © 2018 Benjamin Kolosov. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NetworkService : NSObject

- (void)receiveData:(NSURL*)url completion:(void(^)(NSData*))completion;

@end

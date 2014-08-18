//
//  QuizletRequest.h
//  ios_quizlet_client
//
//  Created by Maxim Bilan on 8/18/14.
//  Copyright (c) 2014 Maxim Bilan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface QuizletRequest : NSObject

- (void)GET:(NSString *)urlString
 parameters:(id)parameters
    success:(void (^)(id responseObject))success
    failure:(void (^)(NSError *error))failure;

- (void)GET:(NSString *)urlString
  parameters:(id)parameters
headerFields:(id)headerFields
     success:(void (^)(id responseObject))success
     failure:(void (^)(NSError *error))failure;

- (void)POST:(NSString *)urlString
  parameters:(id)parameters
     success:(void (^)(id responseObject))success
     failure:(void (^)(NSError *error))failure;

- (void)POST:(NSString *)urlString
  parameters:(id)parameters
headerFields:(id)headerFields
     success:(void (^)(id responseObject))success
     failure:(void (^)(NSError *error))failure;

@end

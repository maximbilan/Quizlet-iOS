//
//  QuizletRequest.h
//  ios_quizlet_client
//
//  Created by Maxim Bilan on 8/18/14.
//  Copyright (c) 2014 Maxim Bilan. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, QuizletRequestType)
{
    QuizletRequestPublic,
    QuizletRequestUserAuthenticated
};

@class QuizletAuth;

@interface QuizletRequest : NSObject

- (void)GETwithAuth:(QuizletAuth *)auth
        requestType:(QuizletRequestType)type
          urlString:(NSString *)urlString
         parameters:(NSDictionary *)parameters
            success:(void (^)(id responseObject))success
            failure:(void (^)(NSError *error))failure;

- (void)POSTwithAuth:(QuizletAuth *)auth
         requestType:(QuizletRequestType)type
           urlString:(NSString *)urlString
          parameters:(NSDictionary *)parameters
             success:(void (^)(id responseObject))success
             failure:(void (^)(NSError *error))failure;

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

- (void)PUT:(NSString *)urlString
 parameters:(id)parameters
    success:(void (^)(id responseObject))success
    failure:(void (^)(NSError *error))failure;

- (void)PUT:(NSString *)urlString
 parameters:(id)parameters
headerFields:(id)headerFields
    success:(void (^)(id responseObject))success
    failure:(void (^)(NSError *error))failure;

- (void)DELETE:(NSString *)urlString
    parameters:(id)parameters
       success:(void (^)(id responseObject))success
       failure:(void (^)(NSError *error))failure;

- (void)DELETE:(NSString *)urlString
    parameters:(id)parameters
  headerFields:(id)headerFields
       success:(void (^)(id responseObject))success
       failure:(void (^)(NSError *error))failure;

@end

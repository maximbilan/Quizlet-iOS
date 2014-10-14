//
//  QuizletRequest.h
//  ios_quizlet_client
//
//  Created by Maxim Bilan on 8/18/14.
//  Copyright (c) 2014 Maxim Bilan. All rights reserved.
//
//  Latest code can be found on GitHub: https://github.com/maximbilan/ios_quizlet_client
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, QuizletHTTPMethod)
{
    QuizletHTTPMethodGET,
    QuizletHTTPMethodPOST,
    QuizletHTTPMethodPUT,
    QuizletHTTPMethodDELETE
};

typedef NS_ENUM(NSInteger, QuizletRequestType)
{
    QuizletRequestPublic,
    QuizletRequestUserAuthenticated
};

@class QuizletAuth;

@interface QuizletRequest : NSObject

- (void)requestWithAuth:(QuizletAuth *)auth
                 method:(QuizletHTTPMethod)method
                   type:(QuizletRequestType)type
              urlString:(NSString *)urlString
             parameters:(NSDictionary *)parameters
                success:(void (^)(id responseObject))success
                failure:(void (^)(NSError *error))failure;

- (void)multiPartRequestWithAuth:(QuizletAuth *)auth
                            type:(QuizletRequestType)type
                       urlString:(NSString *)urlString
                      parameters:(NSDictionary *)parameters
                    formDataName:(NSString *)formDataName
                        formData:(NSArray *)formDataArray
                         success:(void (^)(id responseObject))success
                         failure:(void (^)(NSError *error))failure;

- (void)GET:(NSString *)urlString
  parameters:(id)parameters
headerFields:(id)headerFields
     success:(void (^)(id responseObject))success
     failure:(void (^)(NSError *error))failure;

- (void)POST:(NSString *)urlString
  parameters:(id)parameters
headerFields:(id)headerFields
     success:(void (^)(id responseObject))success
     failure:(void (^)(NSError *error))failure;

- (void)POSTmultiPart:(NSString *)urlString
           parameters:(id)parameters
         headerFields:(id)headerFields
         formDataName:(NSString *)formDataName
             formData:(NSArray *)formDataArray
              success:(void (^)(id responseObject))success
              failure:(void (^)(NSError *error))failure;

- (void)PUT:(NSString *)urlString
 parameters:(id)parameters
headerFields:(id)headerFields
    success:(void (^)(id responseObject))success
    failure:(void (^)(NSError *error))failure;

- (void)DELETE:(NSString *)urlString
    parameters:(id)parameters
  headerFields:(id)headerFields
       success:(void (^)(id responseObject))success
       failure:(void (^)(NSError *error))failure;

@end

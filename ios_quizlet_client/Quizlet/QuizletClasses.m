//
//  QuizletClasses.m
//  ios_quizlet_client
//
//  Created by Maxim Bilan on 8/19/14.
//  Copyright (c) 2014 Maxim Bilan. All rights reserved.
//

#import "QuizletClasses.h"
#import "QuizletConfig.h"
#import "QuizletRequest.h"
#import "QuizletAuth.h"

@implementation QuizletClasses

- (void)viewClassById:(NSString *)classId
             withAuth:(QuizletAuth *)auth
              success:(void (^)(id responseObject))success
              failure:(void (^)(NSError *error))failure
{
    NSString *urlString = [NSString stringWithFormat:@"%@/classes/%@", QuizletAPIBaseUrl, classId];
    QuizletRequest *request = [[QuizletRequest alloc] init];
    [request requestWithAuth:auth
                      method:QuizletHTTPMethodGET
                        type:QuizletRequestUserAuthenticated
                   urlString:urlString
                  parameters:nil
                     success:success
                     failure:failure];
}

- (void)viewClassSetsById:(NSString *)classId
                 withAuth:(QuizletAuth *)auth
                  success:(void (^)(id responseObject))success
                  failure:(void (^)(NSError *error))failure
{
    NSString *urlString = [NSString stringWithFormat:@"%@/classes/%@/sets", QuizletAPIBaseUrl, classId];
    QuizletRequest *request = [[QuizletRequest alloc] init];
    [request requestWithAuth:auth
                      method:QuizletHTTPMethodGET
                        type:QuizletRequestUserAuthenticated
                   urlString:urlString
                  parameters:nil
                     success:success
                     failure:failure];
}

- (void)addClass:(NSDictionary *)dictionary
        withAuth:(QuizletAuth *)auth
         success:(void (^)(id responseObject))success
         failure:(void (^)(NSError *error))failure
{
    NSString *urlString = [NSString stringWithFormat:@"%@/classes", QuizletAPIBaseUrl];
    NSDictionary *parameters = nil;
    if (dictionary) {
        parameters = dictionary;
    }
    QuizletRequest *request = [[QuizletRequest alloc] init];
    [request requestWithAuth:auth
                      method:QuizletHTTPMethodPOST
                        type:QuizletRequestUserAuthenticated
                   urlString:urlString
                  parameters:parameters
                     success:success
                     failure:failure];
}

- (void)editClass:(NSDictionary *)dictionary
        byClassId:(NSString *)classId
         withAuth:(QuizletAuth *)auth
          success:(void (^)(id responseObject))success
          failure:(void (^)(NSError *error))failure
{
    NSString *urlString = [NSString stringWithFormat:@"%@/classes/%@", QuizletAPIBaseUrl, classId];
    NSDictionary *parameters = nil;
    if (dictionary) {
        parameters = dictionary;
    }
    QuizletRequest *request = [[QuizletRequest alloc] init];
    [request requestWithAuth:auth
                      method:QuizletHTTPMethodPUT
                        type:QuizletRequestUserAuthenticated
                   urlString:urlString
                  parameters:parameters
                     success:success
                     failure:failure];
}

- (void)deleteClassById:(NSString *)classId
               withAuth:(QuizletAuth *)auth
                success:(void (^)(id responseObject))success
                failure:(void (^)(NSError *error))failure
{
    NSString *urlString = [NSString stringWithFormat:@"%@/classes/%@", QuizletAPIBaseUrl, classId];
    QuizletRequest *request = [[QuizletRequest alloc] init];
    [request requestWithAuth:auth
                      method:QuizletHTTPMethodDELETE
                        type:QuizletRequestUserAuthenticated
                   urlString:urlString
                  parameters:nil
                     success:success
                     failure:failure];
}

- (void)addSetBySetId:(NSString *)setId
           forClassId:(NSString *)classId
             withAuth:(QuizletAuth *)auth
              success:(void (^)(id responseObject))success
              failure:(void (^)(NSError *error))failure
{
    NSString *urlString = [NSString stringWithFormat:@"%@/classes/%@/sets/%@", QuizletAPIBaseUrl, setId, classId];
    QuizletRequest *request = [[QuizletRequest alloc] init];
    [request requestWithAuth:auth
                      method:QuizletHTTPMethodPUT
                        type:QuizletRequestUserAuthenticated
                   urlString:urlString
                  parameters:nil
                     success:success
                     failure:failure];
}

- (void)deleteSetBySetId:(NSString *)setid
      fromClassByClassId:(NSString *)classId
                withAuth:(QuizletAuth *)auth
                 success:(void (^)(id responseObject))success
                 failure:(void (^)(NSError *error))failure
{
    NSString *urlString = [NSString stringWithFormat:@"%@/classes/%@/sets/%@", QuizletAPIBaseUrl, setid, classId];
    QuizletRequest *request = [[QuizletRequest alloc] init];
    [request requestWithAuth:auth
                      method:QuizletHTTPMethodDELETE
                        type:QuizletRequestUserAuthenticated
                   urlString:urlString
                  parameters:nil
                     success:success
                     failure:failure];
}

- (void)joinClassByClassId:(NSString *)classId
                  withAuth:(QuizletAuth *)auth
                   success:(void (^)(id responseObject))success
                   failure:(void (^)(NSError *error))failure
{
    NSString *urlString = [NSString stringWithFormat:@"%@/classes/%@/members/%@", QuizletAPIBaseUrl, classId, auth.userId];
    QuizletRequest *request = [[QuizletRequest alloc] init];
    [request requestWithAuth:auth
                      method:QuizletHTTPMethodPUT
                        type:QuizletRequestUserAuthenticated
                   urlString:urlString
                  parameters:nil
                     success:success
                     failure:failure];
}

- (void)leaveClassByClassId:(NSString *)classId
                   withAuth:(QuizletAuth *)auth
                    success:(void (^)(id responseObject))success
                    failure:(void (^)(NSError *error))failure
{
    NSString *urlString = [NSString stringWithFormat:@"%@/classes/%@/members/%@", QuizletAPIBaseUrl, classId, auth.userId];
    QuizletRequest *request = [[QuizletRequest alloc] init];
    [request requestWithAuth:auth
                      method:QuizletHTTPMethodDELETE
                        type:QuizletRequestUserAuthenticated
                   urlString:urlString
                  parameters:nil
                     success:success
                     failure:failure];
}

@end

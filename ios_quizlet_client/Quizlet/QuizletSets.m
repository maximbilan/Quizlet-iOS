//
//  QuizletSets.m
//  ios_quizlet_client
//
//  Created by Maxim Bilan on 8/18/14.
//  Copyright (c) 2014 Maxim Bilan. All rights reserved.
//

#import "QuizletSets.h"
#import "QuizletConfig.h"
#import "QuizletAuth.h"
#import "QuizletRequest.h"

@implementation QuizletSets

- (void)viewSetById:(NSString *)Id withAuth:(QuizletAuth *)auth
            success:(void (^)(id responseObject))success
            failure:(void (^)(NSError *error))failure
{
    NSString *urlString = [NSString stringWithFormat:@"%@/sets/%@", QuizletAPIBaseUrl, Id];
    QuizletRequest *request = [[QuizletRequest alloc] init];
    [request requestWithAuth:auth
                      method:QuizletHTTPMethodGET
                        type:QuizletRequestUserAuthenticated
                   urlString:urlString
                  parameters:nil
                     success:success
                     failure:failure];
}

- (void)viewSetTermsById:(NSString *)Id withAuth:(QuizletAuth *)auth
                 success:(void (^)(id responseObject))success
                 failure:(void (^)(NSError *error))failure
{
    NSString *urlString = [NSString stringWithFormat:@"%@/sets/%@/terms", QuizletAPIBaseUrl, Id];
    QuizletRequest *request = [[QuizletRequest alloc] init];
    [request requestWithAuth:auth
                      method:QuizletHTTPMethodGET
                        type:QuizletRequestUserAuthenticated
                   urlString:urlString
                  parameters:nil
                     success:success
                     failure:failure];
}

- (void)submitPassword:(NSString *)password
            forSetById:(NSString *)setId
              withAuth:(QuizletAuth *)auth
               success:(void (^)(id responseObject))success
               failure:(void (^)(NSError *error))failure
{
    NSString *urlString = [NSString stringWithFormat:@"%@/sets/%@/password", QuizletAPIBaseUrl, setId];
    NSDictionary *parameters = nil;
    if (password) {
        parameters = @{ @"password": password };
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

- (void)viewSetsByIds:(NSString *)ids
             withAuth:(QuizletAuth *)auth
              success:(void (^)(id responseObject))success
              failure:(void (^)(NSError *error))failure
{
    NSString *urlString = [NSString stringWithFormat:@"%@/sets", QuizletAPIBaseUrl];
    NSDictionary *parameters = nil;
    if (ids) {
        parameters = @{ @"set_ids": ids };
    }
    QuizletRequest *request = [[QuizletRequest alloc] init];
    [request requestWithAuth:auth
                      method:QuizletHTTPMethodGET
                        type:QuizletRequestUserAuthenticated
                   urlString:urlString
                  parameters:parameters
                     success:success
                     failure:failure];
}

- (void)addSet:(NSDictionary *)dictionary
      withAuth:(QuizletAuth *)auth
       success:(void (^)(id responseObject))success
       failure:(void (^)(NSError *error))failure
{
    NSString *urlString = [NSString stringWithFormat:@"%@/sets", QuizletAPIBaseUrl];
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

- (void)editSet:(NSDictionary *)dictionary
           byId:(NSString *)setId
       withAuth:(QuizletAuth *)auth
        success:(void (^)(id responseObject))success
        failure:(void (^)(NSError *error))failure
{
    NSString *urlString = [NSString stringWithFormat:@"%@/sets/%@", QuizletAPIBaseUrl, setId];
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

- (void)deleteSetById:(NSString *)setId
             withAuth:(QuizletAuth *)auth
              success:(void (^)(id responseObject))success
              failure:(void (^)(NSError *error))failure
{
    NSString *urlString = [NSString stringWithFormat:@"%@/sets/%@", QuizletAPIBaseUrl, setId];
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

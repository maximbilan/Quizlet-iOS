//
//  QuizletSets.m
//  ios_quizlet_client
//
//  Created by Maxim Bilan on 8/18/14.
//  Copyright (c) 2014 Maxim Bilan. All rights reserved.
//
//  Latest code can be found on GitHub: https://github.com/maximbilan/ios_quizlet_client
//

#import "QuizletSets.h"
#import "QuizletConfig.h"
#import "QuizletAuth.h"
#import "QuizletRequest.h"

@implementation QuizletSets

- (void)viewSetBySetId:(NSString *)setId
              withAuth:(QuizletAuth *)auth
               success:(void (^)(id responseObject))success
               failure:(void (^)(NSError *error))failure
{
    NSString *urlString = [NSString stringWithFormat:@"%@/sets/%@", QuizletAPIBaseUrl, setId];
    QuizletRequest *request = [[QuizletRequest alloc] init];
    [request requestWithAuth:auth
                      method:QuizletHTTPMethodGET
                        type:QuizletRequestUserAuthenticated
                   urlString:urlString
                  parameters:nil
                     success:success
                     failure:failure];
}

- (void)viewSetTermsBySetId:(NSString *)setId
                   withAuth:(QuizletAuth *)auth
                    success:(void (^)(id responseObject))success
                    failure:(void (^)(NSError *error))failure
{
    NSString *urlString = [NSString stringWithFormat:@"%@/sets/%@/terms", QuizletAPIBaseUrl, setId];
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
         forSetBySetId:(NSString *)setId
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

- (void)viewSetsBySetIds:(NSString *)setIds
                withAuth:(QuizletAuth *)auth
                 success:(void (^)(id responseObject))success
                 failure:(void (^)(NSError *error))failure
{
    NSString *urlString = [NSString stringWithFormat:@"%@/sets", QuizletAPIBaseUrl];
    NSDictionary *parameters = nil;
    if (setIds) {
        parameters = @{ @"set_ids": setIds };
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

- (void)addSetFromDictionary:(NSDictionary *)dictionary
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

- (void)editSetFromDictionary:(NSDictionary *)dictionary
                      bySetId:(NSString *)setId
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

- (void)deleteSetBySetId:(NSString *)setId
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

- (void)addTermFromDictionary:(NSDictionary *)dictionary
                 toSetBySetId:(NSString *)setId
                     withAuth:(QuizletAuth *)auth
                      success:(void (^)(id responseObject))success
                      failure:(void (^)(NSError *error))failure
{
    NSString *urlString = [NSString stringWithFormat:@"%@/sets/%@/terms", QuizletAPIBaseUrl, setId];
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

- (void)editTermFromDictionary:(NSDictionary *)dictionary
                fromSetBySetId:(NSString *)setId
                      byTermId:(NSString *)termId
                      withAuth:(QuizletAuth *)auth
                       success:(void (^)(id responseObject))success
                       failure:(void (^)(NSError *error))failure
{
    NSString *urlString = [NSString stringWithFormat:@"%@/sets/%@/terms/%@", QuizletAPIBaseUrl, setId, termId];
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

- (void)deleteTermFromSetBySetId:(NSString *)setId
                        byTermId:(NSString *)termId
                        withAuth:(QuizletAuth *)auth
                         success:(void (^)(id responseObject))success
                         failure:(void (^)(NSError *error))failure
{
    NSString *urlString = [NSString stringWithFormat:@"%@/sets/%@/terms/%@", QuizletAPIBaseUrl, setId, termId];
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

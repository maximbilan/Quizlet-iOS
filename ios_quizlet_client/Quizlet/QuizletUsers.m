//
//  QuizletUsers.m
//  ios_quizlet_client
//
//  Created by Maxim Bilan on 8/18/14.
//  Copyright (c) 2014 Maxim Bilan. All rights reserved.
//

#import "QuizletUsers.h"
#import "QuizletConfig.h"
#import "QuizletRequest.h"
#import "QuizletAuth.h"

@interface QuizletUsers ()

@end

@implementation QuizletUsers

- (void)userDetailsWithAuth:(QuizletAuth *)auth
                    success:(void (^)(id responseObject))success
                    failure:(void (^)(NSError *error))failure
{
    NSString *urlString = [NSString stringWithFormat:@"%@/users/%@", QuizletAPIBaseUrl, auth.userId];
    QuizletRequest *request = [[QuizletRequest alloc] init];
    [request requestWithAuth:auth
                      method:QuizletHTTPMethodGET
                        type:QuizletRequestUserAuthenticated
                   urlString:urlString
                  parameters:nil
                     success:success
                     failure:failure];
}

- (void)setsWithAuth:(QuizletAuth *)auth
             success:(void (^)(id responseObject))success
             failure:(void (^)(NSError *error))failure
{
    NSString *urlString = [NSString stringWithFormat:@"%@/users/%@/sets", QuizletAPIBaseUrl, auth.userId];
    QuizletRequest *request = [[QuizletRequest alloc] init];
    [request requestWithAuth:auth
                      method:QuizletHTTPMethodGET
                        type:QuizletRequestUserAuthenticated
                   urlString:urlString
                  parameters:nil
                     success:success
                     failure:failure];
}

- (void)favoritesWithAuth:(QuizletAuth *)auth
                  success:(void (^)(id responseObject))success
                  failure:(void (^)(NSError *error))failure
{
    NSString *urlString = [NSString stringWithFormat:@"%@/users/%@/favorites", QuizletAPIBaseUrl, auth.userId];
    QuizletRequest *request = [[QuizletRequest alloc] init];
    [request requestWithAuth:auth
                      method:QuizletHTTPMethodGET
                        type:QuizletRequestUserAuthenticated
                   urlString:urlString
                  parameters:nil
                     success:success
                     failure:failure];
}

- (void)classesWithAuth:(QuizletAuth *)auth
                success:(void (^)(id responseObject))success
                failure:(void (^)(NSError *error))failure
{
    NSString *urlString = [NSString stringWithFormat:@"%@/users/%@/classes", QuizletAPIBaseUrl, auth.userId];
    QuizletRequest *request = [[QuizletRequest alloc] init];
    [request requestWithAuth:auth
                      method:QuizletHTTPMethodGET
                        type:QuizletRequestUserAuthenticated
                   urlString:urlString
                  parameters:nil
                     success:success
                     failure:failure];
}

- (void)studiedWithAuth:(QuizletAuth *)auth
                success:(void (^)(id responseObject))success
                failure:(void (^)(NSError *error))failure
{
    NSString *urlString = [NSString stringWithFormat:@"%@/users/%@/studied", QuizletAPIBaseUrl, auth.userId];
    QuizletRequest *request = [[QuizletRequest alloc] init];
    [request requestWithAuth:auth
                      method:QuizletHTTPMethodGET
                        type:QuizletRequestUserAuthenticated
                   urlString:urlString
                  parameters:nil
                     success:success
                     failure:failure];
}

- (void)markUserSetAsFavoriteById:(NSString *)setId withAuth:(QuizletAuth *)auth
                          success:(void (^)(id responseObject))success
                          failure:(void (^)(NSError *error))failure
{
    NSString *urlString = [NSString stringWithFormat:@"%@/users/%@/favorites/%@", QuizletAPIBaseUrl, auth.userId, setId];
    QuizletRequest *request = [[QuizletRequest alloc] init];
    [request requestWithAuth:auth
                      method:QuizletHTTPMethodPUT
                        type:QuizletRequestUserAuthenticated
                   urlString:urlString
                  parameters:nil
                     success:success
                     failure:failure];
}

- (void)unmarkUserSetAsFavoriteById:(NSString *)setId withAuth:(QuizletAuth *)auth
                            success:(void (^)(id responseObject))success
                            failure:(void (^)(NSError *error))failure
{
    NSString *urlString = [NSString stringWithFormat:@"%@/users/%@/favorites/%@", QuizletAPIBaseUrl, auth.userId, setId];
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

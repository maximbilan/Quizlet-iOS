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

- (void)getRequestByUrl:(NSString *)urlString
               withAuth:(QuizletAuth *)auth
                success:(void (^)(id responseObject))success
                failure:(void (^)(NSError *error))failure;

@end

@implementation QuizletUsers

- (void)getRequestByUrl:(NSString *)urlString
               withAuth:(QuizletAuth *)auth
                success:(void (^)(id responseObject))success
                failure:(void (^)(NSError *error))failure
{
    NSDictionary *headerFields = @{ @"Authorization" : [NSString stringWithFormat:@"Bearer %@", auth.accessToken] };
    
    QuizletRequest *request = [[QuizletRequest alloc] init];
    [request GET:urlString parameters:nil headerFields:headerFields success:success failure:failure];
}

- (void)userDetailsWithAuth:(QuizletAuth *)auth
                    success:(void (^)(id responseObject))success
                    failure:(void (^)(NSError *error))failure
{
    NSString *urlString = [NSString stringWithFormat:@"https://api.quizlet.com/2.0/users/%@", auth.userId];
    [self getRequestByUrl:urlString withAuth:auth success:success failure:failure];
}

- (void)setsWithAuth:(QuizletAuth *)auth
             success:(void (^)(id responseObject))success
             failure:(void (^)(NSError *error))failure
{
    NSString *urlString = [NSString stringWithFormat:@"https://api.quizlet.com/2.0/users/%@/sets", auth.userId];
    [self getRequestByUrl:urlString withAuth:auth success:success failure:failure];
}

- (void)favoritesWithAuth:(QuizletAuth *)auth
                  success:(void (^)(id responseObject))success
                  failure:(void (^)(NSError *error))failure
{
    NSString *urlString = [NSString stringWithFormat:@"https://api.quizlet.com/2.0/users/%@/favorites", auth.userId];
    [self getRequestByUrl:urlString withAuth:auth success:success failure:failure];
}

- (void)classesWithAuth:(QuizletAuth *)auth
                success:(void (^)(id responseObject))success
                failure:(void (^)(NSError *error))failure
{
    NSString *urlString = [NSString stringWithFormat:@"https://api.quizlet.com/2.0/users/%@/classes", auth.userId];
    [self getRequestByUrl:urlString withAuth:auth success:success failure:failure];
}

- (void)studiedWithAuth:(QuizletAuth *)auth
                success:(void (^)(id responseObject))success
                failure:(void (^)(NSError *error))failure
{
    NSString *urlString = [NSString stringWithFormat:@"https://api.quizlet.com/2.0/users/%@/studied", auth.userId];
    [self getRequestByUrl:urlString withAuth:auth success:success failure:failure];
}

@end

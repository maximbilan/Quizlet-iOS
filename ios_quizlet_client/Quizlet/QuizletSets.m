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

- (void)getRequestByUrl:(NSString *)urlString
               withAuth:(QuizletAuth *)auth
                success:(void (^)(id responseObject))success
                failure:(void (^)(NSError *error))failure
{
    NSDictionary *headerFields = @{ @"Authorization" : [NSString stringWithFormat:@"Bearer %@", auth.accessToken] };
    
    QuizletRequest *request = [[QuizletRequest alloc] init];
    [request GET:urlString parameters:nil headerFields:headerFields success:success failure:failure];
}

- (void)setById:(NSString *)Id withAuth:(QuizletAuth *)auth
        success:(void (^)(id responseObject))success
        failure:(void (^)(NSError *error))failure
{
    NSString *urlString = [NSString stringWithFormat:@"%@/sets/%@", QuizletAPIBaseUrl, Id];
    [self getRequestByUrl:urlString withAuth:auth success:success failure:failure];
}

- (void)setTermsById:(NSString *)Id withAuth:(QuizletAuth *)auth
             success:(void (^)(id responseObject))success
             failure:(void (^)(NSError *error))failure
{
    NSString *urlString = [NSString stringWithFormat:@"%@/sets/%@/terms", QuizletAPIBaseUrl, Id];
    [self getRequestByUrl:urlString withAuth:auth success:success failure:failure];
}

- (void)setPasswordById:(NSString *)Id withAuth:(QuizletAuth *)auth
                success:(void (^)(id responseObject))success
                failure:(void (^)(NSError *error))failure
{
    NSString *urlString = [NSString stringWithFormat:@"%@/sets/%@/password", QuizletAPIBaseUrl, Id];
    [self getRequestByUrl:urlString withAuth:auth success:success failure:failure];
}

- (void)setsWithAuth:(QuizletAuth *)auth
             success:(void (^)(id responseObject))success
             failure:(void (^)(NSError *error))failure
{
    NSString *urlString = [NSString stringWithFormat:@"%@/sets", QuizletAPIBaseUrl];
    [self getRequestByUrl:urlString withAuth:auth success:success failure:failure];
}

@end

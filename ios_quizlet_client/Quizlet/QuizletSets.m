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
             parameters:(NSDictionary *)parameters
               withAuth:(QuizletAuth *)auth
                success:(void (^)(id responseObject))success
                failure:(void (^)(NSError *error))failure
{
    NSDictionary *headerFields = @{ @"Authorization" : [NSString stringWithFormat:@"Bearer %@", auth.accessToken] };
    
    QuizletRequest *request = [[QuizletRequest alloc] init];
    [request GET:urlString parameters:parameters headerFields:headerFields success:success failure:failure];
}

- (void)postRequestByUrl:(NSString *)urlString
              parameters:(NSDictionary *)parameters
                withAuth:(QuizletAuth *)auth
                 success:(void (^)(id responseObject))success
                 failure:(void (^)(NSError *error))failure
{
    NSDictionary *headerFields = @{ @"Authorization" : [NSString stringWithFormat:@"Bearer %@", auth.accessToken] };
    
    QuizletRequest *request = [[QuizletRequest alloc] init];
    [request POST:urlString parameters:parameters headerFields:headerFields success:success failure:failure];
}

- (void)viewSetById:(NSString *)Id withAuth:(QuizletAuth *)auth
            success:(void (^)(id responseObject))success
            failure:(void (^)(NSError *error))failure
{
    NSString *urlString = [NSString stringWithFormat:@"%@/sets/%@", QuizletAPIBaseUrl, Id];
    //[self getRequestByUrl:urlString parameters:nil withAuth:auth success:success failure:failure];
    QuizletRequest *request = [[QuizletRequest alloc] init];
    [request GETwithAuth:auth requestType:QuizletRequestUserAuthenticated urlString:urlString parameters:nil success:success failure:failure];
}

- (void)viewSetTermsById:(NSString *)Id withAuth:(QuizletAuth *)auth
                 success:(void (^)(id responseObject))success
                 failure:(void (^)(NSError *error))failure
{
    NSString *urlString = [NSString stringWithFormat:@"%@/sets/%@/terms", QuizletAPIBaseUrl, Id];
    [self getRequestByUrl:urlString parameters:nil withAuth:auth success:success failure:failure];
}

- (void)submitPasswordBySetId:(NSString *)Id
                 withPassword:(NSString *)password
                     withAuth:(QuizletAuth *)auth
                      success:(void (^)(id responseObject))success
                      failure:(void (^)(NSError *error))failure
{
    NSString *urlString = [NSString stringWithFormat:@"%@/sets/%@/password", QuizletAPIBaseUrl, Id];
    NSDictionary *parameters = nil;
    if (password) {
        parameters = @{ @"password": password };
    }
    [self postRequestByUrl:urlString parameters:parameters withAuth:auth success:success failure:failure];
}

- (void)viewSetsWithAuth:(QuizletAuth *)auth
                 success:(void (^)(id responseObject))success
                 failure:(void (^)(NSError *error))failure
{
    NSString *urlString = [NSString stringWithFormat:@"%@/sets", QuizletAPIBaseUrl];
    [self getRequestByUrl:urlString parameters:nil withAuth:auth success:success failure:failure];
}

@end

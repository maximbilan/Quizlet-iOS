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

@end

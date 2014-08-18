//
//  QuizletUsers.m
//  ios_quizlet_client
//
//  Created by Maxim Bilan on 8/18/14.
//  Copyright (c) 2014 Maxim Bilan. All rights reserved.
//

#import "QuizletUsers.h"
#import "QuizletRequest.h"
#import "QuizletAuth.h"

@implementation QuizletUsers

- (void)userDetailsWithAuth:(QuizletAuth *)auth
                    success:(void (^)(id responseObject))success
                    failure:(void (^)(NSError *error))failure
{
    NSString *urlString = [NSString stringWithFormat:@"https://api.quizlet.com/2.0/users/%@", auth.userId];
    
    NSDictionary *headerFields = @{
                                   @"Authorization" : [NSString stringWithFormat:@"Bearer %@", auth.accessToken]
                                   };
    
    QuizletRequest *request = [[QuizletRequest alloc] init];
    [request GET:urlString parameters:nil headerFields:headerFields success:success failure:failure];
}

@end

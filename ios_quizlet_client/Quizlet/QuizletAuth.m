//
//  QuizletAuth.m
//  ios_quizlet_client
//
//  Created by Maxim Bilan on 8/18/14.
//  Copyright (c) 2014 Maxim Bilan. All rights reserved.
//

#import "QuizletAuth.h"
#import "QuizletScope.h"

#import "AFNetworking.h"


static NSString * const QuizletAuthBaseUrl = @"https://quizlet.com/authorize";
static NSString * const QuizletAuthParams = @"response_type=%@&client_id=%@&scope=%@&state=%@";
static NSString * const QuizletAuthResponseType = @"code";

@implementation QuizletAuth

- (void)redirectToAuthServerWithClientID:(NSString *)clientID
{
    NSString *responseType = QuizletAuthResponseType;
    NSString *scope = QuizletScopeValues[QuizletScopeRead];
    NSString *state = [[NSProcessInfo processInfo] globallyUniqueString];
    NSString *paramsString = [NSString stringWithFormat:QuizletAuthParams, responseType, clientID, scope, state];
    NSString *urlString = [NSString stringWithFormat:@"%@?%@", QuizletAuthBaseUrl, paramsString];
    NSURL *url = [NSURL URLWithString:urlString];
    [[UIApplication sharedApplication] openURL:url];
}

- (void)requestTokenFromAuthServerWithClientID:(NSString *)clientID withSecretKey:(NSString *)secretKey withCode:(NSString *)code
{
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    
    NSDictionary *parameters = @{@"grant_type" : @"authorization_code",
                                 @"code" : code};
    
    NSString *authData = [NSString stringWithFormat:@"%@:%@", clientID, secretKey];
    NSData *plainData = [authData dataUsingEncoding:NSUTF8StringEncoding];
    NSString *base64String = [plainData base64EncodedStringWithOptions:0];
    [manager.requestSerializer setValue:[NSString stringWithFormat:@"Basic %@", base64String] forHTTPHeaderField:@"Authorization"];
    [manager.requestSerializer setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
    
    [manager POST:@"https://api.quizlet.com/oauth/token" parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSLog(@"JSON: %@", responseObject);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Error: %@", error);
    }];
}

@end

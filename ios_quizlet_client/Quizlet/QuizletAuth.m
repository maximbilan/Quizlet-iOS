//
//  QuizletAuth.m
//  ios_quizlet_client
//
//  Created by Maxim Bilan on 8/18/14.
//  Copyright (c) 2014 Maxim Bilan. All rights reserved.
//

#import "QuizletAuth.h"
#import "QuizletRequest.h"

#import "AFNetworking.h"

static NSString * const QuizletAuthBaseUrl = @"https://quizlet.com/authorize";
static NSString * const QuizletAuthParams = @"response_type=%@&client_id=%@&scope=%@&state=%@";
static NSString * const QuizletAuthResponseType = @"code";

@interface QuizletAuth ()

@property (nonatomic, strong, readwrite) NSString *accessToken;
@property (nonatomic, readwrite) double expiresIn;
@property (nonatomic, readwrite) QuizletScope scope;
@property (nonatomic, strong, readwrite) NSString *tokenType;
@property (nonatomic, strong, readwrite) NSString *userId;

@end

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
    NSDictionary *parameters = @{
                                 @"grant_type" : @"authorization_code",
                                 @"code" : code
                                 };
    
    NSString *authData = [NSString stringWithFormat:@"%@:%@", clientID, secretKey];
    NSData *plainData = [authData dataUsingEncoding:NSUTF8StringEncoding];
    NSString *base64String = [plainData base64EncodedStringWithOptions:0];
    
    NSDictionary *headerFields = @{
                                   @"Authorization" : [NSString stringWithFormat:@"Basic %@", base64String]
                                   };
    
    QuizletRequest *request = [[QuizletRequest alloc] init];
    [request POST:@"https://api.quizlet.com/oauth/token" parameters:parameters headerFields:headerFields success:^(id responseObject) {
        NSLog(@"responseObject %@", responseObject);
        if (responseObject) {
            NSDictionary *dict = (NSDictionary *)responseObject;
            if (dict) {
                if (dict[@"access_token"]) {
                    self.accessToken = dict[@"access_token"];
                }
                if (dict[@"expires_in"]) {
                    self.expiresIn = [dict[@"expires_in"] doubleValue];
                }
                if (dict[@"scope"]) {
                    self.scope = [dict[@"scope"] integerValue];
                }
                if (dict[@"token_type"]) {
                    self.tokenType = dict[@"token_type"];
                }
                if (dict[@"user_id"]) {
                    self.userId = dict[@"user_id"];
                }
            }
        }
    } failure:^(NSError *error) {
        NSLog(@"error %@", error);
    }];
}

@end

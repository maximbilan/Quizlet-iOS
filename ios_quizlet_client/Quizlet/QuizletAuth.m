//
//  QuizletAuth.m
//  ios_quizlet_client
//
//  Created by Maxim Bilan on 8/18/14.
//  Copyright (c) 2014 Maxim Bilan. All rights reserved.
//
//  Latest code can be found on GitHub: https://github.com/maximbilan/ios_quizlet_client
//

#import "QuizletConfig.h"
#import "QuizletAuth.h"
#import "QuizletRequest.h"
#import "QuizletUsers.h"

static NSString * const QuizletAuthBaseUrl = @"https://quizlet.com/authorize";
static NSString * const QuizletAuthTokenUrl = @"https://api.quizlet.com/oauth/token";
static NSString * const QuizletAuthParams = @"response_type=%@&client_id=%@&scope=%@&state=%@";
static NSString * const QuizletAuthResponseType = @"code";
static NSString * const QuizletAuthGrantType = @"authorization_code";

@interface QuizletAuth ()

@property (nonatomic, strong, readwrite) NSString *accessToken;
@property (nonatomic, readwrite) double expiresIn;
@property (nonatomic, readwrite) QuizletScope scope;
@property (nonatomic, strong, readwrite) NSString *tokenType;
@property (nonatomic, strong, readwrite) NSString *userId;

@property (nonatomic, readwrite) QuizletAccountType accountType;

- (void)load;
- (void)save;

@end

@implementation QuizletAuth

- (void)dealloc
{
    self.accessToken = nil;
    self.tokenType = nil;
    self.userId = nil;
    self.authSuccess = nil;
    self.authFailure = nil;
}

- (id)init
{
    if (self = [super init]) {
        self.accountType = -1;
        [self load];
    }
    return self;
}

- (void)load
{
    self.accessToken = [[NSUserDefaults standardUserDefaults] objectForKey:@"QuizletAuthAccessToken"];
    self.expiresIn = [[[NSUserDefaults standardUserDefaults] objectForKey:@"QuizletAuthExpiresIn"] doubleValue];
    self.scope = [[[NSUserDefaults standardUserDefaults] objectForKey:@"QuizletAuthScope"] integerValue];
    self.tokenType = [[NSUserDefaults standardUserDefaults] objectForKey:@"QuizletAuthTokenType"];
    self.userId = [[NSUserDefaults standardUserDefaults] objectForKey:@"QuizletAuthUserId"];
}

- (void)save
{
    if (self.accessToken) {
        [[NSUserDefaults standardUserDefaults] setObject:self.accessToken forKey:@"QuizletAuthAccessToken"];
    }
    [[NSUserDefaults standardUserDefaults] setObject:@(self.expiresIn) forKey:@"QuizletAuthExpiresIn"];
    [[NSUserDefaults standardUserDefaults] setObject:@(self.scope) forKey:@"QuizletAuthScope"];
    if (self.tokenType) {
        [[NSUserDefaults standardUserDefaults] setObject:self.tokenType forKey:@"QuizletAuthTokenType"];
    }
    if (self.userId) {
        [[NSUserDefaults standardUserDefaults] setObject:self.userId forKey:@"QuizletAuthUserId"];
    }
    [[NSUserDefaults standardUserDefaults] synchronize];
}

- (void)redirectToAuthServerWithClientID:(NSString *)clientID
{
    NSString *responseType = QuizletAuthResponseType;
    NSString *scope = [NSString stringWithFormat:@"%@+%@+%@", QuizletScopeValues[QuizletScopeRead],
                       QuizletScopeValues[QuizletScopeWriteSet], QuizletScopeValues[QuizletScopeWriteGroup]];
    NSString *state = [[NSProcessInfo processInfo] globallyUniqueString];
    NSString *paramsString = [NSString stringWithFormat:QuizletAuthParams, responseType, clientID, scope, state];
    NSString *urlString = [NSString stringWithFormat:@"%@?%@", QuizletAuthBaseUrl, paramsString];
    NSURL *url = [NSURL URLWithString:urlString];
    [[UIApplication sharedApplication] openURL:url];
}

- (void)requestTokenFromAuthServerWithClientID:(NSString *)clientID withSecretKey:(NSString *)secretKey withCode:(NSString *)code
{
    NSDictionary *parameters = @{
                                 @"grant_type" : QuizletAuthGrantType,
                                 @"code" : code
                                 };
    
    NSString *authData = [NSString stringWithFormat:@"%@:%@", clientID, secretKey];
    NSData *plainData = [authData dataUsingEncoding:NSUTF8StringEncoding];
    NSString *base64String = [plainData base64EncodedStringWithOptions:0];
    
    NSDictionary *headerFields = @{
                                   @"Authorization" : [NSString stringWithFormat:@"Basic %@", base64String]
                                   };
    
    QuizletRequest *request = [[QuizletRequest alloc] init];
    [request POST:QuizletAuthTokenUrl parameters:parameters headerFields:headerFields success:^(id responseObject) {
#ifdef QUIZLET_LOG
        NSLog(@"responseObject %@", responseObject);
#endif
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
        
        self.isAuthorized = YES;
        [self save];
        
        QuizletUsers *users = [[QuizletUsers alloc] init];
        [users userDetailsWithAuth:self success:^(id responseObject) {
#ifdef QUIZLET_LOG
            NSLog(@"%@", responseObject);
#endif
            NSDictionary *responseDictionary = (NSDictionary *)responseObject;
            if (responseDictionary) {
                [self determineAccoutTypeFromString:responseDictionary[@"account_type"]];
            };
            
            self.authSuccess();
        } failure:^(NSError *error) {
#ifdef QUIZLET_LOG
            NSLog(@"%@", error);
#endif
            self.authSuccess();
        }];
        
    } failure:^(NSError *error) {
#ifdef QUIZLET_LOG
        NSLog(@"error %@", error);
#endif
        self.isAuthorized = NO;
        self.authFailure(error);
    }];
}

- (void)determineAccoutTypeFromString:(NSString *)string
{
    if (string && string.length > 0) {
        if ([string isEqualToString:@"free"]) {
            self.accountType = QuizletAccountFree;
        }
        else if ([string isEqualToString:@"plus"]) {
            self.accountType = QuizletAccountPlus;
        }
    }
}

- (NSDictionary *)headerFieldsWithAccessToken
{
    return @{ @"Authorization" : [NSString stringWithFormat:@"Bearer %@", self.accessToken] };
}

@end

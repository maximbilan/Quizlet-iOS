//
//  Quizlet.m
//  ios_quizlet_client
//
//  Created by Maxim Bilan on 8/17/14.
//  Copyright (c) 2014 Maxim Bilan. All rights reserved.
//

#import "Quizlet.h"
#import "QuizletConfig.h"
#import "QuizletAuth.h"
#import "QuizletUsers.h"
#import "QuizletSets.h"

@interface Quizlet ()

@property (nonatomic, strong, readwrite) NSString *clientID;
@property (nonatomic, strong, readwrite) NSString *secretKey;
@property (nonatomic, strong, readwrite) NSString *redirectURI;
@property (nonatomic, strong, readwrite) QuizletAuth *auth;
@property (nonatomic, strong, readwrite) QuizletUsers *users;
@property (nonatomic, strong, readwrite) QuizletSets *sets;

@end

@implementation Quizlet

#pragma mark - Common

+ (Quizlet *)sharedQuizlet
{
    static dispatch_once_t once_token;
    static Quizlet *quizlet = nil;
    dispatch_once(&once_token, ^{
        quizlet = [[self alloc] init];
    });
    
    return quizlet;
}

- (void)dealloc
{
    self.clientID = nil;
    self.secretKey = nil;
    self.redirectURI = nil;
    self.auth = nil;
    self.users = nil;
    self.sets = nil;
}

#pragma mark - Setup

- (void)startWithClientID:(NSString *)clientId withSecretKey:(NSString *)secretKey withRedirectURI:(NSString *)redirectURI
{
    self.clientID = clientId;
    self.secretKey = secretKey;
    self.redirectURI = redirectURI;
    self.auth = [[QuizletAuth alloc] init];
    self.users = [[QuizletUsers alloc] init];
    self.sets = [[QuizletSets alloc] init];
}

#pragma mark - Authorization

- (void)authorize
{
    if (self.auth.accessToken && self.auth.userId) {
        [[Quizlet sharedQuizlet] userDetails:^(id responseObject) {
#ifdef QUIZLET_LOG
            NSLog(@"%@", responseObject);
#endif
        } failure:^(NSError *error) {
#ifdef QUIZLET_LOG
            NSLog(@"%@", error);
#endif
            [self.auth redirectToAuthServerWithClientID:self.clientID];
        }];
    }
    else {
        [self.auth redirectToAuthServerWithClientID:self.clientID];
    }
}

- (void)handleURL:(NSURL *)url
{
    NSString *res = [url resourceSpecifier];
    
    NSRange r = [res rangeOfString:@"?"];
    NSString *action = r.length ? [res substringToIndex:r.location] : res;
    NSString *paramsQuery = r.length ? [res substringFromIndex:r.location + 1] : nil;
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    
    NSArray *keyVars = [paramsQuery componentsSeparatedByString:@"&"];
    for (NSString *keyVar in keyVars) {
        NSArray *a = [keyVar componentsSeparatedByString:@"="];
        if ([a count] == 2) {
            params[[a[0] stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding]] =
            [a[1] stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
        }
    }
    
#ifdef QUIZLET_LOG
    NSLog(@"URL detected:");
    NSLog(@"  action: %@", action);
    NSLog(@"  params: %@", params);
#endif
    
    if (params[@"code"]) {
        NSString *code = params[@"code"];
        if (code.length > 0) {
            [self.auth requestTokenFromAuthServerWithClientID:self.clientID
                                                withSecretKey:self.secretKey
                                                     withCode:code];
        }
    }
}

#pragma mark - Sets API

- (void)viewSetById:(NSString *)setId success:(void (^)(id responseObject))success failure:(void (^)(NSError *error))failure
{
    [self.sets viewSetById:setId withAuth:self.auth success:success failure:failure];
}

- (void)viewSetTermsById:(NSString *)setId success:(void (^)(id responseObject))success failure:(void (^)(NSError *error))failure
{
    [self.sets viewSetTermsById:setId withAuth:self.auth success:success failure:failure];
}

- (void)submitPassword:(NSString *)password bySetId:(NSString *)setId success:(void (^)(id responseObject))success failure:(void (^)(NSError *error))failure
{
    [self.sets submitPasswordBySetId:setId withPassword:password withAuth:self.auth success:success failure:failure];
}

- (void)viewSets:(void (^)(id responseObject))success failure:(void (^)(NSError *error))failure
{
    [self.sets viewSetsWithAuth:self.auth success:success failure:failure];
}

#pragma mark - Users API

- (void)userDetails:(void (^)(id responseObject))success failure:(void (^)(NSError *error))failure
{
    [self.users userDetailsWithAuth:self.auth success:success failure:failure];
}

- (void)userSets:(void (^)(id responseObject))success failure:(void (^)(NSError *error))failure
{
    [self.users setsWithAuth:self.auth success:success failure:failure];
}

- (void)userFavorites:(void (^)(id responseObject))success failure:(void (^)(NSError *error))failure
{
    [self.users favoritesWithAuth:self.auth success:success failure:failure];
}

- (void)userClasses:(void (^)(id responseObject))success failure:(void (^)(NSError *error))failure
{
    [self.users classesWithAuth:self.auth success:success failure:failure];
}

- (void)userStudied:(void (^)(id responseObject))success failure:(void (^)(NSError *error))failure
{
    [self.users studiedWithAuth:self.auth success:success failure:failure];
}

- (void)markUserSetAsFavoriteById:(NSString *)setId success:(void (^)(id responseObject))success failure:(void (^)(NSError *error))failure
{
    [self.users markUserSetAsFavoriteById:setId withAuth:self.auth success:success failure:failure];
}

- (void)unmarkUserSetAsFavoriteById:(NSString *)setId success:(void (^)(id responseObject))success failure:(void (^)(NSError *error))failure
{
    [self.users unmarkUserSetAsFavoriteById:setId withAuth:self.auth success:success failure:failure];
}

@end

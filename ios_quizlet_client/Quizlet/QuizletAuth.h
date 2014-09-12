//
//  QuizletAuth.h
//  ios_quizlet_client
//
//  Created by Maxim Bilan on 8/18/14.
//  Copyright (c) 2014 Maxim Bilan. All rights reserved.
//
//  Latest code can be found on GitHub: https://github.com/maximbilan/ios_quizlet_client
//

#import <Foundation/Foundation.h>

#import "QuizletScope.h"

typedef NS_ENUM(NSInteger, QuizletAccountType)
{
    QuizletAccountFree,
    QuizletAccountPlus
};

typedef void(^QuizletAuthCompletionSuccess)(void);
typedef void(^QuizletAuthCompletionFailure)(NSError *error);

@interface QuizletAuth : NSObject

@property (nonatomic, strong, readonly) NSString *accessToken;
@property (nonatomic, readonly) double expiresIn;
@property (nonatomic, readonly) QuizletScope scope;
@property (nonatomic, strong, readonly) NSString *tokenType;
@property (nonatomic, strong, readonly) NSString *userId;

@property (nonatomic, readonly) QuizletAccountType accountType;
@property (nonatomic, readwrite) BOOL isAuthorized;
@property (nonatomic, strong, readwrite) QuizletAuthCompletionSuccess authSuccess;
@property (nonatomic, strong, readwrite) QuizletAuthCompletionFailure authFailure;

- (void)redirectToAuthServerWithClientID:(NSString *)clientID;
- (void)requestTokenFromAuthServerWithClientID:(NSString *)clientID withSecretKey:(NSString *)secretKey withCode:(NSString *)code;

- (void)determineAccoutTypeFromString:(NSString *)string;

- (NSDictionary *)headerFieldsWithAccessToken;

@end

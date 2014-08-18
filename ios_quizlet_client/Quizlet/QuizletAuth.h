//
//  QuizletAuth.h
//  ios_quizlet_client
//
//  Created by Maxim Bilan on 8/18/14.
//  Copyright (c) 2014 Maxim Bilan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface QuizletAuth : NSObject

- (void)redirectToAuthServerWithClientID:(NSString *)clientID;
- (void)requestTokenFromAuthServerWithClientID:(NSString *)clientID withSecretKey:(NSString *)secretKey withCode:(NSString *)code;

@end

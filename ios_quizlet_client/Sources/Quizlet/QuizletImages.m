//
//  QuizletImages.m
//  ios_quizlet_client
//
//  Created by Maxim Bilan on 8/19/14.
//  Copyright (c) 2014 Maxim Bilan. All rights reserved.
//
//  Latest code can be found on GitHub: https://github.com/maximbilan/ios_quizlet_client
//

#import "QuizletImages.h"
#import "QuizletConfig.h"
#import "QuizletAuth.h"
#import "QuizletRequest.h"

@implementation QuizletImages

- (void)uploadImageFromURLs:(NSArray *)urls
                   withAuth:(QuizletAuth *)auth
                    success:(void (^)(id responseObject))success
                    failure:(void (^)(NSError *error))failure
{
    NSString *urlString = [NSString stringWithFormat:@"%@/images", QuizletAPIBaseUrl];
    QuizletRequest *request = [[QuizletRequest alloc] init];
    [request multiPartRequestWithAuth:auth
                                 type:QuizletRequestUserAuthenticated
                            urlString:urlString
                           parameters:nil
                         formDataName:@"imageData[]"
                             formData:urls
                              success:success
                              failure:failure];
}

@end

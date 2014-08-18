//
//  QZAppDelegate.m
//  ios_quizlet_client
//
//  Created by Maxim Bilan on 8/17/14.
//  Copyright (c) 2014 Maxim Bilan. All rights reserved.
//

#import "QZAppDelegate.h"
#import "Quizlet.h"
#import "AFNetworking.h"

@implementation QZAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    [[Quizlet sharedQuizlet] startWithClientID:@"E3Ww84Uwp2"
                                 withSecretKey:@"4677En2h5bPUd5j6HmjNn5"
                               withRedirectURI:@"maximbilan:/after_oauth"];
    
    return YES;
}
							
- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation
{
    NSLog(@"%@", url);
    
    NSLog(@"Calling Application Bundle ID: %@", sourceApplication);
    NSLog(@"URL scheme:%@", [url scheme]);
    NSLog(@"URL query: %@", [url query]);
    
    if ([[url scheme] isEqualToString:@"maximbilan"]) {
        
        [[Quizlet sharedQuizlet] handleURL:url];
        
//        NSString* res = [url resourceSpecifier];
//		
//		NSRange r = [res rangeOfString:@"?"];
//		NSString* action = r.length ? [res substringToIndex:r.location] : res;
//		NSString* params_query = r.length ? [res substringFromIndex:r.location+1] : nil;
//		NSMutableDictionary* params = [NSMutableDictionary dictionary];
//		
//		NSArray* key_vars = [params_query componentsSeparatedByString:@"&"];
//		for (NSString* key_var in key_vars)
//		{
//			NSArray* a = [key_var componentsSeparatedByString:@"="];
//			if ([a count] == 2)
//			{
//				params[[a[0] stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding]] =
//                [a[1] stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
//			}
//		}
//		
//		NSLog(@"URL detected:");
//		NSLog(@"  action: %@", action);
//		NSLog(@"  params: %@", params);
//        
//        if (params[@"code"]) {
//            NSString *code = params[@"code"];
//            
//            AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
//            
//            NSDictionary *parameters = @{@"grant_type" : @"authorization_code",
//                                         @"code" : code};
//                                         //@"redirect_uri" : @"maximbilan:/after_oauth"};
//            
//            NSString *clientId = @"E3Ww84Uwp2";
//            NSString *secretKey = @"4677En2h5bPUd5j6HmjNn5";
//            NSString *authData = [NSString stringWithFormat:@"%@:%@", clientId, secretKey];
//            
//            NSData *plainData = [authData dataUsingEncoding:NSUTF8StringEncoding];
//            NSString *base64String = [plainData base64EncodedStringWithOptions:0];
//            
//            //manager.responseSerializer = [AFJSONResponseSerializer serializer];
//            //manager.securityPolicy.allowInvalidCertificates = YES;
//            [manager.requestSerializer setValue:[NSString stringWithFormat:@"Basic %@", base64String] forHTTPHeaderField:@"Authorization"];
////            [manager.requestSerializer setValue:code forHTTPHeaderField:@"code"];
////            [manager.requestSerializer setValue:@"authorization_code" forHTTPHeaderField:@"grant_type"];
//            [manager.requestSerializer setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
//            
//            
//            
//            [manager POST:@"https://api.quizlet.com/oauth/token" parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
//                NSLog(@"JSON: %@", responseObject);
//            } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
//                NSLog(@"Error: %@", error);
//            }];
//        }
    }
    
    return YES;
}

@end

//
//  QZLoginViewController.m
//  ios_quizlet_client
//
//  Created by Maxim Bilan on 8/17/14.
//  Copyright (c) 2014 Maxim Bilan. All rights reserved.
//

#import "QZLoginViewController.h"
#import "Quizlet.h"
#import "AFNetworking.h"

@interface QZLoginViewController ()

@end

@implementation QZLoginViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)loginAction:(UIBarButtonItem *)sender
{
//    //if (self.usernameTextField.text.length > 0 && self.passwordTextField.text.length > 0) {
//        AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
//    
//        [manager GET:@"https://quizlet.com/authorize?response_type=code&client_id=E3Ww84Uwp2&scope=read&state=RANDOM_STRING" parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
//            NSLog(@"Response: %@", responseObject);
//        } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
//            NSLog(@"Error: %@", error);
//        }];
//    //}
    
    
//    NSString *urlString = [NSString stringWithFormat:@"https://quizlet.com/authorize?response_type=code&client_id=E3Ww84Uwp2&scope=read&state=%@", [[NSProcessInfo processInfo] globallyUniqueString]];
//    NSURL *url = [NSURL URLWithString:urlString];
//    [[UIApplication sharedApplication] openURL:url];
    
    [[Quizlet sharedQuizlet] authorize];
}

- (IBAction)actionButton:(UIButton *)sender
{
    [[Quizlet sharedQuizlet] userDetails];
}

@end

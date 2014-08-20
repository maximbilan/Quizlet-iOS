//
//  QZUsersViewController.m
//  ios_quizlet_client
//
//  Created by Maxim Bilan on 8/20/14.
//  Copyright (c) 2014 Maxim Bilan. All rights reserved.
//

#import "QZUsersViewController.h"
#import "QZExamplesViewController.h"

#import "Quizlet.h"

@interface QZUsersViewController ()

@property (weak, nonatomic) IBOutlet UITextView *logTextView;

@end

@implementation QZUsersViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    switch (self.exampleId) {
        case QZExamplesUserDetails:
        {
            [[Quizlet sharedQuizlet] userDetails:^(id responseObject) {
                self.logTextView.text = [NSString stringWithFormat:@"%@", responseObject];
            } failure:^(NSError *error) {
                self.logTextView.text = [error description];
            }];
        }
        break;
            
        case QZExamplesUserSets:
            break;
            
        case QZExamplesUserFavorites:
            break;
            
        case QZExamplesUserClasses:
            break;
            
        case QZExamplesUserStudied:
            break;
            
        case QZExamplesMarkSetAsFavorite:
            break;
            
        case QZExamplesUnmarkSetAsFavorite:
            break;
            
        default:
            break;
    }
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

@end

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
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    self.logTextView.text = @"";
    
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
        {
            [[Quizlet sharedQuizlet] userSets:^(id responseObject) {
                self.logTextView.text = [NSString stringWithFormat:@"%@", responseObject];
            } failure:^(NSError *error) {
                self.logTextView.text = [error description];
            }];
        }
        break;
            
        case QZExamplesUserFavorites:
        {
            [[Quizlet sharedQuizlet] userFavorites:^(id responseObject) {
                self.logTextView.text = [NSString stringWithFormat:@"%@", responseObject];
            } failure:^(NSError *error) {
                self.logTextView.text = [error description];
            }];
        }
        break;
            
        case QZExamplesUserClasses:
        {
            [[Quizlet sharedQuizlet] userClasses:^(id responseObject) {
                self.logTextView.text = [NSString stringWithFormat:@"%@", responseObject];
            } failure:^(NSError *error) {
                self.logTextView.text = [error description];
            }];
        }
        break;
            
        case QZExamplesUserStudied:
        {
            [[Quizlet sharedQuizlet] userStudied:^(id responseObject) {
                self.logTextView.text = [NSString stringWithFormat:@"%@", responseObject];
            } failure:^(NSError *error) {
                self.logTextView.text = [error description];
            }];
        }
        break;
            
        case QZExamplesMarkSetAsFavorite:
        {
            
        }
        break;
            
        case QZExamplesUnmarkSetAsFavorite:
        {
            
        }
        break;
            
        default:
            break;
    }
}

@end

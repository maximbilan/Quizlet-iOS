//
//  QZUsersViewController.m
//  ios_quizlet_client
//
//  Created by Maxim Bilan on 8/20/14.
//  Copyright (c) 2014 Maxim Bilan. All rights reserved.
//

#import "QZUsersViewController.h"
#import "QZExamplesViewController.h"

#import "WaitSpinner.h"

#import "Quizlet.h"
#import "QuizletImages.h"

@interface QZUsersViewController ()

@property (strong, nonatomic) WaitSpinner *waitSpinner;
@property (weak, nonatomic) IBOutlet UITextView *logTextView;
@property (weak, nonatomic) IBOutlet UITextField *setIdTextField;
@property (weak, nonatomic) IBOutlet UIButton *submitButton;

@end

@implementation QZUsersViewController

#pragma mark - View Controller Methods

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.waitSpinner = [[WaitSpinner alloc] init];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    self.logTextView.text = @"";
    
    [self.waitSpinner showInView:self.view];
	
	__weak QZUsersViewController *weakSelf = self;
	
    switch (self.exampleId) {
        case QZExamplesUserDetails:
        {
            [[Quizlet sharedQuizlet] userDetails:^(id responseObject) {
                weakSelf.logTextView.text = [NSString stringWithFormat:@"%@", responseObject];
                [weakSelf.waitSpinner hide];
            } failure:^(NSError *error) {
                weakSelf.logTextView.text = [error description];
                [weakSelf.waitSpinner hide];
            }];
        }
        break;
            
        case QZExamplesUserSets:
        {
            [[Quizlet sharedQuizlet] userSets:^(id responseObject) {
                weakSelf.logTextView.text = [NSString stringWithFormat:@"%@", responseObject];
                [weakSelf.waitSpinner hide];
            } failure:^(NSError *error) {
                weakSelf.logTextView.text = [error description];
                [weakSelf.waitSpinner hide];
            }];
        }
        break;
            
        case QZExamplesUserFavorites:
        {
            [[Quizlet sharedQuizlet] userFavorites:^(id responseObject) {
                weakSelf.logTextView.text = [NSString stringWithFormat:@"%@", responseObject];
                [weakSelf.waitSpinner hide];
            } failure:^(NSError *error) {
                weakSelf.logTextView.text = [error description];
                [weakSelf.waitSpinner hide];
            }];
        }
        break;
            
        case QZExamplesUserClasses:
        {
            [[Quizlet sharedQuizlet] userClasses:^(id responseObject) {
                weakSelf.logTextView.text = [NSString stringWithFormat:@"%@", responseObject];
                [weakSelf.waitSpinner hide];
            } failure:^(NSError *error) {
                weakSelf.logTextView.text = [error description];
                [weakSelf.waitSpinner hide];
            }];
        }
        break;
            
        case QZExamplesUserStudied:
        {
            [[Quizlet sharedQuizlet] userStudied:^(id responseObject) {
                weakSelf.logTextView.text = [NSString stringWithFormat:@"%@", responseObject];
                [weakSelf.waitSpinner hide];
            } failure:^(NSError *error) {
                weakSelf.logTextView.text = [error description];
                [weakSelf.waitSpinner hide];
            }];
        }
        break;
            
        case QZExamplesMarkSetAsFavorite:
        case QZExamplesUnmarkSetAsFavorite:
        {
            [weakSelf.waitSpinner hide];
            weakSelf.setIdTextField.hidden = NO;
            weakSelf.submitButton.hidden = NO;
        }
        break;
            
        default:
            break;
    }
}

#pragma mark - Actions

- (IBAction)submitButtonAction:(UIButton *)sender
{
    [self.setIdTextField resignFirstResponder];
    
    if (self.setIdTextField.text.length > 0) {
		
		__weak QZUsersViewController *weakSelf = self;
		
        [self.waitSpinner showInView:self.view];
        
        switch (self.exampleId) {
            case QZExamplesMarkSetAsFavorite:
            {
                [[Quizlet sharedQuizlet] markUserSetAsFavoriteBySetId:self.setIdTextField.text success:^(id responseObject) {
                    weakSelf.logTextView.text = [NSString stringWithFormat:@"%@", responseObject];
                    [weakSelf.waitSpinner hide];
                } failure:^(NSError *error) {
                    weakSelf.logTextView.text = [error description];
                    [weakSelf.waitSpinner hide];
                }];
            }
            break;
            
            case QZExamplesUnmarkSetAsFavorite:
            {
                [[Quizlet sharedQuizlet] unmarkUserSetAsFavoriteBySetId:self.setIdTextField.text success:^(id responseObject) {
                    weakSelf.logTextView.text = [NSString stringWithFormat:@"%@", responseObject];
                    [weakSelf.waitSpinner hide];
                } failure:^(NSError *error) {
                    weakSelf.logTextView.text = [error description];
                    [weakSelf.waitSpinner hide];
                }];
            }
            break;
            
            default:
                break;
        }
        
        self.setIdTextField.hidden = YES;
        self.submitButton.hidden = YES;
    }
}

@end

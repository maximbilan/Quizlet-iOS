//
//  QZClassesViewController.m
//  ios_quizlet_client
//
//  Created by Maxim Bilan on 8/22/14.
//  Copyright (c) 2014 Maxim Bilan. All rights reserved.
//

#import "QZClassesViewController.h"
#import "QZExamplesViewController.h"

#import "Quizlet.h"

@interface QZClassesViewController ()

@property (weak, nonatomic) IBOutlet UITextView *logTextView;
@property (weak, nonatomic) IBOutlet UITextField *setIdTextField;
@property (weak, nonatomic) IBOutlet UIButton *submitButton;

@end

@implementation QZClassesViewController

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

//QZExamplesAddSetToClass,
//QZExamplesRemoveSetFromClass,
//QZExamplesJoinClass,
//QZExamplesLeaveClass,

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    self.logTextView.text = @"";
    
    switch (self.exampleId) {
        case QZExamplesViewClass:
        case QZExamplesViewClassSets:
        {
            self.setIdTextField.hidden = NO;
            self.submitButton.hidden = NO;
        }
        break;
            
        case QZExamplesAddClass:
        {
            NSDictionary *dictionary = @{
                                         @"name": @"Class 1",
                                         @"description" : @"Class 1"
                                        };
            [[Quizlet sharedQuizlet] addClass:dictionary success:^(id responseObject) {
                self.logTextView.text = [NSString stringWithFormat:@"%@", responseObject];
            } failure:^(NSError *error) {
                self.logTextView.text = [error description];
            }];
        }
        break;
            
        case QZExamplesEditClass:
        {
            NSDictionary *dictionary = @{
                                         @"name": @"Class 2",
                                         @"description" : @"Class 2"
                                         };
            [[Quizlet sharedQuizlet] editClass:dictionary byClassId:@"1080268" success:^(id responseObject) {
                self.logTextView.text = [NSString stringWithFormat:@"%@", responseObject];
            } failure:^(NSError *error) {
                self.logTextView.text = [error description];
            }];
        }
        break;
            
        case QZExamplesDeleteClass:
        {
            [[Quizlet sharedQuizlet] deleteClassById:@"1080268" success:^(id responseObject) {
                self.logTextView.text = [NSString stringWithFormat:@"%@", responseObject];
            } failure:^(NSError *error) {
                self.logTextView.text = [error description];
            }];
        }
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

- (IBAction)submitButtonAction:(UIButton *)sender
{
    [self.setIdTextField resignFirstResponder];
    
    if (self.setIdTextField.text.length > 0) {
        switch (self.exampleId) {
            case QZExamplesViewClass:
            {
                [[Quizlet sharedQuizlet] viewClassById:self.setIdTextField.text success:^(id responseObject) {
                    self.logTextView.text = [NSString stringWithFormat:@"%@", responseObject];
                } failure:^(NSError *error) {
                    self.logTextView.text = [error description];
                }];
            }
            break;
                
            case QZExamplesViewClassSets:
            {
                [[Quizlet sharedQuizlet] viewClassSetsById:self.setIdTextField.text success:^(id responseObject) {
                    self.logTextView.text = [NSString stringWithFormat:@"%@", responseObject];
                } failure:^(NSError *error) {
                    self.logTextView.text = [error description];
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

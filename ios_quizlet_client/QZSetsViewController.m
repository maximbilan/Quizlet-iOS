//
//  QZSetsViewController.m
//  ios_quizlet_client
//
//  Created by Maxim Bilan on 8/21/14.
//  Copyright (c) 2014 Maxim Bilan. All rights reserved.
//

#import "QZSetsViewController.h"
#import "QZExamplesViewController.h"

#import "Quizlet.h"

@interface QZSetsViewController ()

@property (weak, nonatomic) IBOutlet UITextView *logTextView;
@property (weak, nonatomic) IBOutlet UITextField *setIdTextField;
@property (weak, nonatomic) IBOutlet UIButton *submitButton;

@end

@implementation QZSetsViewController

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

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    self.logTextView.text = @"";
    
    switch (self.exampleId) {
        case QZExamplesViewSet:
        {
//            [[Quizlet sharedQuizlet] viewSetById:@"" success:^(id responseObject) {
//                self.logTextView.text = [NSString stringWithFormat:@"%@", responseObject];
//            } failure:^(NSError *error) {
//                self.logTextView.text = [error description];
//            }];
        }
        break;
        case QZExamplesViewSetTerms:
        case QZExamplesSubmitSetPassword:
        case QZExamplesViewSets:
        {
            [[Quizlet sharedQuizlet] viewSets:^(id responseObject) {
                self.logTextView.text = [NSString stringWithFormat:@"%@", responseObject];
            } failure:^(NSError *error) {
                self.logTextView.text = [error description];
            }];
        }
        break;
        case QZExamplesAddSet:
        case QZExamplesEditSet:
        case QZExamplesDeleteSet:
        case QZExamplesAddTermToSet:
        case QZExamplesEditTermFromSet:
        case QZExamplesDeleteTermFromSet:
        {
        
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
    
}

@end

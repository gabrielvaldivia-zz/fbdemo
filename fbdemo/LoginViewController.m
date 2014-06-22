//
//  LoginViewController.m
//  fbdemo
//
//  Created by Gabriel Valdivia on 6/21/14.
//  Copyright (c) 2014 Gabriel Valdivia. All rights reserved.
//

#import "LoginViewController.h"
#import "FeedViewController.h"

@interface LoginViewController ()
@property (weak, nonatomic) IBOutlet UIView *loginContainerView;
@property (weak, nonatomic) IBOutlet UITextField *emailTextfield;
@property (weak, nonatomic) IBOutlet UITextField *passwordTextfield;
@property (weak, nonatomic) IBOutlet UILabel *signUpLabel;
@property (nonatomic, assign) BOOL isKeyboardShown;

- (IBAction)onEmailTextfield:(id)sender;
- (IBAction)onPasswordTextfield:(id)sender;
- (IBAction)onOutsideTextfield:(id)sender;
- (IBAction)onLogInButton:(id)sender;

@end

#define TEXTFIELD_OFFSET 100
#define SIGNUP_OFFSET 190

@implementation LoginViewController

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
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
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)onEmailTextfield:(id)sender {
    
    if (self.isKeyboardShown == YES) {
        
        [UIView animateWithDuration:.3 animations:^{
            self.loginContainerView.frame = CGRectMake(self.loginContainerView.frame.origin.x, self.loginContainerView.frame.origin.y - TEXTFIELD_OFFSET, self.loginContainerView.frame.size.width, self.loginContainerView.frame.size.height);
            
            self.signUpLabel.frame = CGRectMake(self.signUpLabel.frame.origin.x, self.signUpLabel.frame.origin.y - SIGNUP_OFFSET, self.signUpLabel.frame.size.width, self.signUpLabel.frame.size.height);
        }];
    }
    
}

- (IBAction)onPasswordTextfield:(id)sender {
    NSLog(@"tapped on password");
    
    if (self.isKeyboardShown == YES) {
        
        [UIView animateWithDuration:.3 animations:^{
            self.loginContainerView.frame = CGRectMake(self.loginContainerView.frame.origin.x, self.loginContainerView.frame.origin.y - TEXTFIELD_OFFSET, self.loginContainerView.frame.size.width, self.loginContainerView.frame.size.height);
            
            self.signUpLabel.frame = CGRectMake(self.signUpLabel.frame.origin.x, self.signUpLabel.frame.origin.y - SIGNUP_OFFSET, self.signUpLabel.frame.size.width, self.signUpLabel.frame.size.height);
        }];
    }
}

- (IBAction)onOutsideTextfield:(id)sender {
    [UIView animateWithDuration:.3 animations:^{
        self.loginContainerView.frame = CGRectMake(self.loginContainerView.frame.origin.x, self.loginContainerView.frame.origin.y + TEXTFIELD_OFFSET, self.loginContainerView.frame.size.width, self.loginContainerView.frame.size.height);
         self.signUpLabel.frame = CGRectMake(self.signUpLabel.frame.origin.x, self.signUpLabel.frame.origin.y + SIGNUP_OFFSET, self.signUpLabel.frame.size.width, self.signUpLabel.frame.size.height);
    }];
    
    [self.view endEditing:YES];
    
}

- (IBAction)onLogInButton:(id)sender {
    
    if ([self.emailTextfield.text isEqual:@"user"]) {
        NSLog(@"typed user");
    }
    
    else {
        [UIView animateWithDuration:.3 animations:^{
            self.loginContainerView.frame = CGRectMake(self.loginContainerView.frame.origin.x, self.loginContainerView.frame.origin.y + TEXTFIELD_OFFSET, self.loginContainerView.frame.size.width, self.loginContainerView.frame.size.height);
            self.signUpLabel.frame = CGRectMake(self.signUpLabel.frame.origin.x, self.signUpLabel.frame.origin.y + SIGNUP_OFFSET, self.signUpLabel.frame.size.width, self.signUpLabel.frame.size.height);
        }];
        [self.view endEditing:YES];
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Incorrect Email" message:@"The email you entered doesn't appear to belong to an account. Please check your email address and try again." delegate:self cancelButtonTitle:nil otherButtonTitles:@"OK", nil];
        [alertView show];
    }
    
    
}
@end

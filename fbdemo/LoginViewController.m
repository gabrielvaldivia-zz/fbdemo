//
//  LoginViewController.m
//  fbdemo
//
//  Created by Gabriel Valdivia on 6/21/14.
//  Copyright (c) 2014 Gabriel Valdivia. All rights reserved.
//

#import "LoginViewController.h"
#import "FeedViewController.h"
#import "MessagesViewController.h"
#import "RequestsViewController.h"
#import "NotificationsViewController.h"
#import "MoreViewController.h"

@interface LoginViewController ()
@property (weak, nonatomic) IBOutlet UIView *loginContainerView;
@property (weak, nonatomic) IBOutlet UITextField *emailTextfield;
@property (weak, nonatomic) IBOutlet UITextField *passwordTextfield;
@property (weak, nonatomic) IBOutlet UILabel *signUpLabel;
@property (nonatomic, assign) BOOL isKeyboardShown;
@property (weak, nonatomic) IBOutlet UIButton *loginButton;

- (IBAction)onEmailTextfield:(id)sender;
- (IBAction)onPasswordTextfield:(id)sender;
- (IBAction)onOutsideTextfield:(id)sender;
- (IBAction)onLogInButton:(id)sender;
- (IBAction)editEmailTextfield:(id)sender;

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
    
    self.isKeyboardShown = NO;
    self.loginButton.enabled = NO;
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)onEmailTextfield:(id)sender {
    
    if (self.isKeyboardShown == NO) {
        
        [UIView animateWithDuration:.3 animations:^{
            self.loginContainerView.frame = CGRectMake(self.loginContainerView.frame.origin.x, self.loginContainerView.frame.origin.y - TEXTFIELD_OFFSET, self.loginContainerView.frame.size.width, self.loginContainerView.frame.size.height);
            
            self.signUpLabel.frame = CGRectMake(self.signUpLabel.frame.origin.x, self.signUpLabel.frame.origin.y - SIGNUP_OFFSET, self.signUpLabel.frame.size.width, self.signUpLabel.frame.size.height);
            
            self.isKeyboardShown = YES;
        }];
        
        
    }
    
}

- (void)loadFeedView {
    // Call this method after the user types the right username/password
    UITabBarController *tabBarController = [[UITabBarController alloc] init];
    
    // create your various view controllers
    FeedViewController *firstViewController = [[FeedViewController alloc] init];
    RequestsViewController *secondViewController = [[RequestsViewController alloc] init];
    MessagesViewController *thirdViewController = [[MessagesViewController alloc] init];
    NotificationsViewController *fourthViewController = [[NotificationsViewController alloc] init];
    MoreViewController *fifthViewController = [[MoreViewController alloc] init];
    
    tabBarController.viewControllers = @[firstViewController, secondViewController, thirdViewController, fourthViewController, fifthViewController];
    
    [self presentViewController:tabBarController animated:YES completion:nil];
    
    // Configure the titles and images of the tab bar items
    firstViewController.tabBarItem.title = @"News Feed";
    firstViewController.tabBarItem.image = [UIImage imageNamed:@"newsfeed"];
    
    secondViewController.tabBarItem.title = @"Requests";
    secondViewController.tabBarItem.image = [UIImage imageNamed:@"requests"];
    
    thirdViewController.tabBarItem.title = @"Messages";
    thirdViewController.tabBarItem.image = [UIImage imageNamed:@"messages"];
    
    fourthViewController.tabBarItem.title = @"Notifications";
    fourthViewController.tabBarItem.image = [UIImage imageNamed:@"notifications"];
    
    fifthViewController.tabBarItem.title = @"More";
    fifthViewController.tabBarItem.image = [UIImage imageNamed:@"more"];
}

- (IBAction)onPasswordTextfield:(id)sender {
    NSLog(@"tapped on password");
    
    if (self.isKeyboardShown == NO) {
        
        [UIView animateWithDuration:.3 animations:^{
            self.loginContainerView.frame = CGRectMake(self.loginContainerView.frame.origin.x, self.loginContainerView.frame.origin.y - TEXTFIELD_OFFSET, self.loginContainerView.frame.size.width, self.loginContainerView.frame.size.height);
            
            self.signUpLabel.frame = CGRectMake(self.signUpLabel.frame.origin.x, self.signUpLabel.frame.origin.y - SIGNUP_OFFSET, self.signUpLabel.frame.size.width, self.signUpLabel.frame.size.height);
            
            self.isKeyboardShown = YES;
        }];
        
        
    }
}

- (IBAction)onOutsideTextfield:(id)sender {
    
    if (self.isKeyboardShown == YES) {
        [UIView animateWithDuration:.3 animations:^{
            self.loginContainerView.frame = CGRectMake(self.loginContainerView.frame.origin.x, self.loginContainerView.frame.origin.y + TEXTFIELD_OFFSET, self.loginContainerView.frame.size.width, self.loginContainerView.frame.size.height);
            self.signUpLabel.frame = CGRectMake(self.signUpLabel.frame.origin.x, self.signUpLabel.frame.origin.y + SIGNUP_OFFSET, self.signUpLabel.frame.size.width, self.signUpLabel.frame.size.height);
            self.isKeyboardShown = NO;
            [self.view endEditing: YES];
        }];
}
    
    
}

- (IBAction)onLogInButton:(id)sender {
    
    if ([self.emailTextfield.text isEqual:@"user"] && [self.passwordTextfield.text isEqual:@"password"]) {
        
        self.loginButton.selected = YES;
        
        [self performSelector:@selector(loadFeedView) withObject:nil afterDelay:2];
    }
    
    else if (self.isKeyboardShown == YES) {
        [UIView animateWithDuration:.3 animations:^{
            self.loginContainerView.frame = CGRectMake(self.loginContainerView.frame.origin.x, self.loginContainerView.frame.origin.y + TEXTFIELD_OFFSET, self.loginContainerView.frame.size.width, self.loginContainerView.frame.size.height);
            self.signUpLabel.frame = CGRectMake(self.signUpLabel.frame.origin.x, self.signUpLabel.frame.origin.y + SIGNUP_OFFSET, self.signUpLabel.frame.size.width, self.signUpLabel.frame.size.height);
        }];
        
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Incorrect Email" message:@"The email you entered doesn't appear to belong to an account. Please check your email address and try again." delegate:self cancelButtonTitle:nil otherButtonTitles:@"OK", nil];
        [alertView show];
        
        [self.view endEditing:YES];
        self.isKeyboardShown = NO;
    }
    
    
}

- (IBAction)editEmailTextfield:(id)sender {
    if (![self.emailTextfield.text isEqual:@""] || ![self.passwordTextfield.text isEqual:@""]) {
        self.loginButton.enabled = YES;
    }
    else {
        self.loginButton.enabled = NO;
    }
}



@end

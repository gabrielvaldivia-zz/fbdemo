//
//  MoreViewController.m
//  fbdemo
//
//  Created by Gabriel Valdivia on 6/21/14.
//  Copyright (c) 2014 Gabriel Valdivia. All rights reserved.
//

#import "MoreViewController.h"
#import "LoginViewController.h"

@interface MoreViewController ()
@property (weak, nonatomic) IBOutlet UIScrollView *bookmarksScrollView;
- (IBAction)onLogOut:(id)sender;

@end

@implementation MoreViewController

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
    self.bookmarksScrollView.contentSize = CGSizeMake(320, 1800);
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

- (IBAction)onLogOut:(id)sender {
    UIActionSheet *actionSheet = [[UIActionSheet alloc] initWithTitle:@"Are you sure you want to log out?" delegate:self cancelButtonTitle:@"Cancel" destructiveButtonTitle:@"Log Out" otherButtonTitles:nil, nil];
    [actionSheet showInView:self.view];
    
}

- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex {
    if (buttonIndex == 0) {
        NSLog(@"tapped Log Out");
        UIViewController *vc = [[LoginViewController alloc] init];
        vc.modalTransitionStyle = UIModalTransitionStyleCoverVertical;
        
        [self presentViewController:vc animated:YES completion:nil];
    }
}

@end

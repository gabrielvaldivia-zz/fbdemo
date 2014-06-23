//
//  FeedViewController.m
//  fbdemo
//
//  Created by Gabriel Valdivia on 6/21/14.
//  Copyright (c) 2014 Gabriel Valdivia. All rights reserved.
//

#import "FeedViewController.h"

@interface FeedViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *fbStory;

@end

@implementation FeedViewController

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
    self.fbStory.alpha = 0;
    [self performSelector:@selector(loadFbStory) withObject:nil afterDelay:2];
    
}

-(void)loadFbStory {
    [UIView animateWithDuration:.3 animations:^{
        self.fbStory.alpha = 1;
    }];
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

//
//  MainViewController.m
//  Pattern King
//
//  Created by Trevor Stevenson on 8/11/14.
//  Copyright (c) 2014 ncunited. All rights reserved.
//

#import "MainViewController.h"

@interface MainViewController ()

@end

@implementation MainViewController

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
    
    self.navigationController.navigationBarHidden = YES;
    
    if ([[[NSUserDefaults standardUserDefaults] objectForKey:@"1"] boolValue] == YES || ![[NSUserDefaults standardUserDefaults] objectForKey:@"1"])
    {
        [[NSUserDefaults standardUserDefaults] setObject:@NO forKey:@"1"];
    }
}

@end

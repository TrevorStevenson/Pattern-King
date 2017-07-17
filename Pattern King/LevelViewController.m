//
//  LevelViewController.m
//  Pattern King
//
//  Created by Trevor Stevenson on 8/11/14.
//  Copyright (c) 2014 ncunited. All rights reserved.
//

#import "LevelViewController.h"

@interface LevelViewController ()
{
    //create instance variables to hold level data from file
    NSString *path;
    NSMutableArray *root;
    NSMutableArray *levelArray;
    NSMutableArray *nextLevelArray;
    NSMutableArray *constraints;
}

@end

@implementation LevelViewController

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
    
    //retrieve level data from plist file for later access
    path = [[NSBundle mainBundle] pathForResource:@"Level" ofType:@"plist"];
    root = [[NSMutableArray alloc] initWithContentsOfFile:path];
    
    //update UI
    [self updateBoxes];
    
    constraints = [[NSMutableArray alloc] initWithObjects: self.spacingConstraint1, self.spacingConstraint2, self.spacingConstraint3, self.spacingConstraint4, self.spacingConstraint5, self.spacingConstraint6, self.spacingConstraint7, self.spacingConstraint8, self.spacingConstraint9, self.spacingConstraint10, self.spacingConstraint11, self.spacingConstraint12, self.spacingConstraint13, self.spacingConstraint14, self.spacingConstraint15, nil];
    
    
    int spacing = (self.view.bounds.size.width - 58 * 5) / 6;
    self.box1.frame = CGRectMake(spacing, self.box1.frame.origin.y, self.box1.frame.size.width, self.box1.frame.size.height);
    self.box2.frame = CGRectMake(2 * spacing + 58, self.box2.frame.origin.y, self.box2.frame.size.width, self.box2.frame.size.height);
    self.box3.frame = CGRectMake(3 * spacing + 2 * 58, self.box3.frame.origin.y, self.box3.frame.size.width, self.box3.frame.size.height);
    self.box4.frame = CGRectMake(4 * spacing + 3 * 58, self.box4.frame.origin.y, self.box4.frame.size.width, self.box4.frame.size.height);
    self.box5.frame = CGRectMake(5 * spacing + 4 * 58, self.box5.frame.origin.y, self.box5.frame.size.width, self.box5.frame.size.height);
}

-(void)viewDidLayoutSubviews
{
    [super viewDidLayoutSubviews];
    
    if (self.view.frame.size.height == 568)
    {
        for (NSLayoutConstraint *constraint in constraints) {
            
            constraint.constant = 12;
            
        }
    }
    else if (self.view.frame.size.height == 667)
    {
        for (NSLayoutConstraint *constraint in constraints) {
            
            constraint.constant = 18;
            
        }
    }
    else if (self.view.frame.size.height == 1104)
    {
        for (NSLayoutConstraint *constraint in constraints) {
            
            constraint.constant = 24;
            
        }
    }
    
}

-(void)updateBoxes
{
    //set label at top of screen to inform user of current level
    self.levelLabel.text = [NSString stringWithFormat:@"Level %@", self.levelName];
    
    //empty user's answer string
    self.answer = @"";
    
    //access level data from plist file
    levelArray = [root objectAtIndex:[self.levelName intValue] - 1];
    
    //fill boxes with text according to array with level data
    self.box1.text = [NSString stringWithFormat:@"%@", [levelArray objectAtIndex:0]];
    self.box2.text = [NSString stringWithFormat:@"%@", [levelArray objectAtIndex:1]];
    self.box3.text = [NSString stringWithFormat:@"%@", [levelArray objectAtIndex:2]];
    self.box4.text = [NSString stringWithFormat:@"%@", [levelArray objectAtIndex:3]];
}

-(void)updateBoxFive
{
    //update UI for mystery box that user can edit
    self.box5.textColor = [UIColor blackColor];
    self.box5.text = self.answer;
}

- (IBAction)quitButton:(UIButton *)sender {
    
    //pop to main menu
    [self.navigationController popToRootViewControllerAnimated:YES];
    
}
- (IBAction)keypadButton:(UIButton *)sender {
    
    //ensure sender is a UIButton
    if ([sender isKindOfClass:[UIButton class]]) {
        
        //assign UIButton class to sender
        sender = (UIButton *)sender;
        
        //cap length of user data entry to 5 characters
        if (self.answer.length < 5) {
            
            //add typed character to mystery box
            self.answer = [NSString stringWithFormat:@"%@%@", self.answer, sender.titleLabel.text];
            
            //update UI
            [self updateBoxFive];
        }
    }
}
- (IBAction)enterButton:(UIButton *)sender {
    
    //check if answer is correct
    if ([self.box5.text isEqualToString:[[levelArray objectAtIndex:4] stringValue]])
    {
        //if last level
        if ([self.levelName intValue] == root.count) {
            
            //create alert congratualting user
            UIAlertController *alert2 = [UIAlertController alertControllerWithTitle:@"Correct" message:@"You have completed the level and the game. Congratulations." preferredStyle:UIAlertControllerStyleAlert];
            
            [alert2 addAction:[UIAlertAction actionWithTitle:@"Main Menu" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                
                [self.navigationController popToRootViewControllerAnimated:YES];

            }]];
            
            [self presentViewController:alert2 animated:YES completion:nil];
        }
        //if not last level
        else
        {
            //creating alert asking user to go to next level or main menu
            UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Correct" message:@"You have completed the level." preferredStyle:UIAlertControllerStyleAlert];
            
            [alert addAction:[UIAlertAction actionWithTitle:@"Next Level" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                
                //increment level by 1
                NSNumber *level = [NSNumber numberWithInt:[self.levelName intValue] + 1];
                
                //update level name with new level
                self.levelName = [level stringValue];
                
                //update the numbers in the boxes with data from new level
                [self updateBoxes];
                
                //reset mystery box to question mark
                self.box5.text = @"?";
                
            }]];
            
            [alert addAction:[UIAlertAction actionWithTitle:@"Main Menu" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                
                //pop to main menu
                [self.navigationController popToRootViewControllerAnimated:YES];

            }]];
            
            [self presentViewController:alert animated:YES completion:nil];
        }
        
        //unlocks next level in user memory
        [[NSUserDefaults standardUserDefaults] setObject:@NO forKey:[NSString stringWithFormat:@"%d", ([self.levelName intValue] + 1)]];
        
        
    }
    //if answer is incorrect
    else
    {
        //reset user answer string
        self.answer = @"";
        
        //display 'X' to user for feedback
        self.box5.text = @"X";
        
        //make text red for feedback
        self.box5.textColor = [UIColor redColor];
    }
}

- (IBAction)delButton:(UIButton *)sender {
    
    //ensure sender is a button to prevent fatal errors
    if ([sender isKindOfClass:[UIButton class]]) {
        
        //asign UIButton class to sender to access button properties
        sender = (UIButton *)sender;
        
        //if there is something in the text box
        if (self.answer.length > 0) {
            
            //remove last character
            self.answer = [self.answer substringToIndex:self.answer.length - 1];
            
            //update UI
            [self updateBoxFive];
        }
    }
}

@end

//
//  LevelViewController.h
//  Pattern King
//
//  Created by Trevor Stevenson on 8/11/14.
//  Copyright (c) 2014 ncunited. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LevelViewController : UIViewController <UIAlertViewDelegate>

//outlet properties
@property (weak, nonatomic) IBOutlet UILabel *box1;
@property (weak, nonatomic) IBOutlet UILabel *box2;
@property (weak, nonatomic) IBOutlet UILabel *box3;
@property (weak, nonatomic) IBOutlet UILabel *box4;
@property (weak, nonatomic) IBOutlet UILabel *box5;
@property (weak, nonatomic) IBOutlet UILabel *levelLabel;

//button actions
- (IBAction)keypadButton:(UIButton *)sender;
- (IBAction)quitButton:(UIButton *)sender;
- (IBAction)enterButton:(UIButton *)sender;
- (IBAction)delButton:(UIButton *)sender;

//level properties
@property (strong, nonatomic) NSString *levelName;
@property (strong, nonatomic) NSString *answer;


//constraint properties
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *spacingConstraint1;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *spacingConstraint2;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *spacingConstraint3;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *spacingConstraint4;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *spacingConstraint5;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *spacingConstraint6;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *spacingConstraint7;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *spacingConstraint8;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *spacingConstraint9;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *spacingConstraint10;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *spacingConstraint11;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *spacingConstraint12;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *spacingConstraint13;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *spacingConstraint14;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *spacingConstraint15;

@end

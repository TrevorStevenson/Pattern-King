//
//  LevelSelectViewController.h
//  Pattern King
//
//  Created by Trevor Stevenson on 8/11/14.
//  Copyright (c) 2014 ncunited. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LevelSelectViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableView;
- (IBAction)backButton:(UIButton *)sender;
@end

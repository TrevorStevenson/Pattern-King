//
//  LevelSelectViewController.m
//  Pattern King
//
//  Created by Trevor Stevenson on 8/11/14.
//  Copyright (c) 2014 ncunited. All rights reserved.
//

#import "LevelSelectViewController.h"
#import "LevelCell.h"
#import "LevelViewController.h"

@interface LevelSelectViewController ()
{
    NSMutableArray *root;
}

@end

@implementation LevelSelectViewController

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

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    NSString *path = [[NSBundle mainBundle] pathForResource:@"Level" ofType:@"plist"];
    
    root = [[NSMutableArray alloc] initWithContentsOfFile:path];
    
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    return root.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    LevelCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
    
    NSNumber *levelNum = [NSNumber numberWithInt:((int)indexPath.row + 1)];
    
    cell.level = [levelNum stringValue];
    
    if ([[[NSUserDefaults standardUserDefaults] objectForKey:cell.level] boolValue] == YES || ![[NSUserDefaults standardUserDefaults] objectForKey:cell.level])
    {
        cell.userInteractionEnabled = NO;
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        [cell.textLabel setText:@"Locked"];

    }
    else if([[[NSUserDefaults standardUserDefaults] objectForKey:[levelNum stringValue]] boolValue] == NO)
    {
        cell.userInteractionEnabled = YES;
        [cell.textLabel setText:[NSString stringWithFormat:@"Level %@", cell.level]];

    }
    
    cell.backgroundColor = [UIColor clearColor];
    
    return cell;

}
    

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(LevelCell *)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    if ([[segue identifier] isEqualToString:@"level"]) {
        
        if ([sender isKindOfClass:[LevelCell class]])
        {
            sender = (LevelCell *)sender;
            
            LevelViewController *LVC = [segue destinationViewController];
            
            NSLog(@"%@", sender.level);
            
            LVC.levelName = sender.level;
            
        }
        
        
        
    }
    
}


- (IBAction)backButton:(UIButton *)sender {
    
    [self.navigationController popToRootViewControllerAnimated:YES];
}

@end

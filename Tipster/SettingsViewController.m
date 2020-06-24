//
//  SettingsViewController.m
//  Tipster
//
//  Created by Benjamin Charles Hora on 6/23/20.
//  Copyright © 2020 Ben Hora. All rights reserved.
//

#import "SettingsViewController.h"

@interface SettingsViewController ()
@property (weak, nonatomic) IBOutlet UISegmentedControl *changeTipControl;

@end

@implementation SettingsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    double defaultTip = [defaults doubleForKey:@"default_tip_percentage"];
    [self.changeTipControl setSelectedSegmentIndex:defaultTip];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
- (IBAction)changeTip:(id)sender {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setDouble:_changeTipControl.selectedSegmentIndex forKey:@"default_tip_percentage"];
    [defaults synchronize];
}

@end

//
//  ViewController.m
//  Tipster
//
//  Created by Benjamin Charles Hora on 6/23/20.
//  Copyright © 2020 Ben Hora. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *billField;
@property (weak, nonatomic) IBOutlet UILabel *tipLabel;
@property (weak, nonatomic) IBOutlet UILabel *totalLabel;
@property (weak, nonatomic) IBOutlet UISegmentedControl *tipControl;
- (void) updateTip;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    double defaultTip = [defaults doubleForKey:@"default_tip_percentage"];
    [self.tipControl setSelectedSegmentIndex:defaultTip];
    // Do any additional setup after loading the view.
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];

    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    double defaultTip = [defaults doubleForKey:@"default_tip_percentage"];
    [self.tipControl setSelectedSegmentIndex:defaultTip];
    [self updateTip];
}

- (IBAction)onTap:(id)sender {
    [self.view endEditing:YES];
}

- (IBAction)onEdit:(id)sender {
    
    [self updateTip];
    
}

- (IBAction)onEditingBegin:(id)sender {
    
    [UIView animateWithDuration:0.2 animations:^{
    self.billField.frame = CGRectMake(self.billField.frame.origin.x, self.billField.frame.origin.y + 30, self.billField.frame.size.width, self.billField.frame.size.height);
    }];
    
}

- (IBAction)onEditingEnd:(id)sender {
    
    CGRect newFrame = self.billField.frame;
    newFrame.origin.y -= 30;
    [UIView animateWithDuration:0.2 animations:^{
        self.billField.frame = newFrame;
    }];
    
}

- (void) updateTip {
    NSArray *percentages = @[@(0.15), @(0.2), @(.22)];
    
    double tipPercentage = [percentages[self.tipControl.selectedSegmentIndex] doubleValue];
    
    double bill = [self.billField.text doubleValue];
    double tip = tipPercentage * bill;
    double total = bill + tip;
    
    self.tipLabel.text = [NSString stringWithFormat:@"$%.2f", tip];
    self.totalLabel.text = [NSString stringWithFormat:@"$%.2f", total];
}

@end

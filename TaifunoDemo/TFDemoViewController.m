//
//  TFDemoViewController.m
//  TaifunoDemo
//
//  Created by Artem Olkov on 13/10/14.
//  Copyright (c) 2014 taifuno. All rights reserved.
//

#import "TFDemoViewController.h"
#import "TFTaifuno.h"

@interface TFDemoViewController ()

@property (weak, nonatomic) IBOutlet UIButton *runTaifunoButton;

@end

@implementation TFDemoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)runTaifunoButtonPressed:(id)sender {
    [[TFTaifuno sharedInstance] startChatOnViewController:self];
}

@end

//
//  GLViewController.m
//  GLPlayer
//
//  Created by guolei on 04/09/2019.
//  Copyright (c) 2019 guolei. All rights reserved.
//

#import "GLViewController.h"
#import "GLPlayer.h"
@interface GLViewController ()

@end

@implementation GLViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    [[GLPlayer shareInstance] playWithURL:[NSURL URLWithString:@""]];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

//
//  DetailFeedViewController.m
//  Prestapp
//
//  Created by Abner Castro Aguilar on 11/04/15.
//  Copyright (c) 2015 Abner Castro Aguilar. All rights reserved.
//

#import "DetailFeedViewController.h"
#import "LendViewController.h"

@interface DetailFeedViewController ()

@end

@implementation DetailFeedViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    UIBarButtonItem *lendButton = [[UIBarButtonItem alloc] initWithTitle:@"Prestar" style:UIBarButtonItemStyleDone target:self action:@selector(prestar)];
    self.navigationItem.rightBarButtonItem = lendButton;
}

- (void)prestar
{
    LendViewController *lendView = [[self storyboard] instantiateViewControllerWithIdentifier:@"lendView"];
    UINavigationController *nv = [[UINavigationController alloc] initWithRootViewController:lendView];
    [self presentViewController:nv animated:YES completion:nil];
}


@end

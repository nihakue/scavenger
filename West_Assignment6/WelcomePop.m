//
//  WelcomePop.m
//  West_Assignment6
//
//  Created by Gabriel West on 2/21/13.
//  Copyright (c) 2013 Gabriel West. All rights reserved.
//

#import "WelcomePop.h"

@interface WelcomePop ()

@end

@implementation WelcomePop

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {

    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

-(IBAction)gotIt:(id)sender{
    [self dismissViewControllerAnimated:YES completion:NULL];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

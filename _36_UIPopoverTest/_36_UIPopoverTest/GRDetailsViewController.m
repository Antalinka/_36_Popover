//
//  GRDetailsViewController.m
//  _36_UIPopoverTest
//
//  Created by Exo-terminal on 7/6/14.
//  Copyright (c) 2014 Evgenia. All rights reserved.
//

#import "GRDetailsViewController.h"

@interface GRDetailsViewController ()

@end

@implementation GRDetailsViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}


-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:YES];
    
    if (self.bgColor) {
        self.view.backgroundColor = self.bgColor;
    }
    
    
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    if (self.bgColor) {
        self.view.backgroundColor = self.bgColor;
    }

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

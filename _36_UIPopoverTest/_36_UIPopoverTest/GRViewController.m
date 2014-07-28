//
//  GRViewController.m
//  _36_UIPopoverTest
//
//  Created by Exo-terminal on 7/6/14.
//  Copyright (c) 2014 Evgenia. All rights reserved.
//

#import "GRViewController.h"
#import "GRDetailsViewController.h"

@interface GRViewController () <UIPopoverControllerDelegate>

@property(strong, nonatomic)UIPopoverController* popover;

@end

@implementation GRViewController

- (void)viewDidLoad
{ 
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void)showControllerAsModal:(UIViewController*)vc{
    
    
    UINavigationController* nav = [[UINavigationController alloc]initWithRootViewController:vc];
    
//    nav.modalTransitionStyle = 

    [self presentViewController:nav
                       animated:YES
                     completion:^{
                         dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                             [self dismissViewControllerAnimated:YES completion:nil];
                         });
                     }];
}

-(void)showController:(UIViewController*) vc inPopoverFromSender:(id)sender{
    
    if (!sender) {
        return;
    }
    
    vc.preferredContentSize = CGSizeMake(300, 300);
    
    UINavigationController* nav = [[UINavigationController alloc]initWithRootViewController:vc];
    
    UIPopoverController* popover = [[UIPopoverController alloc]initWithContentViewController:nav];

    
    popover.delegate = self;
    
    //        popover.popoverContentSize =
    
    self.popover = popover;
    
    if ([sender isKindOfClass:[UIBarButtonItem class]]) {
        
        
        [popover presentPopoverFromBarButtonItem:sender
                        permittedArrowDirections:UIPopoverArrowDirectionAny
                                        animated:YES];

        
    }else if([sender isKindOfClass:[UIButton class]]){
        
        [popover presentPopoverFromRect:[(UIButton*)sender frame]
                                 inView:self.view
               permittedArrowDirections:UIPopoverArrowDirectionLeft | UIPopoverArrowDirectionRight
                               animated:YES];

    }
    
}



#pragma mark - Action

- (IBAction)actionButton:(UIButton *)sender{
    
    GRDetailsViewController* vc = [self.storyboard instantiateViewControllerWithIdentifier:@"GRDetailsViewController"];
    
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad) {
        
        [self showController:vc inPopoverFromSender:sender];
        
    }else{
        
        [self showControllerAsModal:vc];
        
    }

    
}

- (IBAction)actionAdd:(UIBarButtonItem *)sender{
    
    GRDetailsViewController* vc = [self.storyboard instantiateViewControllerWithIdentifier:@"GRDetailsViewController"];
    
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad) {
        
        [self showController:vc inPopoverFromSender:sender];
        
    }else{
        
        [self showControllerAsModal:vc];
        
    }
    
}

#pragma mark - UIPopoverControllerDelegate

- (void)popoverControllerDidDismissPopover:(UIPopoverController *)popoverController{
    
    self.popover = nil;
}


#pragma mark - Segue

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    
    NSLog(@"prepareForSegue %@  %@", segue.identifier, NSStringFromClass([segue.destinationViewController class]));
    
    UINavigationController* nav = segue.destinationViewController;
    GRDetailsViewController* vc = [nav.viewControllers firstObject];
    
    vc.bgColor = [UIColor blueColor];
    
}

@end

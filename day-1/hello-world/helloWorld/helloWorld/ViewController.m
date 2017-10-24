//
//  ViewController.m
//  helloWorld
//
//  Created by Nguyen Hoai on 10/24/17.
//  Copyright © 2017 Nguyen-Hoai. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)sayHello:(id)sender {
    UIAlertView * alertView = [[UIAlertView alloc] initWithTitle:@"Hello World" message:@"Hello from iOS" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil];
    [alertView show];
}
@end

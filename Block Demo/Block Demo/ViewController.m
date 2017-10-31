//
//  ViewController.m
//  Block Demo
//
//  Created by DXC-Technology on 10/31/17.
//  Copyright © 2017 lukasnguyen. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    void (^simpleBlock)(int);
    
    simpleBlock = ^ (int num1) {
        NSString *myString = [NSString stringWithFormat:@"This is %d", num1];
        NSLog(@"%@", myString);
    };
    
    simpleBlock(10);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

//
//  ViewController.m
//  Assignment-2
//
//  Created by Nguyen Hoai on 10/25/17.
//  Copyright © 2017 Nguyen-Hoai. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self doSomethingWithTheJson];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)doSomethingWithTheJson
{
    NSDictionary *dict = [self JSONFromFile];
    NSArray *data = [dict objectForKey:@"colors"];

    
    NSLog(@"data: %@", data);
    
//
//    for (NSDictionary *colour in colours) {
//        NSString *name = [colour objectForKey:@"name"];
//        NSLog(@"Colour name: %@", name);
//
//        if ([name isEqualToString:@"green"]) {
//            NSArray *pictures = [colour objectForKey:@"pictures"];
//            for (NSDictionary *picture in pictures) {
//                NSString *pictureName = [picture objectForKey:@"name"];
//                NSLog(@"Picture name: %@", pictureName);
//            }
//        }
//    }
}

- (NSDictionary *)JSONFromFile
{
    NSString *path = [[NSBundle mainBundle] pathForResource:@"data" ofType:@"json"];
    NSData *data = [NSData dataWithContentsOfFile:path];
    return [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:nil];
}


@end

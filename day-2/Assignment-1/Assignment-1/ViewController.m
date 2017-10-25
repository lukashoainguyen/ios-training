//
//  ViewController.m
//  Assignment-1
//
//  Created by DXC-Technology on 10/25/17.
//  Copyright © 2017 lukasnguyen. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UITableViewDataSource,UITableViewDelegate> {
    NSMutableArray *imageNameArray;
}

@property (weak, nonatomic) IBOutlet UITableView *table;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self arraySetUp];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)arraySetUp {
    imageNameArray = [NSMutableArray arrayWithArray:@[@"image-1", @"image-2", @"image-3"]];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return imageNameArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellId = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    
    return cell;
}


@end

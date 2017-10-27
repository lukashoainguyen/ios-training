//
//  ViewController.m
//  Assignment-2
//
//  Created by Nguyen Hoai on 10/25/17.
//  Copyright © 2017 Nguyen-Hoai. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UITableViewDataSource, UITableViewDelegate> {
    NSArray *myData;
}

@property (weak, nonatomic) IBOutlet UITableView *myTable;

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
    myData = [self JSONFromFile];
    
    for (NSDictionary *singleData in myData) {
        NSString *address = [singleData objectForKey:@"address"];
        NSLog(@"Address: %@", address);
    }
}

- (NSArray *)JSONFromFile
{
    NSString *path = [[NSBundle mainBundle] pathForResource:@"data" ofType:@"json"];
    NSData *data = [NSData dataWithContentsOfFile:path];
    return [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:nil];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
	return myData.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellId = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    id keyValue = myData[indexPath.row];
    cell.textLabel.text = keyValue[@"userName"];
    cell.imageView.image = [UIImage imageNamed:keyValue[@"avatar"]];
    
    return cell;
}

@end

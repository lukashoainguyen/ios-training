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
    [self doSomethingWithTheJson];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)arraySetUp {
    imageNameArray = [NSMutableArray arrayWithArray:@[@"1", @"2", @"3"]];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return imageNameArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellId = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    
    cell.imageView.image = [UIImage imageNamed:imageNameArray[indexPath.row]];
    
    return cell;
}

- (void)doSomethingWithTheJson
{
    NSDictionary *dict = [self JSONFromFile];
    
    NSArray *colours = [dict objectForKey:@"colors"];
    
    for (NSDictionary *colour in colours) {
        NSString *name = [colour objectForKey:@"name"];
        NSLog(@"Colour name: %@", name);
        
        if ([name isEqualToString:@"green"]) {
            NSArray *pictures = [colour objectForKey:@"pictures"];
            for (NSDictionary *picture in pictures) {
                NSString *pictureName = [picture objectForKey:@"name"];
                NSLog(@"Picture name: %@", pictureName);
            }
        }
    }
}

- (NSDictionary *)JSONFromFile
{
    NSString *path = [[NSBundle mainBundle] pathForResource:@"colors" ofType:@"json"];
    NSData *data = [NSData dataWithContentsOfFile:path];
    return [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:nil];
}


@end

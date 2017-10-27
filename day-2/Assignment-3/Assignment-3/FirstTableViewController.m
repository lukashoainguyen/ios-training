//
//  FirstTableViewController.m
//  Assignment-3
//
//  Created by DXC-Technology on 10/27/17.
//  Copyright © 2017 lukasnguyen. All rights reserved.
//

#import "FirstTableViewController.h"
#import "ViewController.h"

@interface FirstTableViewController ()

@end

@implementation FirstTableViewController {
    NSArray *myData;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self doSomethingWithTheJson];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return myData.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    MyTableViewCell *mycell = [tableView dequeueReusableCellWithIdentifier:@"mycell"];
    id keyValue = myData[indexPath.row];
    mycell.myLabelOne.text = keyValue[@"userName"];
    mycell.myLabelTwo.text = keyValue[@"address"];
    mycell.myImage.image = [UIImage imageNamed:keyValue[@"avatar"]];
    mycell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    //tableView.rowHeight = 100;
    return mycell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 120;
}

- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    NSIndexPath *path = [self.tableView indexPathForSelectedRow];
    ViewController *data;
    data = [segue destinationViewController];
    id keyValue = myData[path.row];
    data.myUserData = keyValue;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

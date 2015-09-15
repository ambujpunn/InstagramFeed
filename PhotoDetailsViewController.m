//
//  PhotoDetailsViewController.m
//  InstagramFeed
//
//  Created by Ambuj Punn on 9/14/15.
//  Copyright (c) 2015 Ambuj Punn. All rights reserved.
//

#import "PhotoDetailsViewController.h"
#import "UIImageView+AFNetworking.h"
#import "MyDetailsTableViewCell.h"

@interface PhotoDetailsViewController ()

@end

@implementation PhotoDetailsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.rowHeight = 320;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    MyDetailsTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"detailsCell" forIndexPath:indexPath];
    NSURL *url = [NSURL URLWithString: self.selectedPhoto[@"url"]];
    
    [cell.myImageView setImageWithURL: url];
    return cell;
    
    /*MyTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"firstCell" forIndexPath:indexPath];
    
    //NSLog(@"%@",[responseDictionary objectForKey:@"data"]);
    //NSLog(@"response: %@", responseDictionary[@"data"][0][@"images"][@"standard_resolution"][@"url"]);
    
    NSURL *url = [NSURL URLWithString: responseDictionary[@"data"][(int)indexPath.row][@"images"][@"standard_resolution"][@"url"]];
    [cell.myImageView setImageWithURL: url];
    
    //cell.textLabel.text = [NSString stringWithFormat:@"This is row %ld", (long)indexPath.row];
    
    return cell;
     */
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

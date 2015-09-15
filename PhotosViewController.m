//
//  PhotosViewController.m
//  InstagramFeed
//
//  Created by Ambuj Punn on 9/14/15.
//  Copyright (c) 2015 Ambuj Punn. All rights reserved.
//

#import "PhotosViewController.h"
#import "UIImageView+AFNetworking.h"
#import "MyTableViewCell.h"
#import "PhotoDetailsViewController.h"

@interface PhotosViewController ()
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic) NSDictionary *responseDictionary;
@property (nonatomic, strong) UIRefreshControl *refreshControl;
@end

@implementation PhotosViewController
@synthesize responseDictionary;

- (void)viewDidLoad {
    [super viewDidLoad];
    NSURL *url = [NSURL URLWithString:@"https://api.instagram.com/v1/media/popular?client_id=be219ebcba814aea9031c681f38d7074"];
    NSURLRequest *request = [[NSURLRequest alloc] initWithURL:url];
    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
        responseDictionary = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
        
        [self.tableView reloadData];
    }];
    
    self.refreshControl = [[UIRefreshControl alloc] init];
    [self.refreshControl addTarget:self action:@selector(onRefresh) forControlEvents:UIControlEventValueChanged];
    [self.tableView insertSubview:self.refreshControl atIndex:0];
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.rowHeight = 320;
}

- (void)onRefresh {
    NSURL *url = [NSURL URLWithString:@"https://api.instagram.com/v1/media/popular?client_id=be219ebcba814aea9031c681f38d7074"];
    NSURLRequest *request = [[NSURLRequest alloc] initWithURL:url];
    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
         responseDictionary = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
        [self.refreshControl endRefreshing];
        [self.tableView reloadData];
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    
    PhotoDetailsViewController *photoDetailsViewController = [segue destinationViewController];
    NSIndexPath *indexPath = [self.tableView indexPathForCell:sender];
    photoDetailsViewController.selectedPhoto = responseDictionary[@"data"][(int)indexPath.row][@"images"][@"standard_resolution"];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [responseDictionary[@"data"] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    MyTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"firstCell" forIndexPath:indexPath];

    //NSLog(@"%@",[responseDictionary objectForKey:@"data"]);
    //NSLog(@"response: %@", responseDictionary[@"data"][0][@"images"][@"standard_resolution"][@"url"]);
    
    NSURL *url = [NSURL URLWithString: responseDictionary[@"data"][(int)indexPath.row][@"images"][@"standard_resolution"][@"url"]];
    [cell.myImageView setImageWithURL: url];
    
    //cell.textLabel.text = [NSString stringWithFormat:@"This is row %ld", (long)indexPath.row];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

@end

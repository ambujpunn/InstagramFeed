//
//  PhotoDetailsViewController.h
//  InstagramFeed
//
//  Created by Ambuj Punn on 9/14/15.
//  Copyright (c) 2015 Ambuj Punn. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PhotoDetailsViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>
@property (nonatomic) NSDictionary *selectedPhoto;
@property (weak, nonatomic) IBOutlet UITableView *tableView;



@end

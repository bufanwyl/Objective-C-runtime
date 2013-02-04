//
//  MasterViewController.h
//  Objective-C runtime
//
//  Created by Brooklyn on 2/4/13.
//  Copyright (c) 2013 nMotion. All rights reserved.
//

#import <UIKit/UIKit.h>

@class DetailViewController;

@interface MasterViewController : UITableViewController

@property (strong, nonatomic) DetailViewController *detailViewController;

@end

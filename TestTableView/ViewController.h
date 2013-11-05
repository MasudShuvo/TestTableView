//
//  ViewController.h
//  TestTableView
//
//  Created by Shuvo on 11/3/13.
//  Copyright (c) 2013 Masud Shuvo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, retain) UITableView *table;
@end

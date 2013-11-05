//
//  ViewController.m
//  TestTableView
//
//  Created by Shuvo on 11/3/13.
//  Copyright (c) 2013 Masud Shuvo. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic, retain) NSArray *array;
@end

@implementation ViewController
@synthesize table, array;

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.array = [NSArray arrayWithObjects:@"Dhaka", @"Rajshahi", @"Barisal", @"Tangail" , @"Comilla", @"Nator", @"Vola", nil];
    
    self.table = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, 320, 300) style:UITableViewStylePlain];
    self.table.delegate = self;
    self.table.dataSource = self;
    
    [self.view addSubview:self.table];
    
	// Do any additional setup after loading the view, typically from a nib.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.array count];
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:nil];
    
    if(cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
        
        cell.textLabel.text = [self.array objectAtIndex:indexPath.row];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.textLabel.backgroundColor = [UIColor clearColor];
        if(indexPath.row % 2 == 0)
            cell.contentView.backgroundColor = [UIColor grayColor];
        
        UILabel *label = [[[UILabel alloc] initWithFrame:CGRectMake(0, 0, 100, 35)] autorelease];
        label.backgroundColor = [UIColor clearColor];
        label.text = [NSString stringWithFormat:@"row %i",indexPath.row];
        label.textAlignment = NSTextAlignmentCenter;
        
        UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        button.frame = CGRectMake(220, 1, 100, 38);
        button.tag = indexPath.row;
        [button addTarget:self action:@selector(buttonPressed:) forControlEvents:UIControlEventTouchUpInside];
        [button addSubview:label];
        [cell.contentView addSubview:button];
    }
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 40.0;
}

//- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    [tableView cellForRowAtIndexPath:indexPath].contentView.backgroundColor = [UIColor redColor];
//}

- (void)tableView:(UITableView *)tableView didUnhighlightRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(indexPath.row % 2 == 0)
        [tableView cellForRowAtIndexPath:indexPath].contentView.backgroundColor = [UIColor grayColor];
    else
        [tableView cellForRowAtIndexPath:indexPath].contentView.backgroundColor = [UIColor whiteColor];
    
    [tableView cellForRowAtIndexPath:indexPath].textLabel.text = [self.array objectAtIndex:indexPath.row];
}

- (void)tableView:(UITableView *)tableView didHighlightRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView cellForRowAtIndexPath:indexPath].contentView.backgroundColor = [UIColor redColor];
    [tableView cellForRowAtIndexPath:indexPath].textLabel.text = @"Selected";
}

- (void)buttonPressed:(UIButton *)sender
{
    
    UITableViewCell *cell = (UITableViewCell *)sender.superview.superview;
    NSLog(@"%i",[self.table indexPathForCell:cell].row);
    cell.textLabel.text = @"Selected";
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

//
//  HomeViewController.m
//  Poster
//
//  Created by Interns on 3/13/16.
//  Copyright © 2016 com.omg-m. All rights reserved.
//

#import "HomeViewController.h"
#import "PostCellView.h"

@interface HomeViewController ()

@end

@implementation HomeViewController

static NSString *const CELL_HEADER = @"PostCellView";

- (void)viewDidLoad {
    [super viewDidLoad];
    [_tableView registerNib:[UINib nibWithNibName:@"PostCellView" bundle:nil] forCellReuseIdentifier:CELL_HEADER];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [_tableView dequeueReusableCellWithIdentifier:CELL_HEADER];
    
    PostCellView *postCell = (PostCellView *)cell;
    postCell.selectionStyle = UITableViewCellSelectionStyleNone;
    postCell.view.userInteractionEnabled = YES;
    return postCell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
   // [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    }

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    UITableViewCell *cell = [_tableView dequeueReusableCellWithIdentifier:CELL_HEADER];
    return cell.frame.size.height;
    
}


- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    
    return 1;
}



@end

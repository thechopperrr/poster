//
//  ComentsViewController.m
//  Poster
//
//  Created by Interns on 3/16/16.
//  Copyright © 2016 com.omg-m. All rights reserved.
//

#import "ComentsViewController.h"

#define COMENT_LENGHT 50

@interface ComentsViewController ()



@end

@implementation ComentsViewController

static NSString *const CELL_ID = @"ComentCellView";

- (void)viewDidLoad {
    [super viewDidLoad];
     [_tableView registerNib:[UINib nibWithNibName:@"ComentCellView" bundle:nil] forCellReuseIdentifier:CELL_ID];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)maceComent:(id)sender {
    if(_comentTextView.text.length > COMENT_LENGHT){
        //text too long
    } else {
        //make coment
    }
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    return [_post.coments count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return [self  getCellForComent:_post.coments[indexPath.row]];
}

- (ComentCellView*)getCellForComent:(Coment*)coment{
    UITableViewCell *cell = [_tableView dequeueReusableCellWithIdentifier:CELL_ID];
    
    ComentCellView *comentCell = (ComentCellView *)cell;
    comentCell.selectionStyle = UITableViewCellSelectionStyleNone;
    comentCell.coment = coment;
    return comentCell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    UITableViewCell *cell = [_tableView dequeueReusableCellWithIdentifier:CELL_ID];
    return cell.frame.size.height;
    
}


- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    
    return 1;
}



@end

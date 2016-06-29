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
    _requester = [[Requester alloc]init];
    _requester.delegate = self;
    
    _comentTextView.layer.cornerRadius = 5;
    _comentTextView.layer.masksToBounds = YES;
    _comentTextView.layer.borderColor = [UIColor blueColor].CGColor;
    _comentTextView.layer.borderWidth = 2.0f;
    
    self.edgesForExtendedLayout = UIRectEdgeNone;
    
    self.title = NSLocalizedString(@"Coments", nil);
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)makeComent:(id)sender {
    if(_comentTextView.text.length > COMENT_LENGHT || _comentTextView.text.length < 1){
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:NSLocalizedString(@"enter_coment_big_or_small_text", nil)
                                                        message:nil
                                                       delegate:self
                                              cancelButtonTitle:@"OK"
                                              otherButtonTitles:nil];
        [alert show];
        return;
    }
    if( ! [[NSUserDefaults standardUserDefaults] objectForKey:@"userEmail"]){
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:NSLocalizedString(@"pls_login", nil)
                                                        message:nil
                                                       delegate:self
                                              cancelButtonTitle:@"OK"
                                              otherButtonTitles:nil];
        [alert show];
        return;
    }
    

        _tempComent = [[Coment alloc]init];
        _tempComent.userMail = [[NSUserDefaults standardUserDefaults] objectForKey:@"userEmail"];
        _tempComent.comentText = _comentTextView.text;
        _tempComent.postId = _post.postId;
        _tempComent.date = [NSDate date];
        [_requester makeComent:_tempComent];
        _comentTextView.text = @"";

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

- (void)comentMaked:(BOOL)yes{
    if(yes){
        [_post.coments addObject:_tempComent];
        [_tableView reloadData];
    }
    else {
        //todo error
    }
    _tempComent = nil;
}

@end

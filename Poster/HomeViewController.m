//
//  HomeViewController.m
//  Poster
//
//  Created by Interns on 3/13/16.
//  Copyright © 2016 com.omg-m. All rights reserved.
//

#import "HomeViewController.h"
#import "ComentsViewController.h"
#import "CreatePostViewController.h"

@interface HomeViewController ()

@end

@implementation HomeViewController

static NSString *const CELL_HEADER = @"PostCellView";

- (void)viewDidLoad {
    
    _posts = [[NSMutableArray alloc]init];
    [super viewDidLoad];
    [_tableView registerNib:[UINib nibWithNibName:@"PostCellView" bundle:nil] forCellReuseIdentifier:CELL_HEADER];
    
    _requester = [[Requester alloc]init];
    _requester.delegate = self;
    [_requester getNextFive:0];
    _loading = YES;
    
    // Do any additional setup after loading the view.
}

- (void)nextFiveFetched:(NSArray *)posts{
    _loading = NO;
    for(int i =0; i<posts.count; i++){
        [_posts addObject:posts[i]];
    }
    [_tableView reloadData];
}

- (void)viewDidAppear:(BOOL)animated{
    self.navigationItem.hidesBackButton = YES;
    if( [UserInfo isUserLogged]){
        _addPostButton.hidden = NO;
        _logOutButton.hidden = NO;
    }
    else {
        _addPostButton.hidden = YES;
        _logOutButton.hidden = YES;
    }

}

- (void)viewDidDisappear:(BOOL)animated{
    self.navigationItem.hidesBackButton = NO;
}

- (NSArray*)createPosts {
    NSMutableArray* posts = [[NSMutableArray alloc]init];
    
    User* usr1 = [[User alloc]init];
    usr1.email = @"hose@abv.bg";
    usr1.pass = @"123";
    
    Post* post1 = [[Post alloc]init];
    post1.user = usr1;
    post1.postText = @"Az ne sym debel i grozen";
    post1.likes = Nil;
    post1.date = [NSDate date];
    NSMutableArray* coments1 = [[NSMutableArray alloc]init];
    Coment* coment1 = [[Coment alloc]init];
    coment1.userMail = @"karimir@abv.bg";
    coment1.comentText = @"ne lyji kiufte";
    coment1.date = [NSDate date];
    [coments1 addObject:coment1];
    Coment* coment2 = [[Coment alloc]init];
    coment2.userMail = @"konsunela@abv.bg";
    coment2.comentText = @"kiuftetata nqmat brada";
    coment2.date = [NSDate date];
    [coments1 addObject:coment2];
    post1.coments = coments1;
    [posts addObject:post1];
    
    User* usr2 = [[User alloc]init];
    usr2.email = @"konsunela@abv.bg";
    usr2.pass = @"123";
    
    Post* post2 = [[Post alloc]init];
    post2.user = usr2;
    post2.postText = @"koga 6te ima pari we";
    post2.likes = Nil;
    post2.date = [NSDate date];
    NSMutableArray* coments2 = [[NSMutableArray alloc]init];
    Coment* coment3 = [[Coment alloc]init];
    coment3.userMail = @"baubau@abv.bg";
    coment3.comentText = @"ne ste gi zalujili";
    coment3.date = [NSDate date];
    [coments2 addObject:coment3];
    Coment* coment4 = [[Coment alloc]init];
    coment4.userMail = @"okoto@abv.bg";
    coment4.comentText = @"mqu";
    coment4.date = [NSDate date];
    [coments2 addObject:coment4];
    post2.coments = coments2;
    [posts addObject:post2];
    
    
    return posts;
    
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
    
    return _posts.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
        return  [self postCellForPost:_posts[indexPath.row]];
}

- (PostCellView*)postCellForPost:(Post*)post{
    UITableViewCell *cell = [_tableView dequeueReusableCellWithIdentifier:CELL_HEADER];
    
    PostCellView *postCell = (PostCellView *)cell;
    postCell.selectionStyle = UITableViewCellSelectionStyleNone;
    postCell.delegate = self;
    postCell.post = post;
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

// delegates

- (void)openComentsWithPost:(Post *)post{
    UIStoryboard *mainStoryboard = [UIStoryboard storyboardWithName:@"Main" bundle: nil];
    ComentsViewController *controller = (ComentsViewController*)[mainStoryboard instantiateViewControllerWithIdentifier: @"ComentsViewController"];
    controller.post = post;
    [self.navigationController pushViewController:controller animated:YES];
}

- (void)scrollViewDidScroll:(UIScrollView *)aScrollView {
    CGPoint offset = aScrollView.contentOffset;
    CGRect bounds = aScrollView.bounds;
    CGSize size = aScrollView.contentSize;
    UIEdgeInsets inset = aScrollView.contentInset;
    float y = offset.y + bounds.size.height - inset.bottom;
    float h = size.height;
    // NSLog(@"offset: %f", offset.y);
    // NSLog(@"content.height: %f", size.height);
    // NSLog(@"bounds.height: %f", bounds.size.height);
    // NSLog(@"inset.top: %f", inset.top);
    // NSLog(@"inset.bottom: %f", inset.bottom);
    // NSLog(@"pos: %f of %f", y, h);
    
    float reload_distance = 10;
    if(y > h + reload_distance) {
        if( ! _loading){
            _loading = YES;
            NSLog(@"load more rows");
            int i = (int)_posts.count;
            [_requester getNextFive:i];
        }
        
        
    }
}
- (IBAction)addPostButtonPressed:(id)sender {
    
    UIStoryboard *mainStoryboard = [UIStoryboard storyboardWithName:@"Main" bundle: nil];
    CreatePostViewController *controller = (CreatePostViewController*)[mainStoryboard instantiateViewControllerWithIdentifier: @"CreatePostViewController"];
    controller.posts = _posts;
    [self.navigationController pushViewController:controller animated:YES];

}
- (IBAction)logOutButtonPressed:(id)sender {
    [UserInfo logOut];
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)sharePost:(Post*)post{
    
        NSString* wrote = NSLocalizedString(@"wrote", nil);
        NSString* inString = NSLocalizedString(@"in", nil);
        NSString* poster = NSLocalizedString(@"poster", nil);
    NSString *textToShare = [NSString stringWithFormat:@"@%@ %@ %@ %@ %@", post.user.email, wrote, post.postText,inString, poster];
       // NSURL *myWebsite = [NSURL URLWithString:@"http://www.codingexplorer.com/"];
        
        NSArray *objectsToShare = @[textToShare];
        
        UIActivityViewController *activityVC = [[UIActivityViewController alloc] initWithActivityItems:objectsToShare applicationActivities:nil];
        
        NSArray *excludeActivities = @[UIActivityTypeAirDrop,
                                       UIActivityTypePrint,
                                       UIActivityTypeAssignToContact,
                                       UIActivityTypeSaveToCameraRoll,
                                       UIActivityTypeAddToReadingList,
                                       UIActivityTypePostToFlickr,
                                       UIActivityTypePostToVimeo];
        
        activityVC.excludedActivityTypes = excludeActivities;
        
        [self presentViewController:activityVC animated:YES completion:nil];
}

@end

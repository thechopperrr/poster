//
//  ComentCellView.h
//  Poster
//
//  Created by Interns on 3/19/16.
//  Copyright © 2016 com.omg-m. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Coment.h"

@interface ComentCellView : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *userLabel;
@property (weak, nonatomic) IBOutlet UITextView *comentTextView;

@property (weak, nonatomic) IBOutlet UILabel *dateLabel;
@property Coment* coment;

@end

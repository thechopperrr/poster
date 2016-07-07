//
//  ComentCellView.m
//  Poster
//
//  Created by Interns on 3/19/16.
//  Copyright © 2016 com.omg-m. All rights reserved.
//

#import "ComentCellView.h"

@implementation ComentCellView

- (void)awakeFromNib {
    
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    [self.comentTextView setText:_coment.comentText];
    [self.userLabel setText:_coment.userMail];
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy-MMM-dd HH:mm"];
    NSString *stringFromDate = [formatter stringFromDate:_coment.date];
    [self.dateLabel setText:stringFromDate];
    
    self.layer.cornerRadius = 5;
    self.layer.masksToBounds = YES;
    self.layer.borderColor = [UIColor blueColor].CGColor;
    self.layer.borderWidth = 2.0f;

}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end

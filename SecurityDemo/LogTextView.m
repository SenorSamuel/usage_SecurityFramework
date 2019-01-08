//
//  LogTextView.m
//  SecurityDemo
//
//  Created by 1 on 2018/12/11.
//  Copyright © 2018 Samuel. All rights reserved.
//

#import "LogTextView.h"

@implementation LogTextView

-(instancetype)initWithFrame:(CGRect)frame{
    
    if (self = [super initWithFrame:frame]) {
        self.layoutManager.allowsNonContiguousLayout = NO;
    }
    return self;
}

-(instancetype)initWithCoder:(NSCoder *)aDecoder{
    
    if (self = [super initWithCoder:aDecoder]) {
        self.layoutManager.allowsNonContiguousLayout = NO;
    }
    return self;
}

-(void)setText:(NSString *)text{
    
    [super setText:text];
    
    [self scrollRangeToVisible:NSMakeRange(self.text.length, 1)];
}


@end

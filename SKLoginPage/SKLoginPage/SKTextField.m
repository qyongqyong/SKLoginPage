//
//  SKTextField.m
//  SKLoginPage
//
//  Created by nachuan on 16/6/21.
//  Copyright © 2016年 SoKon. All rights reserved.
//

#import "SKTextField.h"

@interface SKTextField ()

/** 左侧图标 */
@property (nonatomic, strong) UIImageView *leftImageView;


@end


@implementation SKTextField

- (instancetype)initWithFrame:(CGRect)frame withLeftViewImageName:(NSString *)imageName
{
    self = [super initWithFrame:frame];
    if (self) {
        _leftImageView = [[UIImageView alloc] init];
        _leftImageView.frame = CGRectMake(0, 0, frame.size.height, frame.size.height);
        _leftImageView.image = [UIImage imageNamed:imageName];
        _leftImageView.contentMode = UIViewContentModeLeft;
        _leftImageView.highlightedImage = [UIImage imageNamed:[NSString stringWithFormat:@"%@_highlighted",imageName]];
        self.leftView = _leftImageView;
        self.clearButtonMode = UITextFieldViewModeWhileEditing;
        self.leftViewMode = UITextFieldViewModeAlways;
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(makeHighlighted:) name:UITextFieldTextDidChangeNotification object:self];
    }
    return self;
}

- (void)makeHighlighted:(NSNotification *)notification
{
    if (self == notification.object) {
        if ([self.text isKindOfClass:[NSNull class]] || self.text == nil || [self.text isEqualToString:@""]) {
            _leftImageView.highlighted = NO;
            self.hasInput = NO;
        }else{
            _leftImageView.highlighted = YES;
            self.hasInput = YES;
        }
    }
}



- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

@end

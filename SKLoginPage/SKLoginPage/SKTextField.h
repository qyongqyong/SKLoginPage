//
//  SKTextField.h
//  SKLoginPage
//
//  Created by nachuan on 16/6/21.
//  Copyright © 2016年 SoKon. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SKTextField : UITextField

/** 是否已经输入内容 */
@property (nonatomic, assign) BOOL hasInput;

- (instancetype)initWithFrame:(CGRect)frame withLeftViewImageName:(NSString *)imageName;

//- (instancetype)initWithLeftViewImageName:(NSString *)imageName right

- (instancetype)init __attribute__((unavailable("init方法不可用,请使用initWithFrame: withLeftViewImageName:")));

- (instancetype)initWithFrame:(CGRect)frame __attribute__((unavailable("init方法不可用,请使用initWithFrame: withLeftViewImageName:")));

@end

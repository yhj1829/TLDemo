//
//  TLBaseMainVC.m
//  TL
//
//  Created by 阳光 on 16/12/6.
//  Copyright © 2016年 阳光. All rights reserved.
//

#import "TLBaseMainVC.h"

@interface TLBaseMainVC ()

@end

@implementation TLBaseMainVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self findHairlineImageViewUnder:self.navigationController.navigationBar];

}

-(UIImageView *)findHairlineImageViewUnder:(UIView*)view
{
    if([view isKindOfClass:[UIImageView class]] && view.bounds.size.height<=1.0) {
        return(UIImageView*)view;
    }
    for(UIView*subview in view.subviews) {
        UIImageView*imageView = [self findHairlineImageViewUnder:subview];
        if(imageView) {
            imageView.hidden = YES ;
            return imageView;
        }
    }
    return nil;
}


@end

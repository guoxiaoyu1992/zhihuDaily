//
//  SYTableHeader.m
//  zhihuDaily
//
//  Created by yang on 16/2/26.
//  Copyright © 2016年 yang. All rights reserved.
//

#import "SYTableHeader.h"
#import "UIView+Extension.h"
#import "UIImageView+WebCache.h"

@interface SYTableHeader ()
@property (strong, nonatomic) IBOutletCollection(UIImageView) NSArray<UIImageView *> *editorsImage;
@property (weak, nonatomic) IBOutlet UIImageView *rightView;
@property (weak, nonatomic) IBOutlet UILabel *title;

@end


@implementation SYTableHeader

- (void)awakeFromNib {
    for (UIImageView *imageView in self.editorsImage) {
        CAShapeLayer *maskLayer = [CAShapeLayer layer];
        maskLayer.frame = imageView.bounds;
        maskLayer.path = [UIBezierPath bezierPathWithOvalInRect:CGRectInset(imageView.bounds, 2, 2)].CGPath;
        imageView.layer.mask = maskLayer;
    }
    
}



- (void)setAvatars:(NSArray<NSString *> *)avatars {
    _avatars = avatars;
    for (NSUInteger i = 0; i < 5; i++) {
        if (i < avatars.count) {
            [self.editorsImage[i] sd_setImageWithURL:[NSURL URLWithString:avatars[i]]];
        } else {
            self.editorsImage[i].image = nil;
        }
  
    }

}

+ (instancetype)headerViewWitTitle:(NSString *)title hidenRight:(BOOL)hiden {
    SYTableHeader *header = [[NSBundle mainBundle] loadNibNamed:@"SYTableHeader" owner:nil options:nil].firstObject;
    header.title.text = title;
    header.rightView.hidden = hiden;
    return header;
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end

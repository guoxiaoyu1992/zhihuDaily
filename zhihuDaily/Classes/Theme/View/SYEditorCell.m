//
//  SYEditorCell.m
//  zhihuDaily
//
//  Created by yang on 16/2/28.
//  Copyright © 2016年 yang. All rights reserved.
//

#import "SYEditorCell.h"
#import "UIImageView+WebCache.h"

@interface SYEditorCell ()
@property (weak, nonatomic) IBOutlet UIImageView *avatarImageView;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *bioLabel;
@property (weak, nonatomic) IBOutlet UIImageView *editorImageView;

@end

@implementation SYEditorCell


- (void)awakeFromNib {
    self.avatarImageView.layer.cornerRadius = 24;
    self.avatarImageView.clipsToBounds = YES;
    self.editorImageView.hidden = YES;
}


- (void)setEditor:(id)obj {
    _editor = obj;
    
    self.nameLabel.text = [obj valueForKey:@"name"];
    self.bioLabel.text = [obj valueForKey:@"bio"];
    [self.avatarImageView sd_setImageWithURL:[NSURL URLWithString:[obj valueForKey:@"avatar"]]];
    self.editorImageView.hidden = [obj isKindOfClass:[SYRecommender class]];
    
}

static NSString *editor_reuseid = @"editor_reuseid";
+ (instancetype)editorCellWithTableView:(UITableView *)tableView {
    
    SYEditorCell *cell = [tableView dequeueReusableCellWithIdentifier:editor_reuseid];
    //[cell.editorImageView removeFromSuperview];
    cell.editorImageView.alpha = 0.0;
    return cell;
}

+ (instancetype)recommenderCellWithTableView:(UITableView *)tableView {
    SYEditorCell *cell = [tableView dequeueReusableCellWithIdentifier:editor_reuseid];
    
    return cell;
}






@end

//
//  JMJSettingCell.h
//  网易彩票
//
//  Created by HUST on 2020/12/29.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface JMJSettingCell : UITableViewCell

@property(nonatomic,strong)NSDictionary *item;
+(instancetype)settingCellWithTableView:(UITableView*)tableView andItem:(NSDictionary *)item;

@end

NS_ASSUME_NONNULL_END

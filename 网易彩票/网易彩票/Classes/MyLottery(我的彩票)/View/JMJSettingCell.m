//
//  JMJSettingCell.m
//  网易彩票
//
//  Created by HUST on 2020/12/29.
//

#import "JMJSettingCell.h"
#import "UIImage+Scale.h"
@implementation JMJSettingCell

+(instancetype)settingCellWithTableView:(UITableView*)tableView andItem:(NSDictionary *)item
{
    //cell重用解决：根据不同的类型填写不同的id，下次复用的时候根据id确定复用的类型
    NSString *cellid = @"setting_cell";
    
    if(item[@"cellType"]&&[item[@"cellType"] length]>0){
        cellid = item[@"cellType"];
    }else{
        cellid = @"setting_cell";
    }
    
    //缓存池找
    JMJSettingCell *cell=[tableView dequeueReusableCellWithIdentifier:cellid];
    if(!cell){
        cell = [[JMJSettingCell alloc]initWithStyle:[self loadCellStyleWithItem:item] reuseIdentifier:cellid];
    }
    
    return cell;
}


-(void)setItem:(NSDictionary *)item{
    _item = item;
    //赋值
    if(item[@"icon"]&&[item[@"icon"] length]>0)
    {
        self.imageView.image = [[UIImage imageNamed:item[@"icon"]] scaleToSize:CGSizeMake(30, 30)];
    }
    
    self.textLabel.text = item[@"title"];
    self.detailTextLabel.text = item[@"subTitle"];
    if([item[@"isRed"] boolValue]&&item[@"isRed"]){
        self.detailTextLabel.textColor = [UIColor redColor];
    }
    
    //根据字符串创建对象
    NSString * accessoryType = item[@"accessoryType"];
    Class Clz= NSClassFromString(accessoryType);
    UIView *obj =[[Clz alloc]init];
    
    if([obj isKindOfClass:[UIImageView class]])
    {
        UIImageView *imageView = (UIImageView*)obj;
        UIImage *image = [UIImage imageNamed:item[@"accessoryContent"]];
        image = [image scaleToSize:CGSizeMake(20, 20)];
        imageView.image=image;
        [imageView sizeToFit];
        
    } else if([obj isKindOfClass:[UISwitch class]])
    {
        UISwitch *switcher = (UISwitch*)obj;
        [switcher addTarget:self action:@selector(switcherChange:) forControlEvents:UIControlEventValueChanged];
        
        NSUserDefaults * ud = [NSUserDefaults standardUserDefaults];
        switcher.on = [ud boolForKey:item[@"switchKey"]];
    }
    self.accessoryView=obj;
    
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}


-(void)switcherChange:(UISwitch *)sender
{
    NSUserDefaults *ud=[NSUserDefaults standardUserDefaults];
    [ud setBool:sender.isOn forKey:self.item[@"switchKey"]];
}

+(UITableViewCellStyle)loadCellStyleWithItem:(NSDictionary *)item
{
    if([item[@"cellType"] isEqualToString:@"UITableViewCellStyleSubtitle"])
    {
        return UITableViewCellStyleSubtitle;
    } else if([item[@"cellType"] isEqualToString:@"UITableViewCellStyleValue1"])
    {
        return UITableViewCellStyleValue1;
    } else if([item[@"cellType"] isEqualToString:@"UITableViewCellStyleValue2"])
    {
        return UITableViewCellStyleValue2;
    } else
    {
        return UITableViewCellStyleDefault;
    }
}

@end

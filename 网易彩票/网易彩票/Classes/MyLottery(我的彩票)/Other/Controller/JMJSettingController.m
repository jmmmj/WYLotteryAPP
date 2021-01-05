//
//  JMJSettingController.m
//  网易彩票
//
//  Created by HUST on 2020/12/29.
//

#import "JMJSettingController.h"
#import "JMJRedeemController.h"
#import "JMJSettingCell.h"
#import "UIImage+Scale.h"
@interface JMJSettingController ()

@property (nonatomic,strong)NSArray *groups;

@end

@implementation JMJSettingController

- (instancetype)init
{
    self = [super initWithStyle:UITableViewStyleGrouped];
    return self;
}



-(NSArray *)groups
{
    if(!_groups)
    {
        NSString *path = [[NSBundle mainBundle]pathForResource:self.plistName ofType:@"plist"];
//        NSString *path = [[NSBundle mainBundle]pathForResource:@"Setting" ofType:@"plist"];
        _groups = [NSArray arrayWithContentsOfFile:path];
    }
    return  _groups;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    UIBarButtonItem *item = [[UIBarButtonItem alloc]initWithImage:[UIImage systemImageNamed:@"arrowshape.turn.up.backward.fill"]  style:UIBarButtonItemStylePlain target:self action:@selector(backClick)];
    self.navigationItem.leftBarButtonItem = item;


}

//点击cell调用
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    NSDictionary *group = self.groups[indexPath.section];
    NSArray *items = group[@"items"];
    NSDictionary* item= items[indexPath.row];
    if(item[@"targetVC"]&&[item[@"targetVC"] length]>0)
    {
        NSString *targetVC =item[@"targetVC"];
        Class Clz = NSClassFromString(targetVC);
        UIViewController *vc = [[Clz alloc]init];
        
        if([vc isKindOfClass:[JMJSettingController class]])
        {
            JMJSettingController *setting = (JMJSettingController*)vc;
            setting.plistName = item[@"plistName"];
        }
        
        vc.navigationItem.title = item[@"title"];
        //跳转
        [self.navigationController pushViewController:vc animated:YES];
    }
    if(item[@"funcName"]&&[item[@"funcName"] length]>0)
    {
        SEL funcName =  NSSelectorFromString(item[@"funcName"]);
        #pragma clang diagnostic push//忽略警告
        #pragma clang diagnostic ignored "-Warc-performSelector-leaks"
        [self performSelector:funcName];
        #pragma clang diagnostic pop
        
    }
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.groups.count;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSDictionary *group = self.groups[section];
    NSArray* items = group[@"items"];
    return items.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //获取当前cell信息
    NSDictionary *group = self.groups[indexPath.section];
    NSArray *items = group[@"items"];
    NSDictionary *item = items[indexPath.row];
    
    //使用封装的cell来创建cell
    JMJSettingCell *cell = [JMJSettingCell settingCellWithTableView:tableView andItem:item];
    
    
    //把数据传给cell
    cell.item = item;
    return cell;
}


-(NSString*)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    NSDictionary * group = self.groups[section];
    return group[@"header"];
}

-(NSString*)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section
{
    NSDictionary * group = self.groups[section];
    return group[@"footer"];
}

-(void)backClick
{
    [self.navigationController popViewControllerAnimated:YES];
}

-(void)checkUpdate
{
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"系统提示" message:@"你已经是最新的版本！" preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault
       handler:^(UIAlertAction * action) {}];

    [alertController addAction:defaultAction];
    [self presentViewController:alertController animated:YES completion:nil];
}

@end

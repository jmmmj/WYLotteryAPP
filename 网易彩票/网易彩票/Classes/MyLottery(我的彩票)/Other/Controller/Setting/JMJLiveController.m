//
//  JMJLiveController.m
//  网易彩票
//
//  Created by HUST on 2020/12/29.
//

#import "JMJLiveController.h"
#import "UIView+Frame.h"
@interface JMJLiveController ()
@property (nonatomic,weak)UIDatePicker *datePicker;

@end

@implementation JMJLiveController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(indexPath.section == 0){
        return;
    }
    UITextField * text = [[UITextField alloc]init];
    UITableViewCell* cell= [tableView cellForRowAtIndexPath:indexPath];
    [cell.contentView addSubview:text];
    
    UIDatePicker *datePicker = [[UIDatePicker alloc]init];
    self.datePicker = datePicker;
    datePicker.locale=[[NSLocale alloc]initWithLocaleIdentifier:@"zh_CN"];
    datePicker.datePickerMode = UIDatePickerModeTime;
    datePicker.preferredDatePickerStyle = UIDatePickerStyleWheels;
    text.inputView = datePicker;
    UIToolbar *bar = [[UIToolbar alloc]init];
    bar.h=44;
    UIBarButtonItem *cancelItem = [[UIBarButtonItem alloc]initWithTitle:@"取消" style:UIBarButtonItemStylePlain target:self action:@selector(cancelClick)];
    UIBarButtonItem *item = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
    UIBarButtonItem *doneItem = [[UIBarButtonItem alloc]initWithTitle:@"完成" style:UIBarButtonItemStylePlain target:self action:@selector(doneClick)];
    bar.items = @[cancelItem,item,doneItem];
    text.inputAccessoryView=bar;
    
    
    [text becomeFirstResponder];
}



-(void)cancelClick
{
    [self.view endEditing:YES];
}

-(void)doneClick
{
    NSDate *date = self.datePicker.date;
    NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
    formatter.dateFormat = @"HH:mm";
    NSString *time = [formatter stringFromDate:date];
    NSIndexPath * path = [self.tableView indexPathForSelectedRow];
    UITableViewCell *cell =[self.tableView cellForRowAtIndexPath:path];
    cell.detailTextLabel.text = time;
    [self cancelClick];
    //
}


@end

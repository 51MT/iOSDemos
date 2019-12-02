//
//  DateView.m
//  xmh
//
//  Created by 神灯智能-技术研发中心-ios dev on 2017/11/24.
//  Copyright © 2017年 神灯智能-技术研发中心-ios dev. All rights reserved.
//

#import "DateView.h"
@interface DateView ()<UIPickerViewDelegate,UIPickerViewDataSource>

@end


@implementation DateView{
    
    NSString * _title;
}

- (instancetype)initWithFrame:(CGRect)frame title:(NSString *)title
{
    self = [super initWithFrame:frame];
    if (self) {
        _title = title;
        [self initSubViews];
    }
    return self;
}

- (void)initSubViews{
   
    UILabel * lb = [[UILabel alloc] init];
    lb.font = FONT_SIZE(13);
    lb.textColor = kLabelText_Commen_Color_6;
    lb.text = _title;
    [lb sizeToFit];
    lb.frame = CGRectMake(0, 35, self.width, lb.height);
    lb.textAlignment = NSTextAlignmentCenter;
    [self addSubview:lb];
    _lb = lb;
    [self initData];//初始化时间戳
    [self initPickerView];//创建pickerView
    NSDateComponents *startCpts = [_calendar components:NSCalendarUnitYear fromDate:_startDate];
    NSDateComponents *endCpts = [_calendar components:NSCalendarUnitYear fromDate:_endDate];
    NSInteger index = [endCpts year] - [startCpts year] ;
    [_pickerView selectRow:index inComponent:0 animated:YES];
    
    NSDate  *currentDate = [NSDate date];
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *components = [calendar components:NSCalendarUnitYear|NSCalendarUnitMonth|NSCalendarUnitDay fromDate:currentDate];
    NSInteger month=[components month];
    [_pickerView selectRow:month-1 inComponent:1 animated:YES];
    
    NSInteger day=[components day];
    
    [_pickerView selectRow:day-1 inComponent:2 animated:YES];
    
}
- (void)setSetDate:(NSDate *)setDate
{
    NSDate  *currentDate = setDate;
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *components = [calendar components:NSCalendarUnitYear|NSCalendarUnitMonth|NSCalendarUnitDay fromDate:currentDate];
    
    NSDateComponents *startCpts = [_calendar components:NSCalendarUnitYear fromDate:_startDate];
    
    NSInteger yearIndex = [components year] - [startCpts year];
    [_pickerView selectRow:yearIndex inComponent:0 animated:YES];
    
    NSInteger month=[components month];
    [_pickerView selectRow:month-1 inComponent:1 animated:YES];
    
    NSInteger day=[components day];
    
    [_pickerView selectRow:day-1 inComponent:2 animated:YES];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy年-MM月-dd日"];
    _selectDateStr = [dateFormatter stringFromDate:setDate];
}
-(void)initData{
    
    _calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy年-MM月-dd日"];
    dateFormatter.locale = [[NSLocale alloc] initWithLocaleIdentifier:@"zh_CN"];
//    NSDate * currentDate = [NSDate date];
//    NSString * currentStr = [dateFormatter stringFromDate:currentDate];
//    _startDate = [dateFormatter dateFromString:currentStr];
    _startDate =[dateFormatter dateFromString:@"2000年-01月-01日"];
    _endDate = [NSDate date];  //现在的时间
    _selectDate = _endDate;
    _selectedDateComponets = [_calendar components:NSCalendarUnitYear|NSCalendarUnitMonth|NSCalendarUnitDay fromDate:_selectDate];
    _selectDateStr = [dateFormatter stringFromDate:_selectDate];
    
    
}
-(void)initPickerView{
    
    _pickerView = [[UIPickerView alloc] initWithFrame:CGRectMake(0, _lb.bottom + 20, self.width - 25 , self.height - _lb.bottom - 20)];
    _pickerView.delegate = self;
    _pickerView.dataSource = self;
    [self addSubview:_pickerView];
}

-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    
    return 3;
}
-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    
    
    switch (component) { // component是栏目index，从0开始，后面的row也一样是从0开始
        case 0: { // 第一栏为年，这里startDate和endDate为起始时间和截止时间，请自行指定
            NSDateComponents *startCpts = [_calendar components:NSCalendarUnitYear fromDate:_startDate];
            NSDateComponents *endCpts = [_calendar components:NSCalendarUnitYear fromDate:_endDate];
            return [endCpts year] - [startCpts year] + 1;
        }
        case 1: // 第二栏为月份
            return 12;
        case 2: { // 第三栏为对应月份的天数
            NSRange dayRange = [_calendar rangeOfUnit:NSCalendarUnitDay inUnit:NSCalendarUnitMonth forDate:self.selectDate];
            return dayRange.length;
        }
        default:
            return 0;
    }
}
// 每列宽度
- (CGFloat)pickerView:(UIPickerView *)pickerView widthForComponent:(NSInteger)component {
    
    return _pickerView.width/3;
}

-(NSString*)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    
    switch (component) {
        case 0: {
            NSDateComponents *components = [self.calendar components:NSCalendarUnitYear fromDate:self.startDate];
            NSString * currentYear = [NSString stringWithFormat:@"%ld年", [components year] + row];
            return currentYear;
            break;
        }
        case 1: { // 返回月份可以用DateFormatter，这样可以支持本地化
            NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
            formatter.locale = [NSLocale currentLocale];
            NSArray *monthSymbols = [formatter veryShortMonthSymbols];
            return [NSString stringWithFormat:@"%@月", [monthSymbols objectAtIndex:row]];
            
            break;
            
        }
        case 2: {
            
            NSRange dateRange = [self.calendar rangeOfUnit:NSCalendarUnitDay inUnit:NSCalendarUnitMonth forDate:self.selectDate];
            NSString *currentDay = [NSString stringWithFormat:@"%02ld日", (row + 1) % (dateRange.length + 1)];
            return currentDay;
            break;
        }
        default:
            break;
    }
    return nil;
    
}
- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    
    
    NSInteger unitFlags = NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay;
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy年-MM月-dd日"];
    switch (component) {
        case 0: {
            
            
            _selectDate = [dateFormatter dateFromString:[NSString stringWithFormat:@"1900年-01月-01日"]];
            NSDateComponents *indicatorComponents = [_calendar components:NSCalendarUnitYear fromDate:_startDate];
            NSInteger year = [indicatorComponents year] + row;
            NSDateComponents *targetComponents = [_calendar components:unitFlags fromDate:self.selectDate];
            [targetComponents setYear:year];
            self.selectedDateComponets = targetComponents;
            _selectDate = [dateFormatter dateFromString:[NSString stringWithFormat:@"%ld年-%ld月-%ld日",targetComponents.year,_selectedDateComponets.month,_selectedDateComponets.day]];
            [pickerView selectRow:0 inComponent:1 animated:YES];//刷新
            [pickerView selectRow:0 inComponent:2 animated:YES];//刷新
            _selectDateStr = [dateFormatter stringFromDate:_selectDate];
            break;
        }
        case 1: {
            _selectDate = [dateFormatter dateFromString:[NSString stringWithFormat:@"%ld年-01月-01日",_selectedDateComponets.year]];
            NSDateComponents *targetComponents = [self.calendar components:unitFlags fromDate:self.selectDate];
            [targetComponents setMonth:row + 1];
            self.selectedDateComponets = targetComponents;
            _selectDate = [dateFormatter dateFromString:[NSString stringWithFormat:@"%ld年-%ld月-%ld日",_selectedDateComponets.year,targetComponents.month,_selectedDateComponets.day]];
            [pickerView reloadComponent:2];//移除
            _selectDateStr = [dateFormatter stringFromDate:_selectDate];
            [pickerView selectRow:0 inComponent:2 animated:YES];//刷新
            
            break;
        }
        case 2: {
            
            NSDateComponents *targetComponents = [self.calendar components:unitFlags fromDate:self.selectDate];
            [targetComponents setDay:row + 1];
            self.selectedDateComponets = targetComponents;
            _selectDate = [dateFormatter dateFromString:[NSString stringWithFormat:@"%ld年-%ld月-%ld日",_selectedDateComponets.year,targetComponents.month,_selectedDateComponets.day]];
            _selectDateStr = [dateFormatter stringFromDate:_selectDate];
            break;
        }
        default:
            break;
    }
}
- (UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(UIView *)view{
    UILabel* pickerLabel = (UILabel*)view;
    if (!pickerLabel){
        pickerLabel = [[UILabel alloc] init];
        
        [pickerLabel sizeToFit];
        pickerLabel.textAlignment = NSTextAlignmentCenter;
        pickerLabel.backgroundColor = [UIColor clearColor];
        [pickerLabel setFont:[UIFont boldSystemFontOfSize:14]];
    }
    // Fill the label text here
    pickerLabel.text=[self pickerView:pickerView titleForRow:row forComponent:component];
    return pickerLabel;
}



@end

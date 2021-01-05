//
//  JMJProductController.m
//  网易彩票
//
//  Created by HUST on 2020/12/30.
//

#import "JMJProductController.h"
#import "JMJProductCell.h"
#import "JMJProduct.h"

@interface JMJProductController ()

@property (nonatomic,strong)NSArray *products;

@end

@implementation JMJProductController

static NSString * const reuseIdentifier = @"product_cell";

-(NSArray *)products
{
    if(!_products)
    {
        //获取文件路径
        NSString *path=[[NSBundle mainBundle]pathForResource:@"more_products" ofType:@"json"];
        //文件转化成data
        NSData *data = [NSData dataWithContentsOfFile:path];
        //data转化成array
        NSArray *tempArray = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
        //初始化可变数组
        NSMutableArray *array = [NSMutableArray array];
        //遍历临时数组，获取字典
        for(NSDictionary *dict in tempArray){
            //字典转模型
            JMJProduct *p=[JMJProduct productWithDict:dict];
            
            //模型添加到可变数组当中
            [array addObject:p];
        }
        //赋值
        _products=array;
    }
    return _products;
}

-(instancetype)init{
    
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
    self=[super initWithCollectionViewLayout:layout];
    return self;
}

- (instancetype)initWithCollectionViewLayout:(UICollectionViewLayout *)layout
{
    UICollectionViewFlowLayout *layout2 = [[UICollectionViewFlowLayout alloc]init];
    self=[super initWithCollectionViewLayout:layout2];
    return self;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // 流水布局:调整cell尺寸
    UICollectionViewFlowLayout *layout = ({
            
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
        layout.itemSize = CGSizeMake(80, 80);//每一个cell的大小
        layout.scrollDirection = UICollectionViewScrollDirectionVertical;//滚动方向
//            CGFloat margin = (jmjScreenWidth - 160) *0.5;
        layout.sectionInset = UIEdgeInsetsMake(10,10,10,10);//四周的边距
            //设置最小边距
        layout.minimumLineSpacing = 50;
            
        layout;
    });
        
    // 创建UICollectionView
    // 函数式编程思想(高聚合):把很多功能放在一个函数块(block块)去处理
    // 编程思想:低耦合,高聚合(代码聚合,方便去管理)
        
    UICollectionView *collectionV = ({
            
        UICollectionView *collectionV = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 200, jmjScreenWidth, 200) collectionViewLayout:layout];
        
        collectionV.backgroundColor = [UIColor whiteColor];
        collectionV.dataSource = self;

        [self.view addSubview:collectionV];
        collectionV;
    });
    self.collectionView = collectionV;
    [collectionV registerNib:[UINib nibWithNibName:@"JMJProductCell" bundle:nil] forCellWithReuseIdentifier:reuseIdentifier];
       
    
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    JMJProduct * p = self.products[indexPath.row];
    NSLog(@"%@",p.stitle);
    
}


- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.products.count;
}



- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    JMJProductCell *cell=[collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    
    cell.product = self.products[indexPath.row];
    return cell;
}
@end

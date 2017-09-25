//
//  ViewController.m
//  AutoLayer
//
//  Created by 雨停 on 2017/9/19.
//  Copyright © 2017年 autolayer. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
- (IBAction)add:(id)sender {
    UIImageView *imageView = [[UIImageView alloc] initWithImage
                              :[UIImage imageNamed:@"闪屏页LOGO"]];
    imageView.contentMode = UIViewContentModeScaleAspectFit;
    [self.imageStackView addArrangedSubview:imageView]; [UIView animateWithDuration:0.25 animations:^{
        [self.imageStackView layoutIfNeeded]; }];
}
- (IBAction)delect:(id)sender {
    UIImageView *imageView = [self.imageStackView.arrangedSubviews lastObject];
    if (imageView) {
        [self.imageStackView removeArrangedSubview:imageView]; [imageView removeFromSuperview];
        [UIView animateWithDuration:0.25 animations:^{
            [self.imageStackView layoutIfNeeded];
        }];
}
}
-(void)gcd{
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        
    });
}
-(void)gcdserial{
    dispatch_queue_t serial_queue = dispatch_queue_create("chuanxing", DISPATCH_QUEUE_SERIAL);
    for (int index =0; index <10; index++) {
        if(index==0){
            dispatch_async(serial_queue, ^{
               // NSLog(@"11111111111111111");
                           });
        }else if(index==1){
            dispatch_async(serial_queue, ^{
               // NSLog(@"22222222222222222");
            });
        }else if(index==2){
            dispatch_async(serial_queue, ^{
               // NSLog(@"333333333333");
            });
        }
        dispatch_sync(serial_queue, ^{
               //NSLog(@"idenx = %d",index);
               //NSLog(@"curent thread is %@",[NSThread currentThread]);
            
        });
    }
    dispatch_queue_t concurrent  = dispatch_queue_create("bingxing", DISPATCH_QUEUE_CONCURRENT);
    for (int index =0; index<10; index++) {
        dispatch_async(concurrent, ^{
            NSLog(@"idenx = %d",index);
            NSLog(@"curent thread is %@",[NSThread currentThread]);

        });
        
        
    }
    //for (int j =0 ; j<10000; j++) {
        dispatch_barrier_async(concurrent, ^{
            NSLog(@"idenx = 100000000");
            NSLog(@"curent thread is %@",[NSThread currentThread]);
            
        });
    //}
    

    for (int index =10; index<20; index++) {
        dispatch_async(concurrent, ^{
            NSLog(@"idenx = %d",index);
            NSLog(@"curent thread is %@",[NSThread currentThread]);
            
        });
    }
    
}
- (void)viewDidLoad {
   // [self gcdserial];
    [self dispathGroup];
    [super viewDidLoad];
    self.automaticallyAdjustsScrollViewInsets=NO;
   /* UIView  * bottom  = [[UIView  alloc]initWithFrame:CGRectMake(0, 0, 300, 300)];
    bottom .backgroundColor = [UIColor redColor];
    [self.view addSubview:bottom];
    
    UIView  * head    = [[UIView alloc]init];
    head.autoresizingMask = UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleHeight;
    head.frame = CGRectInset(bottom.bounds, 20, 20);
    head.backgroundColor = [UIColor yellowColor];
    [bottom addSubview:head];*/
}
-(void)dispathGroup{
    dispatch_group_t  group = dispatch_group_create();
    dispatch_group_enter(group);
    for (int i=0; i<10; i++) {
        NSLog(@"i====%d",i);
        if(i==9){
            dispatch_group_leave(group);
        }
    }
    dispatch_group_enter(group);
    for (int i=10; i<19; i++) {
        NSLog(@"i====%d",i);
        if(i==18){
            dispatch_group_leave(group);
        }
    }
    
    
    dispatch_group_notify(group, dispatch_get_main_queue(), ^{
        NSLog(@"回到主线程");
    });
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
 
}

@end

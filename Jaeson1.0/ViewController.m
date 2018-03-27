//
//  ViewController.m
//  Jaeson1.0
//
//  Created by Leson on 2018/3/26.
//  Copyright © 2018年 Leson. All rights reserved.
//

#import "ViewController.h"
#import <objc/runtime.h>

typedef NSMutableArray<NSMutableArray<NSString *> *> CJIndexPathArray;

@interface ViewController ()

///
@property (nonatomic,retain) CJIndexPathArray *indexPathArray;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSLog(@"%@",NSStringFromSelector(_cmd));
    
    self.indexPathArray = [NSMutableArray array];
    
    for (int i = 0; i<3; i++) {
        NSMutableArray *rowArray = [NSMutableArray array];
        for (int j = 0; j< 9; j++) {
            [rowArray addObject:[NSString stringWithFormat:@"%d %d",i,j]];
        }
        [self.indexPathArray addObject:rowArray];
    }
    
    NSLog(@"%@",self.indexPathArray);
    
    NSString *testStr = [self testRuntime];
    
    NSLog(@"runtime's testStr is %@",testStr);
    // Do any additional setup after loading the view, typically from a nib.
}

- (NSString *)testRuntime
{
    NSString *testStr = objc_getAssociatedObject(self, _cmd);
    
    
    if (!testStr) {
        testStr = @"testStr";
        objc_setAssociatedObject(self, _cmd, testStr, OBJC_ASSOCIATION_COPY_NONATOMIC);
    }
    
    return testStr;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end

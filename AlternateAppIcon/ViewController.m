//
//  ViewController.m
//  AlternateAppIcon
//
//  Created by Genie Sun on 2017/4/1.
//  Copyright © 2017年 Onstar. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
{
    NSUInteger t ;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [NSTimer scheduledTimerWithTimeInterval:5 target:self selector:@selector(changeIcon:) userInfo:nil repeats:YES];
}


-(void)changeIcon:(NSTimer *)sender
{
    //是否支持 AlternateIcons
    if (t == 2) {
        t = 1;
    }else{
        t ++;
    }
    if ([[UIApplication sharedApplication] supportsAlternateIcons]) {
        [[UIApplication sharedApplication] setAlternateIconName:[NSString stringWithFormat:@"Icon%lu",(unsigned long)t] completionHandler:^(NSError * _Nullable error) {
            
            if (error) {
                NSLog(@"error = %@",error.localizedDescription);
            }else{
                NSLog(@"good job !");
            }
        }];
    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}




@end

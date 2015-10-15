//
//  ViewController.m
//  YUVToImage
//
//  Created by mac on 15/7/23.
//  Copyright (c) 2015年 mac. All rights reserved.
//

#import "ViewController.h"
#import "YUVObj.h"
#import "OpenGLYUV420P.h"
#import "AppDelegate.h"


#define W 1280
#define H 720

@interface ViewController ()
{
    OpenGLYUV420P * myview;
}
@end

@implementation ViewController

- (IBAction)restart:(id)sender {
    
    @autoreleasepool {
        NSString* paths = [[NSBundle mainBundle] pathForResource:@"1" ofType:@"yuv" inDirectory:nil];
        
        
        YUVObj *a = [[YUVObj alloc]init];
        
        [a readYUV:paths width:W height:H :^(NSData *spaces, bool isEnd) {
            dispatch_async(dispatch_get_main_queue(), ^{
                if (spaces) {
                    UInt8 * pFrameRGB = (UInt8*)[spaces bytes];
                    [myview inputActualYUVData:pFrameRGB width:W height:H];
                }else
                {
                    [myview clearUIView];
                }
                
            });
        }];
    }
   
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    myview = [[OpenGLYUV420P alloc]initWithFrame:CGRectMake(10, 10, W/5, H/5)];
    
    [self.view addSubview:myview];

    [myview inputResolutionWidth:W height:H];
    

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

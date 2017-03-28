////
////  ViewController.m
////  AliyunSDKVideoTest
////
////  Created by xiaohui on 2016/10/27.
////  Copyright © 2016年 xiaohui. All rights reserved.
////
//
//#import "ViewController.h"
//#import <AliyunPlayerSDK/AliVcMediaPlayer.h>
//
//@interface ViewController ()<AliVcAccessKeyProtocol>
//{
//    AliVcMediaPlayer *player;
//    UISlider *playSlider;
//}
//@end
//
//@implementation ViewController
//
//NSString* accessKeyID = @"LTAIkFKckLG68kIv";
//NSString* accessKeySecret = @"0vAGMlNIu5RGYusGl3fysIxvZScqca";
//
//-(AliVcAccesskey*)getAccessKeyIDSecret
//{
//    AliVcAccesskey* accessKey = [[AliVcAccesskey alloc] init];
//    accessKey.accessKeyId = accessKeyID;
//    accessKey.accessKeySecret = accessKeySecret;
//    return accessKey;
//}
//
//
//- (void)viewDidLoad {
//    [super viewDidLoad];
//    // Do any additional setup after loading the view, typically from a nib.
//    
//    [AliVcMediaPlayer setAccessKeyDelegate:self];
//    [self playVideo];
//}
//
//-(void) playVideo
//{
//    //新建播放器
//    player = [[AliVcMediaPlayer alloc] init]; //创建播放器，传入显示窗口
//    [player create:self.view];
//    
//    playSlider = [[UISlider alloc] initWithFrame:CGRectMake(60, 200, 200, 10)];
//    playSlider.backgroundColor = [UIColor redColor];
//    [player.view.superview addSubview:playSlider];
//    
//    //注册准备完成通知
//    [[NSNotificationCenter defaultCenter] addObserver:self
//                                             selector:@selector(OnVideoPrepared:) name:AliVcMediaPlayerLoadDidPreparedNotification object:player];
//    //注册错误通知
//    [[NSNotificationCenter defaultCenter] addObserver:self
//                                             selector:@selector(OnVideoError:) name:AliVcMediaPlayerPlaybackErrorNotification object:player];
//    //授权验证
//    [self getAccessKeyIDSecret];
//    
//    
//    //传入播放地址，初始化视频，准备播放
//    [player prepareToPlay:[NSURL URLWithString:@"http://paopao.nosdn.127.net/a9b95b64-dfd1-4d5a-b705-9e301708b6f6.mp4"]];
//    //    [player prepareToPlay:[NSURL URLWithString:@"http://v.jxvdy.com/sendfile/w5bgP3A8JgiQQo5l0hvoNGE2H16WbN09X-ONHPq3P3C1BISgf7C-qVs6_c8oaw3zKScO78I--b0BGFBRxlpw13sf2e54QA"]];
//    
//    
//    //    //本地播放
//    //    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"蚂蚁大战" ofType:@"mp4"];
//    //    NSURL *sourceMovieURL = [NSURL fileURLWithPath:filePath];
//    //    [player prepareToPlay:sourceMovieURL];
//    
//    
//    //开始播放
//    [player play];
//}
//
//- (void) OnVideoPrepared:(NSNotification *)notification {
//    //收到完成通知后，获取视频的相关信息，更新界面相关信息
//    [playSlider setMinimumValue:0];
//    [playSlider setMaximumValue:player.duration];
//}
//
//- (void)OnVideoError:(NSNotification *)notification {
//    AliVcMovieErrorCode error_code = player.errorCode;
//}
//
//- (void)didReceiveMemoryWarning {
//    [super didReceiveMemoryWarning];
//    // Dispose of any resources that can be recreated.
//}
//
//@end

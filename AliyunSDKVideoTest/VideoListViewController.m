//
//  VideoListViewController.m
//  TBMediaPlayerTest
//
//  Created by shiping chen on 15-7-20.
//  Copyright (c) 2015年 shiping chen. All rights reserved.
//

#import "VideoListViewController.h"
#import "AliVcMoiveViewController.h"
#import "XHNetwork.h"

@interface VideoListViewController ()

@end

@implementation VideoListViewController

@synthesize videolists,datasource;

- (NSArray *)getFilenamelistOfType:(NSString *)type fromDirPath:(NSString *)dirPath
{
    NSMutableArray *filenamelist = [NSMutableArray arrayWithCapacity:10];
    NSArray *tmplist = [[NSFileManager defaultManager] contentsOfDirectoryAtPath:dirPath error:nil];
    
    for (NSString *filename in tmplist) {
        NSString *fullpath = [dirPath stringByAppendingPathComponent:filename];
        if ([self isFileExistAtPath:fullpath]) {
            if ([[filename pathExtension] isEqualToString:type]) {
                [filenamelist addObject:filename];
            }
        }
    }
    return filenamelist;
}

- (BOOL)isFileExistAtPath:(NSString*)fileFullPath {
    BOOL isExist = NO;
    isExist = [[NSFileManager defaultManager] fileExistsAtPath:fileFullPath];
    return isExist;
}

- (void)loadLocalVideo
{
    NSArray *pathArray = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *docDir = [pathArray objectAtIndex:0];
    NSMutableArray* video_extension = [[NSMutableArray alloc] init];
    [video_extension addObject:@"mp4"];
    [video_extension addObject:@"mkv"];
    [video_extension addObject:@"rmvb"];
    [video_extension addObject:@"rm"];
    [video_extension addObject:@"avs"];
    [video_extension addObject:@"mpg"];
    [video_extension addObject:@"3g2"];
    [video_extension addObject:@"asf"];
    [video_extension addObject:@"mov"];
    [video_extension addObject:@"avi"];
    [video_extension addObject:@"wmv"];
    [video_extension addObject:@"flv"];
    [video_extension addObject:@"m4v"];
    [video_extension addObject:@"swf"];
    [video_extension addObject:@"webm"];
    [video_extension addObject:@"3gp"];
    
    for(NSString* ext in video_extension) {
        
        NSArray *filename = [self getFilenamelistOfType:ext fromDirPath:docDir];
        
        for (NSString* name in filename) {
            
            NSMutableString* fullname = [NSMutableString stringWithString:docDir];
            [fullname appendString:@"/"];
            [fullname appendString:name];

            [videolists setObject:fullname forKey:name];
            [datasource addObject:fullname];
        }
    }
//    datasource = [videolists allKeys]; //存放本地视频文件的缩略名
}

- (void)loadRemoteVideo
{
//    NSArray *pathArray = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
//    NSString *docDir = [pathArray objectAtIndex:0];
//    NSString *videolistPath = [docDir stringByAppendingFormat:@"/videolist.txt"];
//    FILE *file = fopen([videolistPath UTF8String], "rb");
//    if(file == NULL)
//        return;
//    
//    char VideoPath[200] = {0};
//    fgets(VideoPath, 200, file);
//    
//    do{
//        VideoPath[strlen(VideoPath)] = '\0';
//        NSString *srcFile = [NSString stringWithUTF8String:VideoPath];
//        
//        NSRange range1 = [srcFile rangeOfString:@"["];
//        NSRange range2 = [srcFile rangeOfString:@"]"];
//        if(range1.location == NSNotFound || range2.location == NSNotFound)
//            continue;
//        NSRange rangeName;
//        rangeName.location = range1.location+1;
//        rangeName.length = range2.location-range1.location-1;
//        NSString* filename = [srcFile substringWithRange:rangeName];
//        
//        NSRange range;
//        range = [srcFile rangeOfString:@"http:"];
//        if(range.location == NSNotFound){ //m3u8
//            range = [srcFile rangeOfString:@"rtmp:"];
//            if(range.location == NSNotFound){ //rtmp
//                continue;
//            }
//        }
//        
//        NSString* m3u8file = [srcFile substringFromIndex:range.location];
//        NSRange rangeEnd = [srcFile rangeOfString:@"\n"];
//        if(rangeEnd.location != NSNotFound) {
//            rangeEnd.location = 0;
//            rangeEnd.length = m3u8file.length-1;
//            m3u8file = [m3u8file substringWithRange:rangeEnd];
//        }
//        rangeEnd = [srcFile rangeOfString:@"\r"];
//        if(rangeEnd.location != NSNotFound) {
//            rangeEnd.location = 0;
//            rangeEnd.length = m3u8file.length-1;
//            m3u8file = [m3u8file substringWithRange:rangeEnd];
//        }
//        
//        [videolists setObject:m3u8file forKey:filename];
//        
//    
//    }while (fgets(VideoPath, 200, file));
//    
//    fclose(file);
    
    
    NSString *urlString = @"http://paopao.nosdn.127.net/3272d052-7ad6-4878-bfe5-735265f50696.mp4";
    NSString *urlString2 = @"http://paopao.nosdn.127.net/3dead406-a23c-4906-a8a3-07ee999163d2.mp4";
    NSString *urlString3 = @"http://paopao.nosdn.127.net/a9b95b64-dfd1-4d5a-b705-9e301708b6f6.mp4";
    datasource = [NSMutableArray arrayWithObjects:urlString, urlString2, urlString3, nil];
}

NSString* accessKeyID = @"LTAIkFKckLG68kIv";
NSString* accessKeySecret = @"0vAGMlNIu5RGYusGl3fysIxvZScqca";

-(AliVcAccesskey*)getAccessKeyIDSecret
{
    AliVcAccesskey* accessKey = [[AliVcAccesskey alloc] init];
    accessKey.accessKeyId = accessKeyID;
    accessKey.accessKeySecret = accessKeySecret;
    return accessKey;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.navigationItem.title = @"video list";
    [AliVcMediaPlayer setAccessKeyDelegate:self];
    videolists = [[NSMutableDictionary alloc]init];
    datasource = [[NSMutableArray alloc] init];
//    [self loadLocalVideo];
    [self loadRemoteVideo];
    
    
    
//    //下载视频至本地
//    XHNetwork *network = [XHNetwork sharedInstance];
//    [network downloadFileWithURLString:@"http://paopao.nosdn.127.net/3dead406-a23c-4906-a8a3-07ee999163d2.mp4" result:^(NSString *filePath, float progressNumber, NSString *progressString, NSError *error) {
//    }];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [datasource count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = (UITableViewCell *) [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
    }
    
    //---------- CELL BACKGROUND IMAGE -----------------------------
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:cell.frame];
    UIImage *image = [UIImage imageNamed:@"LightGrey@2x.png"];
    imageView.image = image;
    cell.backgroundView = imageView;
    [[cell textLabel] setBackgroundColor:[UIColor clearColor]];
    [[cell detailTextLabel] setBackgroundColor:[UIColor clearColor]];
    cell.textLabel.text = [datasource objectAtIndex:indexPath.row];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    AliVcMoiveViewController* currentView = [[AliVcMoiveViewController alloc] init];
    NSString* vs = datasource[indexPath.row];
    NSFileManager *fileManager = [NSFileManager defaultManager];
    if([fileManager fileExistsAtPath:vs]){
        NSURL* url = [NSURL fileURLWithPath:vs];
        [currentView SetMoiveSource:url];
    }
    else {
        NSURL* url = [NSURL URLWithString:vs];
        [currentView SetMoiveSource:url];
    }
    [self presentViewController:currentView animated:YES completion:nil];
}

@end

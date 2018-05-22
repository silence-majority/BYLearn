//
//  ViewController.m
//  BYLearn
//
//  Created by xy_yanfa_imac on 2018/3/29.
//  Copyright © 2018年 xy_yanfa_imac. All rights reserved.
//

#import "ViewController.h"
#import "LoginViewController.h"
@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong)UITableView *tableView;
@property (nonatomic,strong)NSArray <NSString *> *dataList;
@end

@implementation ViewController

- (void)viewDidLoad {
    self.navigationItem.title = @"学习例子";
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    _dataList = @[@"RAC",@"文件系统"];
    [self.view addSubview:self.tableView];
//    [self createDirectory];
//    [self removeDirectory];
//    [self writeFile];
//    [self moveFile];
//    [self copyFile];
//    [self copyMainBundleFileToDocument];
}

- (UITableView *)tableView{
    if (!_tableView) {
        UITableView *tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
        tableView.delegate = self;
        tableView.dataSource = self;
        _tableView = tableView;
    }
    return _tableView;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _dataList.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"cellId"];
    cell.textLabel.text = _dataList[indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:true];
    if ([_dataList[indexPath.row] isEqualToString:@"RAC"]) {
        LoginViewController *target = [LoginViewController new];
        [self.navigationController pushViewController:target animated:true];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

- (NSString *)getDocumentsPath{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *path = paths.firstObject;
    NSLog(@"\n\n Document Path >>>>>> \n%@\n\n",path);
    return path;
}

- (void)createDirectory{
    NSString *documentPath = [self getDocumentsPath];
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSString *v6Directory = [documentPath stringByAppendingPathComponent:@"v6Directory"];
    BOOL success = [fileManager createDirectoryAtPath:v6Directory withIntermediateDirectories:YES attributes:nil error:nil];
    if (success) {
        NSLog(@"创建目录成功");
    }else{
        NSLog(@"创建目录失败");
    }
}

- (void)removeDirectory{
    NSString *documentPath = [self getDocumentsPath];
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSString *v6Directory = [documentPath stringByAppendingPathComponent:@"v6Directory"];
    NSError *error;
    BOOL success = [fileManager removeItemAtPath:v6Directory error:&error];
    if (success) {
        NSLog(@"删除目录成功");
    }else{
        NSLog(@"删除目录失败");
    }
    NSLog(@"%@",error);
}

- (void)writeFile{
    NSString *documentPath = [self getDocumentsPath];
    NSString *v6Directory = [documentPath stringByAppendingPathComponent:@"v6Directory"];
    NSString *filePath = [v6Directory stringByAppendingPathComponent:@"text.txt"];
    NSString *content = @"这是我写入的文件内容";
    BOOL success = [content writeToFile:filePath atomically:YES encoding:NSUTF8StringEncoding error:nil];
    if (success) {
        NSLog(@"写入成功");
    }else{
        NSLog(@"写入失败");
    }
}

- (void)moveFile{
    NSString *documentPath = [self getDocumentsPath];
    NSString *v5Directory = [documentPath stringByAppendingPathComponent:@"v5Directory"];
    NSString *v6Directory = [documentPath stringByAppendingPathComponent:@"v6Directory"];
    NSString *filePath = [v6Directory stringByAppendingPathComponent:@"text.txt"];
    NSString *movePath = [v5Directory stringByAppendingPathComponent:@"text.txt"];
    NSFileManager *fileManager = [NSFileManager defaultManager];
    BOOL success = [fileManager moveItemAtPath:filePath toPath:movePath error:nil];
    if (success) {
        NSLog(@"移动文件成功");
    }else{
        NSLog(@"移动文件失败");
    }
}

- (void)copyFile{
    NSString *documentPath = [self getDocumentsPath];
    NSString *v5Directory = [documentPath stringByAppendingPathComponent:@"v5Directory"];
    NSString *v6Directory = [documentPath stringByAppendingPathComponent:@"v6Directory"];
    NSString *filePath = [v5Directory stringByAppendingPathComponent:@"text.txt"];
    NSString *copyPath = [v6Directory stringByAppendingPathComponent:@"text.txt"];
    NSFileManager *fileManager = [NSFileManager defaultManager];
    BOOL success = [fileManager copyItemAtPath:filePath toPath:copyPath error:nil];
    if (success) {
        NSLog(@"复制文件成功");
    }else{
        NSLog(@"复制文件失败");
    }
}

- (void)copyMainBundleFileToDocument{
    NSString *documentPath = [self getDocumentsPath];
    NSString *v5Directory = [documentPath stringByAppendingPathComponent:@"v5Directory"];
    NSString *copyPath = [v5Directory stringByAppendingPathComponent:@"index.ios.jsbundle"];
    
    NSString *bundlePath = [[NSBundle mainBundle] pathForResource:@"index.ios" ofType:@"jsbundle"];
    NSLog(@"\nbundlePath >>>> \n%@\n\n",bundlePath);
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSError *error;
    BOOL success = [fileManager copyItemAtPath:bundlePath toPath:copyPath error:&error];
    if (success) {
        NSLog(@"复制文件成功");
    }else{
        NSLog(@"复制文件失败");
    }
    NSLog(@"%@",error);
}

@end

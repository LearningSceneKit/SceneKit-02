//
//  ViewController.m
//  SceneKit-02
//
//  Created by ShiWen on 2017/6/13.
//  Copyright © 2017年 ShiWen. All rights reserved.
//

#import "ViewController.h"

#import <SceneKit/SceneKit.h>

@interface ViewController ()
@property (nonatomic,strong) SCNView *scnView;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    SCNScene *scene = [SCNScene scene];
    self.scnView.scene = scene;
    
//    //创建节点
    SCNNode *coneNode = [SCNNode node];
////    添加
    [scene.rootNode addChildNode:coneNode];
//    //创建几何体
    SCNCone *cone = [SCNCone coneWithTopRadius:0.2 bottomRadius:0.5 height:1];
    cone.firstMaterial.diffuse.contents = [UIColor orangeColor];
    coneNode.geometry = cone;
    
////    创建子节点
    SCNNode *textNode = [SCNNode node];
    textNode.position = SCNVector3Make(-0.5, 0, 1);
////    创建有一定挤压深度的3D文本 extrusionDepth： 挤压深度
    SCNText *text = [SCNText textWithString:@"有问题一起研究呀" extrusionDepth:0.03];
    //设置文字颜色
    text.firstMaterial.diffuse.contents = [UIColor blueColor];

    textNode.geometry = text;
    text.font = [UIFont systemFontOfSize:0.15];
    [coneNode addChildNode:textNode];

    [self.view addSubview:self.scnView];
    
    
}


-(SCNView*)scnView{
    if (!_scnView) {
        _scnView = [[SCNView alloc] initWithFrame:CGRectMake(0, 0, 375, 375)];
        _scnView.center = self.view.center;
        _scnView.allowsCameraControl = YES;
        _scnView.backgroundColor = [ UIColor blackColor];
    }
    return _scnView;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end

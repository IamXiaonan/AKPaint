//
//  ViewController.m
//  AKPaint
//
//  Created by Xiaonan Wang on 6/22/15.
//  Copyright (c) 2015 Xiaonan Wang. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

-(void)viewWillLayoutSubviews {
    [super viewWillLayoutSubviews];
    
    // Configure the view.
    _skView = (SKView *)self.view;
    if (!_skView.scene) {
        _skView.showsFPS = NO;
        _skView.showsNodeCount = NO;
        [_skView setBackgroundColor:[UIColor blueColor]];
        
        [self setScenes];
        //[self setButtons];
        
        
    }
}

-(void)setScenes{
    // Create and configure the scene.
    
    //scene.scaleMode = SKSceneScaleModeAspectFill;
    _myScene = [[AKPaintDemo alloc]initWithSize:self.view.frame.size];
    
    //Present the scene.
    [_skView presentScene:_myScene];
}

- (BOOL)prefersStatusBarHidden {
    return YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

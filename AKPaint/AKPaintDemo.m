//
//  AKPaintDemo.m
//  AKPaint
//
//  Created by Xiaonan Wang on 6/22/15.
//  Copyright (c) 2015 Xiaonan Wang. All rights reserved.
//

#import "AKPaintDemo.h"

@implementation AKPaintDemo{
    NSMutableArray *line;
    SKSpriteNode *worldNode;
    SKSpriteNode *eraser;
    CGPathRef pathToDraw;
    SKShapeNode *lineNode;
}

-(id)initWithSize:(CGSize)size{
    if (self = [super initWithSize:size]) {
        [self setBackgroundColor:[UIColor whiteColor]];
        line = [[NSMutableArray alloc]init];
        worldNode = [[SKSpriteNode alloc]init];
        [worldNode setSize:size];
        [worldNode setColor:[UIColor whiteColor]];
        [self addChild:worldNode];
        
        eraser = [[SKSpriteNode alloc]initWithImageNamed:@"eraser.png"];
        eraser.name = @"eraser";
        [eraser setPosition:CGPointMake(40, 40)];
        [eraser setAnchorPoint:CGPointMake(0.5, 0.5)];
        [self addChild:eraser];
    }
    return self;
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    
    UITouch* touch = [touches anyObject];
    CGPoint location = [touch locationInNode:self];
    SKNode *node = [self nodeAtPoint:location];
    
    if([node.name isEqualToString:@"eraser"]){
        [[line lastObject]removeFromParent];
        [line removeLastObject];
        NSLog(@"line: %lu",(unsigned long)[line count]);
        //[worldNode removeChildrenInArray:line];
    }else{
        CGPoint positionInScene = [touch locationInNode:self];
        
        pathToDraw = CGPathCreateMutable();
        CGPathMoveToPoint(pathToDraw, NULL, positionInScene.x, positionInScene.y);
        
        lineNode = [SKShapeNode node];
        lineNode.path = pathToDraw;
        lineNode.lineWidth = 5;
        lineNode.strokeColor = [SKColor redColor];
        [worldNode addChild:lineNode];
    }
}

- (void)touchesMoved:(NSSet*)touches withEvent:(UIEvent*)event
{
    UITouch* touch = [touches anyObject];
    CGPoint location = [touch locationInNode:self];
    SKNode *node = [self nodeAtPoint:location];
    
    if([node.name isEqualToString:@"eraser"]){
    }else{
        CGPathAddLineToPoint(pathToDraw, NULL, location.x, location.y);
        lineNode.path = pathToDraw;
    }
    
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    // delete the following line if you want the line to remain on screen.
    UITouch* touch = [touches anyObject];
    CGPoint location = [touch locationInNode:self];
    SKNode *node = [self nodeAtPoint:location];
    
    if(![node.name isEqualToString:@"eraser"]){
        [line addObject:lineNode];
        NSLog(@"count: %lu",(unsigned long)[line count]);
    }
    
}

@end

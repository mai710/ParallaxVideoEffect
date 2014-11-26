//
//  ViewController.m
//  VideoEffect
//
//  Created by Mai El-Awini on 2014-11-23.
//  Copyright (c) 2014 CodePlusArt. All rights reserved.
//

#import "ViewController.h"

@interface ViewController (){
    CGFloat initialCenter;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    UIInterpolatingMotionEffect *horizontalEffect = [[UIInterpolatingMotionEffect alloc] initWithKeyPath:@"center.x"
                                                                                                    type:UIInterpolatingMotionEffectTypeTiltAlongHorizontalAxis];
    horizontalEffect.minimumRelativeValue = @(-20);
    horizontalEffect.maximumRelativeValue = @( 20);
    [self.bg addMotionEffect:horizontalEffect];
    
    initialCenter = self.view.center.x;
    
    [NSTimer scheduledTimerWithTimeInterval:0.05 target:self selector:@selector(stepAnimation) userInfo:nil repeats:YES];
}



- (void)stepAnimation
{
    CALayer *prez = [self.bg.layer presentationLayer];
    CGFloat progress = prez.position.x;
    NSLog(@"first: %f", initialCenter);
    progress = (initialCenter + 20 - progress) / 40.0;
    self.fg2.alpha = [self clamp:(progress - 0.33) Between:0 And:0.33] / 0.33;
    self.fg3.alpha = [self clamp:(progress - 0.66) Between:0 And:0.33] / 0.33;
//    NSLog(@"%f", self.fg2.alpha);
}


- (CGFloat)clamp:(CGFloat)value Between:(CGFloat)min And:(CGFloat)max
{
    if (value > max) {
        return max;
    }
    else if (value < min){
        return min;
    }
    else{
        NSLog(@"%f",value);
        return value;
    }
}


@end

//
//  ViewController.m
//  EightBall
//
//  Created by usuario on 6/7/15.
//  Copyright (c) 2015 Rock&App. All rights reserved.
//

#import "ViewController.h"

static NSString* gAnswers[] = {
    @"\rYES",
    @"\rNO",
    @"\rMAYBE",
    @"I\rDONT\rKNOW",
    @"TRY\rAGAIN\rSOON",
    @"READ\rTHE\rMANUAL",
};

#define kNumberOfAnswers (sizeof(gAnswers)/sizeof(NSString*))

@interface ViewController ()
-(void)fadeFortune;
-(void)newFortune;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)fadeFortune{
    [UIView animateWithDuration:0.75 animations:^{self.answerView.alpha = 0.0;}] ;
}

-(void)newFortune{
    self.answerView.text = gAnswers[arc4random_uniform(kNumberOfAnswers)];
    [UIView animateWithDuration:2.0 animations:^{self.answerView.alpha = 1.0;}];
}

-(void)motionBegan:(UIEventSubtype)motion withEvent:(UIEvent *)event {
    if(motion == UIEventSubtypeMotionShake){
        [self fadeFortune];
    }
}

-(void)motionEnded:(UIEventSubtype)motion withEvent:(UIEvent *)event{
    if(motion == UIEventSubtypeMotionShake){
        [self newFortune];
    }
}

-(void)motionCancelled:(UIEventSubtype)motion withEvent:(UIEvent *)event{
    if(motion == UIEventSubtypeMotionShake){
        [self newFortune];
    }
}
@end















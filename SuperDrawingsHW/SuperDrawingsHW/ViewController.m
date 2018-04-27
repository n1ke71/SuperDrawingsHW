//
//  ViewController.m
//  SuperDrawingsHW
//
//  Created by Ivan Kozaderov on 27.04.2018.
//  Copyright © 2018 n1ke71. All rights reserved.
//

#import "ViewController.h"
#import "DrawingView.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet DrawingView *drawingView;
- (IBAction)actionClearPictureItem:(UIBarButtonItem *)sender;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.drawingView.points = [NSMutableArray array];
    
    UITapGestureRecognizer* tapGesture = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(handleTap:)];
    
    [self.view addGestureRecognizer:tapGesture];
    
    
}

#pragma mark - Redraw

- (void)viewWillTransitionToSize:(CGSize)size withTransitionCoordinator:(id <UIViewControllerTransitionCoordinator>)coordinator
{
    [self.drawingView setNeedsDisplay];
    
    
}


#pragma mark - UIGestures

-(void)handleTap:(UITapGestureRecognizer*)tapGesture{
    
    CGPoint point =  [tapGesture locationInView:self.drawingView];
    
    NSValue* value = [NSValue valueWithCGPoint:point];
    
    [self.drawingView.points addObject:value];
    
    [self.drawingView setNeedsDisplay];
    
}




#pragma mark - Actions


- (IBAction)actionClearPictureItem:(UIBarButtonItem *)sender {
    
    [self.drawingView.points removeAllObjects];
    [self.drawingView setNeedsDisplay];
}
@end

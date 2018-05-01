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
- (IBAction)actionColorButton:(UIButton *)sender;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.drawingView.points = [NSMutableArray array];
    
    UITapGestureRecognizer* tapGesture = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(handleTap:)];
    
    [self.view addGestureRecognizer:tapGesture];
    
    UIPanGestureRecognizer* panGesture = [[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(handlePan:)];
    
    [self.view addGestureRecognizer:panGesture];
    
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

-(void)handlePan:(UIPanGestureRecognizer*)panGesture{
    
    CGPoint point =  [panGesture locationInView:self.drawingView];
    
    NSValue* value = [NSValue valueWithCGPoint:point];
    
    [self.drawingView.points addObject:value];
    
    [self.drawingView setNeedsDisplay];
    
}


#pragma mark - Actions


- (IBAction)actionClearPictureItem:(UIBarButtonItem *)sender {
    
    [self.drawingView.points removeAllObjects];
    [self.drawingView setNeedsDisplay];
}

- (IBAction)actionColorButton:(UIButton *)sender {
    
    
    switch (sender.tag) {
            
        case 0:
            self.drawingView.currentColor = [UIColor colorWithRed:250.0/255.
                                              green:255.0/255.
                                               blue:84.0/255.
                                              alpha:1.0f];
            break;
            
        case 1:
            self.drawingView.currentColor = [UIColor colorWithRed:0.0/255.
                                              green:122.0/255.
                                               blue:255.0/255.
                                              alpha:1.0f];
            break;
            
        case 2:
            self.drawingView.currentColor = [UIColor colorWithRed:255.0/255.
                                              green:91.0/255.
                                               blue:208.0/255.
                                              alpha:1.0f];
            break;
            
        case 3:
            self.drawingView.currentColor = [UIColor colorWithRed:0.0/255.
                                              green:0.0/255.
                                               blue:0.0/255.
                                              alpha:1.0f];
            break;
            
        case 4:
            self.drawingView.currentColor = [UIColor colorWithRed:255.0/255.
                                              green:173.0/255.
                                               blue:40.0/255.
                                              alpha:1.0f];
            break;
            
        case 5:
            self.drawingView.currentColor = [UIColor colorWithRed:255.0/255.
                                              green:91.0/255.
                                               blue:74.0/255.
                                              alpha:1.0f];
            break;
            
        case 6:
            self.drawingView.currentColor = [UIColor colorWithRed:88.0/255.
                                              green:255.0/255.
                                               blue:80.0/255.
                                              alpha:1.0f];
            break;
            
    
    }
    
}


@end

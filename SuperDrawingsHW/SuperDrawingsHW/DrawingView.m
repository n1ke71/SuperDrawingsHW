//
//  DrawingView.m
//  SuperDrawingsHW
//
//  Created by Ivan Kozaderov on 27.04.2018.
//  Copyright © 2018 n1ke71. All rights reserved.
//

#import "DrawingView.h"

@implementation DrawingView


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
    
    NSLog(@"Drawing Rect");
    
    for (NSValue* value in self.points) {
        
        CGPoint point = value.CGPointValue;
        CGContextRef ctxt = UIGraphicsGetCurrentContext();
        CGContextSetFillColorWithColor(ctxt, self.currentColor.CGColor);
        CGContextFillRect(ctxt, CGRectMake(point.x, point.y, 10, 10));
        CGContextFillPath(ctxt);
    }
    
}


@end

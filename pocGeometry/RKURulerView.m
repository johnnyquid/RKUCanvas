//
//  RKURulerView.m
//  pocGeometry
//
//  Created by Juwe Takeheshi on 11/9/11.
//  Copyright (c) 2011 Emlink. All rights reserved.
//

#import "RKURulerView.h"

@implementation RKURulerView

- (id)initWithFrame:(CGRect)frame {

	self = [super initWithFrame:frame];

	if (self) {

		self.backgroundColor = [UIColor yellowColor];
    }

    return self;
}


- (void)drawRect:(CGRect)rect {

	if (isLandscape) {

		CGContextRef context = UIGraphicsGetCurrentContext();
		
		//Draw Lines
		CGFloat purple[4] = {0.4f, 0.4f, 0.4f, 0.4f};
		CGContextSetStrokeColor(context, purple);
		CGContextBeginPath(context);
		
		CGContextMoveToPoint(context, 0.0f, 50.0f);
		CGContextAddLineToPoint(context, 200.0f, 50.0f);
		
		CGContextStrokePath(context);
	}

	else {

		CGContextRef context = UIGraphicsGetCurrentContext();
		
		//Draw Lines
		CGFloat purple[4] = {0.4f, 0.4f, 0.4f, 0.4f};
		CGContextSetStrokeColor(context, purple);
		CGContextBeginPath(context);
		
		CGContextMoveToPoint(context, 50.0f, 0.0f);
		CGContextAddLineToPoint(context, 50.0f, 200.0f);
		
		CGContextStrokePath(context);
	}
}

@end

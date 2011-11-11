//
//  RKURulerView.m
//  pocGeometry
//
//  Created by Juwe Takeheshi on 11/9/11.
//  Copyright (c) 2011 Emlink. All rights reserved.
//

#import "RKURulerView.h"

@implementation RKURulerView

@synthesize isLandscape = _isLandscape;

- (id)initWithFrame:(CGRect)frame {

	self = [super initWithFrame:frame];

	if (self) {

		self.backgroundColor = [UIColor yellowColor];
    }

    return self;
}


- (void)drawRect:(CGRect)rect {

	if (_isLandscape) {

		CGFloat mainMeasure = 56.8f;
		NSInteger numberOfSections = (self.frame.size.width / mainMeasure);
		CGFloat xPosition = mainMeasure;

		CGContextRef context = UIGraphicsGetCurrentContext();
		
		for (NSInteger i = 0; i < numberOfSections; i++) {

			CGFloat gray[4] = {0.4f, 0.4f, 0.4f, 0.9f};
			CGContextSetStrokeColor(context, gray);
			CGContextBeginPath(context);
			
			CGContextMoveToPoint(context, xPosition, 0.0f);
			CGContextAddLineToPoint(context, xPosition, 15.0f);
			
			CGContextStrokePath(context);
			
			xPosition += mainMeasure;
		}
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

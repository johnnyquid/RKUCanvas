//
//  RKURulerView.m
//  pocGeometry
//
//  Created by Juwe Takeheshi on 11/9/11.
//  Copyright (c) 2011 Emlink. All rights reserved.
//

#import "RKURulerView.h"

@implementation RKURulerView

- (id)initWithFrame:(CGRect)frame andBool:(BOOL)isViewLandscape {

	self = [super initWithFrame:frame];

	if (self) {

		isLandscape = isViewLandscape;
    }

    return self;
}


- (void)drawRect:(CGRect)rect {

	CGFloat mainMeasure = 28.4f;
	NSInteger numberOfSections;
	CGFloat gray[4] = {0.4f, 0.4f, 0.4f, 0.9f};

	if (isLandscape) {

		numberOfSections = (self.frame.size.width / mainMeasure) + 1;
		CGFloat xPosition = mainMeasure;
		CGContextRef context = UIGraphicsGetCurrentContext();

		for (NSInteger i = 0; i < numberOfSections; i++) {

			CGFloat subMeasure = (mainMeasure / 5) - 1;
			CGFloat xxPosition = (xPosition + subMeasure) - mainMeasure;

			for (NSInteger j = 0; j < subMeasure; j++) {

				CGContextSetStrokeColor(context, gray);
				CGContextBeginPath(context);
				CGContextMoveToPoint(context, xxPosition, 0.0f);
				CGContextAddLineToPoint(context, xxPosition, 8.0f);
				CGContextStrokePath(context);
				
				xxPosition += subMeasure;
			}

			CGContextSetStrokeColor(context, gray);
			CGContextBeginPath(context);
			CGContextMoveToPoint(context, xPosition, 0.0f);
			CGContextAddLineToPoint(context, xPosition, 16.0f);
			CGContextStrokePath(context);

			xPosition += mainMeasure;
		}
	}

	else {

		numberOfSections = (self.frame.size.height / mainMeasure) + 1;
		CGFloat yPosition = mainMeasure;
		CGContextRef context = UIGraphicsGetCurrentContext();

		for (NSInteger i = 0; i < numberOfSections; i++) {

			CGFloat subMeasure = (mainMeasure / 5) - 1;
			CGFloat yyPosition = (yPosition + subMeasure) - mainMeasure;
			
			for (NSInteger j = 0; j < subMeasure; j++) {
				
				CGContextSetStrokeColor(context, gray);
				CGContextBeginPath(context);
				CGContextMoveToPoint(context, 0.0f, yyPosition);
				CGContextAddLineToPoint(context, 8.0f, yyPosition);
				CGContextStrokePath(context);
				
				yyPosition += subMeasure;
			}
			
			CGContextSetStrokeColor(context, gray);
			CGContextBeginPath(context);
			CGContextMoveToPoint(context, 0.0f, yPosition);
			CGContextAddLineToPoint(context, 15.0f, yPosition);
			CGContextStrokePath(context);

			yPosition += mainMeasure;
		}
	}
}

@end

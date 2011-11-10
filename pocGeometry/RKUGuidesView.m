//
//  RKUGuidesView.m
//  pocGeometry
//
//  Created by Juwe Takeheshi on 11/10/11.
//  Copyright (c) 2011 Emlink. All rights reserved.
//

#import "RKUGuidesView.h"

@implementation RKUGuidesView

- (id)initWithFrame:(CGRect)frame andStartCoordinates:(NSArray *)startCoordinates andEndCoordinates:(NSArray *)endCoordinates {

	self = [super initWithFrame:frame];

	if (self) {

		
    }

	return self;
}


- (void)drawRect:(CGRect)rect {

	CGContextRef context = UIGraphicsGetCurrentContext();

	//Draw Lines
	CGFloat purple[4] = {0.9f, 0.1f, 0.8f, 0.4f};
	CGContextSetStrokeColor(context, purple);
	CGContextBeginPath(context);
	
	CGContextMoveToPoint(context, 0.0f, 100.0f);
	CGContextAddLineToPoint(context, [self frame].size.width, 100.0f);
	
	CGContextStrokePath(context);
}


@end

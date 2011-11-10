//
//  CanvasViewController.m
//  pocGeometry
//
//  Created by Juwe Takeheshi on 11/9/11.
//  Copyright (c) 2011 Emlink. All rights reserved.
//

#import "CanvasViewController.h"
#import "RKUGuidesView.h"
#import <QuartzCore/QuartzCore.h>
#import "RKURulerView.h"

@implementation CanvasViewController

@synthesize prescriptionView;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {

	self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];

	if (self) {

		// Custom initialization
	}

	return self;
}


- (void)didReceiveMemoryWarning {

	// Releases the view if it doesn't have a superview.
	[super didReceiveMemoryWarning];

	// Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

/*
// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView
{
}
*/


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {

	[super viewDidLoad];

	[self setGuidesView];
	[self setRulers];
}


- (void)setGuidesSource {

	NSValue *firstGuideStart = [NSValue valueWithCGPoint:CGPointMake(0.0f, 100.0f)];
	NSValue *firstGuideEnd = [NSValue valueWithCGPoint:CGPointMake(prescriptionView.frame.size.width, 100.0f)];

	NSValue *secondGuideStart = [NSValue valueWithCGPoint:CGPointMake(0.0f, 200.0f)];
	NSValue *secondGuideEnd = [NSValue valueWithCGPoint:CGPointMake(prescriptionView.frame.size.width, 200.0f)];

	NSValue *thirdGuideStart = [NSValue valueWithCGPoint:CGPointMake(0.0f, 300.0f)];
	NSValue *thirdGuideEnd = [NSValue valueWithCGPoint:CGPointMake(prescriptionView.frame.size.width, 300.0f)];

	NSValue *fourthGuideStart = [NSValue valueWithCGPoint:CGPointMake(0.0f, 400.0f)];
	NSValue *fourthGuideEnd = [NSValue valueWithCGPoint:CGPointMake(prescriptionView.frame.size.width, 400.0f)];

	NSValue *fifthGuideStart = [NSValue valueWithCGPoint:CGPointMake(200.0f, 0.0f)];
	NSValue *fifthGuideEnd = [NSValue valueWithCGPoint:CGPointMake(200.0f, prescriptionView.frame.size.height)];

	NSValue *sixthGuideStart = [NSValue valueWithCGPoint:CGPointMake(400.0f, 0.0)];
	NSValue *sixthGuideEnd = [NSValue valueWithCGPoint:CGPointMake(400.0f, prescriptionView.frame.size.height)];

	canvasStartGuidesCoordinates = [[NSMutableArray alloc] initWithObjects:firstGuideStart, secondGuideStart, thirdGuideStart, fourthGuideStart, fifthGuideStart, sixthGuideStart, nil];
	
	canvasStartGuidesCoordinates = [[NSMutableArray alloc] initWithObjects:firstGuideEnd, secondGuideEnd, thirdGuideEnd, fourthGuideEnd, fifthGuideEnd, sixthGuideEnd, nil];
	
}


- (void)setRulers {

	verticalRulerView = [[RKURulerView alloc] initWithFrame:CGRectMake(prescriptionView.frame.size.width + prescriptionView.frame.origin.x + 30 , prescriptionView.frame.origin.y - 20, 20, prescriptionView.frame.size.height)];
	[[self view] addSubview:verticalRulerView];
}


- (void)setGuidesView {

	guidesView = [[RKUGuidesView alloc] initWithFrame:CGRectMake(0, 0, prescriptionView.frame.size.width + 15, prescriptionView.frame.size.height)];
	[guidesView setBackgroundColor:[UIColor clearColor]];
	[guidesView setAlpha:0.6f];
	[prescriptionView addSubview:guidesView];
}


- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
	return YES;
}


- (IBAction)printPrescription:(id)sender {

	// Creates a mutable data object for updating with binary data, like a byte array
    NSMutableData *pdfData = [NSMutableData data];
	
    // Points the pdf converter to the mutable data object and to the UIView to be converted
    UIGraphicsBeginPDFContextToData(pdfData, prescriptionView.bounds, nil);
    UIGraphicsBeginPDFPage();
    CGContextRef pdfContext = UIGraphicsGetCurrentContext();
	
	
    // draws rect to the view and thus this is captured by UIGraphicsBeginPDFContextToData
	
    [prescriptionView.layer renderInContext:pdfContext];
	
    // remove PDF rendering context
    UIGraphicsEndPDFContext();
	
    // Retrieves the document directories from the iOS device
    NSArray* documentDirectories = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask,YES);
	
    NSString* documentDirectory = [documentDirectories objectAtIndex:0];
    NSString* documentDirectoryFilename = [documentDirectory stringByAppendingPathComponent:@"recetiux"];
	
    // instructs the mutable data object to write its context to a file on disk
    [pdfData writeToFile:documentDirectoryFilename atomically:YES];
    NSLog(@"documentDirectoryFileName: %@",documentDirectoryFilename);
}


@end

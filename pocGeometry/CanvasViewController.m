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
@synthesize selectedLayer;
@synthesize barComponentsLayers;
@synthesize isComponentInPrescripcionView;
@synthesize lastPointInPrescripcionView;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {

	self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];

	if (self) {
		UITapGestureRecognizer *singleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleSingleTap:)];
		singleTap.numberOfTapsRequired = 1;
		[self.view addGestureRecognizer:singleTap];

		
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
	[self setGuidesSource];
	[self addBarLayers];
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
	
	canvasEndGuidesCoordinates = [[NSMutableArray alloc] initWithObjects:firstGuideEnd, secondGuideEnd, thirdGuideEnd, fourthGuideEnd, fifthGuideEnd, sixthGuideEnd, nil];

	guidesView = [[RKUGuidesView alloc] initWithFrame:CGRectMake(0, 0, prescriptionView.frame.size.width + 15, prescriptionView.frame.size.height) andStartCoordinates:canvasStartGuidesCoordinates andEndCoordinates:canvasEndGuidesCoordinates];
	[guidesView setBackgroundColor:[UIColor clearColor]];
	[prescriptionView addSubview:guidesView];
}

- (void)addBarLayers
{
	TextPrescriptionComponent *componentBlue=[[TextPrescriptionComponent alloc]init];
	[componentBlue setIsEditionEnabled:NO];
	
	TextPrescriptionComponent *componentRed=[[TextPrescriptionComponent alloc]init];
	[componentRed setIsEditionEnabled:NO];
	
	CALayer *mainLayer=[[CALayer alloc]init];
	
	[mainLayer setFrame:CGRectMake(10, 10, 150, 80)];
	// Make half-transparent red the background color for the layer
	UIColor *reddish = [UIColor colorWithRed:1.0 green:0.0 blue:0.0 alpha:0.5];
	[mainLayer setValue:componentRed forKey:[mainLayer description]];
	
	// Get a CGColor object with the same color values
	CGColorRef cgReddish = [reddish CGColor];
	[mainLayer setBackgroundColor:cgReddish];
	
	CALayer *mainLayer2=[[CALayer alloc]init];
	[mainLayer2 setFrame:CGRectMake(10, 100, 150, 80)];
	// Make half-transparent red the background color for the layer
	UIColor *bluish = [UIColor colorWithRed:0.0 green:0.0 blue:1.0 alpha:0.5];
	[mainLayer2 setValue:componentBlue forKey:[mainLayer2 description]];
	
	
	
	
	// Get a CGColor object with the same color values
	CGColorRef cgBluedish = [bluish CGColor];
	[mainLayer2 setBackgroundColor:cgBluedish];
	
	
	[self.view.layer addSublayer:mainLayer2];
	[self.view.layer addSublayer:mainLayer];
	
}
- (void)setRulers {

	verticalRulerView = [[RKURulerView alloc] initWithFrame:CGRectMake(prescriptionView.frame.size.width + prescriptionView.frame.origin.x + 30, 
																	   prescriptionView.frame.origin.y - 20, 
																	   20, 
																	   prescriptionView.frame.size.height)];
	
	horizontalRulerView = [[RKURulerView alloc] initWithFrame:CGRectMake(prescriptionView.frame.origin.x, 
																		 prescriptionView.frame.origin.y + prescriptionView.frame.size.height, 
																		 prescriptionView.frame.size.width, 
																		 20)];
	[horizontalRulerView setIsLandscape:YES];

	[[self view] addSubview:horizontalRulerView];
	[[self view] addSubview:verticalRulerView];
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

- (IBAction)handleSingleTap:(UIGestureRecognizer *)sender {
    

	CALayer *topLayer=[self selectedLayer];
	//CGPoint tapPoint = [sender locationInView:sender.view];
	
	if(topLayer){
		[self setSelectedLayer:topLayer];
		TextPrescriptionComponent *currentComponentText=[topLayer valueForKey:[topLayer description]];
		
		
		if ([currentComponentText isEditionEnabled]) {
			
			NSArray *layers = topLayer.sublayers;
			for (CALayer *textLayer in layers) {
				[textLayer removeFromSuperlayer];
			}
			[currentComponentText setIsEditionEnabled:NO];
			[topLayer setValue:currentComponentText forKey:[topLayer description]];
		}
		
		else{
			
			CALayer *markResize=[[CALayer alloc]init];
			[markResize setFrame:CGRectMake(topLayer.frame.size.width-40,topLayer.frame.size.height-40, 40, 40)];
			UIColor *greenish = [UIColor colorWithRed:0.0 green:1.0 blue:0.0 alpha:0.5];
		
			// Get a CGColor object with the same color values
			CGColorRef CGgreenish = [greenish CGColor];
			[markResize setBackgroundColor:CGgreenish];
			[topLayer addSublayer:markResize];
			[currentComponentText setIsEditionEnabled:YES];
			[topLayer setValue:currentComponentText forKey:[topLayer description]];
			
			
		}
		
	}
	
	
	[self setSelectedLayer:nil];
    
}

-(void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
	
	CGPoint p = [(UITouch*)[touches anyObject] locationInView:self.view];
	CALayer *topLayer;
    for (CALayer *layer in self.view.layer.sublayers) {
        if ([layer containsPoint:[self.view.layer convertPoint:p toLayer:layer]]) {
            // do something
			
            //layer.opacity = 0.5;
			topLayer=layer;
        }
    }
	
	
	if(topLayer && [[topLayer valueForKey:[topLayer description]]isKindOfClass:[TextPrescriptionComponent class]]){

			
	    [self setSelectedLayer:topLayer];
		NSLog(@"Layer ID Valida:%@",[topLayer description]);
	}
	
}


- (void)touchesMoved:(NSSet *)touches
           withEvent:(UIEvent *)event
{

	CALayer *topLayer=[self selectedLayer];
	if(topLayer){
		
		
		CGPoint currentPoint = [(UITouch*)[touches anyObject] locationInView:self.view];
		CALayer *prescriptionLayer=prescriptionView.layer;
		
		if ([prescriptionLayer containsPoint:[self.view.layer convertPoint:currentPoint toLayer:prescriptionLayer]]) {
			// do something
			NSLog(@"IM in the prescription");
			CGPoint currentPointInPrescription = [(UITouch*)[touches anyObject] locationInView:[self prescriptionView]];
			[self setIsComponentInPrescripcionView:YES];
			CGPoint correctPointInPrescription=CGPointMake(currentPointInPrescription.x-(topLayer.frame.size.width)/2, currentPointInPrescription.y-(topLayer.frame.size.height)/2);
			[self setLastPointInPrescripcionView:correctPointInPrescription];
			//layer.opacity = 0.5;
			//printLayer=layer;
		}
		else{
			[self setIsComponentInPrescripcionView:NO];
		}
			UITouch *t = [touches anyObject];
		CGPoint p = [t locationInView:self.view];
		
		//NSLog(@"Point of finger: %f , %f",p.x,p.y);
		[CATransaction begin];
		[CATransaction setDisableActions:YES]; 
		[topLayer setPosition:p]; 
		[CATransaction commit];
		
	}	
}

-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
	NSLog(@"Terminando el touch");
	if ([self isComponentInPrescripcionView]) {
	    //[self.view.layer addSublayer:[self selectedLayer]];
		NSLog(@"El frame de la vista de prscripcion: %f,%f",[self prescriptionView].frame.origin.x,[self prescriptionView].frame.origin.y);
		NSLog(@"Debo agregar a la subview, en el punto: %f %f",[self lastPointInPrescripcionView].x,[self lastPointInPrescripcionView].y);
		CALayer *layerForPrescription=[self selectedLayer];
		
		[[self selectedLayer] removeFromSuperlayer];
		[selectedLayer setFrame:CGRectMake([self lastPointInPrescripcionView].x, [self lastPointInPrescripcionView].y,layerForPrescription.frame.size.width,layerForPrescription.frame.size.height)];
		[[[self prescriptionView] layer]addSublayer:selectedLayer];
	}
	[self setSelectedLayer:nil];
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

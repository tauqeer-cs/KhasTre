//
//  Constants.h
 
//
//  Created by Muhammad Kamran on 6/12/12.
//  Copyright (c) 2013 Centric Source. All rights reserved.
//

// LTF designs define

#define baseServiceUrl @"http://210.2.128.182/media_hub"
#define imageDownloadPrefix @"http://www.lemonoverflow.com/sandbox/opencart/image/"

#define getFunchtionName @"function_news.php"
#define IS_IOS_6 ([[[UIDevice currentDevice] systemVersion] floatValue])
#define IS_IPHONE ( [[[UIDevice currentDevice] model] isEqualToString:@"iPhone"]  || [[[UIDevice currentDevice] model] isEqualToString:@"iPhone Simulator"])
#define IS_IPad ( [[[UIDevice currentDevice] model] isEqualToString:@"iPad"]  || [[[UIDevice currentDevice] model] isEqualToString:@"iPad Simulator"])
#define IS_IPOD   ( [[[UIDevice currentDevice ] model] isEqualToString:@"iPod touch"] )
#define IS_HEIGHT_GTE_568 [[UIScreen mainScreen ] bounds].size.height >= 568.0f
#define IS_HEIGHT_GTE_4 [[UIScreen mainScreen ] bounds].size.height == 480.0f

#define IS_IPHONE_5 ( IS_IPHONE && IS_HEIGHT_GTE_568 )
#define IS_IPHONE_4S ( IS_IPHONE && IS_HEIGHT_GTE_4 )

#define IPHONE4S_RATIO 1.252
#define IPHONE5_RATIO 1.038

#define   IsIphone5     ( fabs( ( double )[ [ UIScreen mainScreen ] bounds ].size.height - ( double )568 ) < DBL_EPSILON )

//// Local SERVICE URLs
 
#define IPHONE4S @"iphone4s"
#define IPHONE5 @"iphone5"
#define IPAD @"ipad"
#define IPAD_RETINA @"ipadretina"
#define HeadingFontName @"HelveticaNeue-CondensedBold"

#define ASSET_BY_SCREEN_HEIGHT(regular, longScreen) (([[UIScreen mainScreen] bounds].size.height <= 480.0) ? regular : longScreen)

#define INTERNET_INAVAILABLE_MSG @"Internet has not been detected on your device. Please check your internet settings again to proceed!"
#define SOMETHING_WENT_WRONG_MSG @"Something went wrong while fetching your request. Please try again later!"
#define FEATURE_FEED_ERROR_MSG @"Something went wrong while fetching the Kurfuffls. Please try again later"
#define FEED_CELL_CUSTOM_MSG @"Lorem ipsum dolor sit er elit lamet, consectetaur cillium adipisicing pecu, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua."
#define LOCATION_OFF_QIBLA @"Turn on your Location Service for getting corrent direction."
#define LOCATION_OFF_PLAYER @"Turn on your Location Service for getting accurate Player Timings."

// Text View Sizes
#define FEEDCELL_TEXT_VIEW_SIZE CGSizeMake(205, 12)

// Color From Hex
#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

#define Rgb2UIColor(r, g, b)  [UIColor colorWithRed:((r) / 255.0) green:((g) / 255.0) blue:((b) / 255.0) alpha:1.0]

//constants for FindingQiblaViewController
#define toRad(X) (X*M_PI/180.0)
#define toDeg(X) (X*180.0/M_PI)
#define FONT_SIZE 14.0f
#define CELL_CONTENT_WIDTH 320.0f
#define CELL_CONTENT_MARGIN 10.0f

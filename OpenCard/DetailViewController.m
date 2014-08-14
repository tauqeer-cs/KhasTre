//
//  DetailViewController.m
//  OpenCard
//
//  Created by Tauqeer Ahmed on 8/14/14.
//  Copyright (c) 2014 Merrycode. All rights reserved.
//

#import "DetailViewController.h"
#import "AFNetworking.h"
#import "UIImageView+AFNetworking.h"
#import "AsyncImageDownloader.h"
#import "Constants.h"
#import "Product.h"
#import "ImageGallery.h"

@interface DetailViewController ()

@property (weak, nonatomic) IBOutlet UIScrollView *detailScroll;

@end

@implementation DetailViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    NSLog(@"%d",self.productId);
    
    NSURL *baseURL = [NSURL URLWithString:@"http://lemonoverflow.com/sandbox/opencart/ocservice/"];
    
    NSDictionary *parameters = @{
                                 @"command": @"getproduct",
                                 @"id": [NSString stringWithFormat:@"%d",self.productId]
                                 };
    
    
    
    AFHTTPSessionManager *manager = [[AFHTTPSessionManager alloc] initWithBaseURL:baseURL];
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    [manager GET:@"json.php" parameters:parameters success:^(NSURLSessionDataTask *task, id responseObject){
        
        NSLog(@"%@",responseObject);
        
        NSMutableArray *allImages = [NSMutableArray new];
        
        NSArray *images = [responseObject objectForKey:@"images"];
        
        
        NSMutableArray *downloadedImages = [NSMutableArray new];
        
        __block int i = 0;
        for (NSString *currentLink in images)
        {
            
            
            [[[AsyncImageDownloader alloc] initWithMediaURL:[imageDownloadPrefix stringByAppendingString:currentLink]
                                               successBlock:^(UIImage *image)  {
                
                [downloadedImages addObject:image];  i++;
                        
                 if ([images count] == i) {
                
                     ImageGallery *imageGallery = [[ImageGallery alloc] initWithImages:downloadedImages] ;
                     [self.detailScroll addSubview:imageGallery];

                     
                     NSLog(@"d");
                     
                }
                                                   
                
            } failBlock:^(NSError *error) {
                NSLog(@"%@",error);
                
                
            }] startDownload];
        }
        
        NSLog(@"%@",[responseObject objectForKey:@"description"]);
        
        
        
    }
         failure:^(NSURLSessionDataTask *task, NSError *error){
             
             
             NSLog(@"%@",error);
             
             
         }];
    
    
}



@end

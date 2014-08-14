//
//  ViewController.m
//  OpenCard
//
//  Created by Tauqeer Ahmed on 8/8/14.
//  Copyright (c) 2014 Merrycode. All rights reserved.
//

#import "ViewController.h"
#import "Constants.h"
#import "Product.h"
#import "CustomTableViewCell.h"
#import "DetailViewController.h"

@interface ViewController ()

@property (nonatomic,strong) NSMutableArray *productArray;
@property (nonatomic,strong) NSMutableArray *resultArray;
@property (weak, nonatomic) IBOutlet UITableView *productTable;
@property(nonatomic, strong) UISearchDisplayController *strongSearchDisplayController;

@end

@implementation ViewController

int selectedId;
-(NSMutableArray *)productArray{
    
    if(!_productArray) _productArray = [[NSMutableArray alloc]init];
    return _productArray;
}

-(NSMutableArray *)resultArray{
    
    if(!_resultArray) _resultArray = [[NSMutableArray alloc]init];
    return _resultArray;
}
- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    if (animated) {
        [self.productTable flashScrollIndicators];
    }
}

- (void)viewDidLoad
{
   [super viewDidLoad];

    NSURL *baseURL = [NSURL URLWithString:@"http://lemonoverflow.com/sandbox/opencart/ocservice/"];
    
    NSDictionary *parameters = @{@"command": @"getallproducts"};
    
    
    AFHTTPSessionManager *manager = [[AFHTTPSessionManager alloc] initWithBaseURL:baseURL];
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    
    [manager GET:@"json.php" parameters:parameters success:^(NSURLSessionDataTask *task, id responseObject){
        
        for (id currentNode in responseObject) {
            
            NSLog(@"%@",currentNode);
            Product *currentProduct = [Product new];
            currentProduct.productId = [[currentNode objectForKey:@"product_id"] integerValue];
            
            currentProduct.location = [currentNode objectForKey:@"location"];
            currentProduct.name = [currentNode objectForKey:@"name"];
            currentProduct.quantity = [[currentNode objectForKey:@"quantity"] intValue];
            currentProduct.model = [currentNode objectForKey:@"model"];
            currentProduct.stockStatusId= [[currentNode objectForKey:@"stock_status_id"] intValue];
            currentProduct.imageLink = [currentNode objectForKey:@"image"];
            currentProduct.manufacturerId = [[currentNode objectForKey:@"manufacturer_id"] intValue];
            currentProduct.shipping = [[currentNode objectForKey:@"shipping"] intValue];
            currentProduct.price = [currentNode objectForKey:@"price"];
            currentProduct.points = [[currentNode objectForKey:@"points"] intValue];
            
            [self.productArray addObject:currentProduct];
        
        }
        
        [self.productTable reloadData];
        
        
    }
          failure:^(NSURLSessionDataTask *task, NSError *error){
              
              
              NSLog(@"%@",error);
              
              
          }];
    
}

#pragma mark - TableView DataSource/Delegate

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{


    if (tableView == self.productTable) {
      return [self.productArray count];
    }else{
        return [self.resultArray count];
    }


    
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 95;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    static NSString *CellIdentifier = @"cell";
    CustomTableViewCell *cell = (CustomTableViewCell *)[self.productTable dequeueReusableCellWithIdentifier:CellIdentifier];
    
    
    if (cell == nil) {
        cell = [[CustomTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
      Product *currentProduct;
   
    if (tableView == self.productTable) {
        currentProduct = [self.productArray objectAtIndex:indexPath.row];
        NSLog(@"d");
    }else{
        
       
        if ([self.resultArray count] > 0)
        {
        currentProduct = [self.resultArray objectAtIndex:indexPath.row];
            
        }
        else
            return cell;
    }
  
    cell.lblProductName.text = currentProduct.name;
    cell.lblPrice.text = currentProduct.price;
 
    NSString *imageLink = [imageDownloadPrefix stringByAppendingString:currentProduct.imageLink];
    
    
    cell.productImage.imageURL = [NSURL URLWithString:imageLink];
    
    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{

    Product *tmp = [self.productArray objectAtIndex:indexPath.row];
    
    selectedId = tmp.productId;
    
    [self goToDetails];
    
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{

    DetailViewController *destination = segue.destinationViewController;
    
    destination.productId = selectedId;
    
}

-(void)goToDetails{
    
    [self performSegueWithIdentifier:@"segueDetail" sender:self];
}


- (void)scrollTableViewToSearchBarAnimated:(BOOL)animated
{
    NSAssert(YES, @"This method should be handled by a subclass!");
}
- (void)filterContentForSearchText:(NSString*)searchText scope:(NSString*)scope
{
    
    self.resultArray = nil;

    for (id currentNode in self.productArray ) {
        
         Product *currentProduct = currentNode;
        

        NSUInteger searchOptions = NSCaseInsensitiveSearch | NSDiacriticInsensitiveSearch;
        NSRange productNameRange = NSMakeRange(0, currentProduct.name.length);
        
        NSLog(@"%@",searchText);
                NSLog(@"%@",currentProduct.name);
        NSRange foundRange = [currentProduct.name rangeOfString:searchText options:searchOptions range:productNameRange];

        if (foundRange.length > 0)
        {
            [self.resultArray addObject:currentProduct];
        }
    }
    
    
    //searchResults = [recipes filteredArrayUsingPredicate:resultPredicate];
}

- (BOOL)searchDisplayController:(UISearchDisplayController *)controller shouldReloadTableForSearchString:(NSString *)searchString
{
    [self filterContentForSearchText:searchString
                               scope:[[self.searchDisplayController.searchBar scopeButtonTitles]
                                      objectAtIndex:[self.searchDisplayController.searchBar
                                                     selectedScopeButtonIndex]]];
    
    return YES;
}




@end

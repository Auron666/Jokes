//
//  MainViewController.m
//  Jokes
//
//  Created by Benjamin Kolosov on 02/06/2018.
//  Copyright © 2018 Benjamin Kolosov. All rights reserved.
//

#import "MainViewController.h"
#import "NetworkService.h"

@interface MainViewController ()
@property (nonatomic, strong) UILabel *jokesText;
@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"Jokes";
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.jokesText = [[UILabel alloc] init];
    self.jokesText.frame = CGRectMake(0, self.view.frame.size.height / 2.5, self.view.frame.size.width, 150);
    self.jokesText.text = @"Jokes";
    self.jokesText.numberOfLines = 0;
    self.jokesText.lineBreakMode = NSLineBreakByWordWrapping;
    self.jokesText.textAlignment = NSTextAlignmentCenter;
    [self.jokesText setBackgroundColor:[UIColor greenColor]];
    
    [self.view addSubview:self.jokesText];
   
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemRefresh target:self action:@selector(getUpdateJoke:)];
}

- (void)getUpdateJoke:(id)sender{
    NSURL *url = [NSURL URLWithString:@"http://api.icndb.com/jokes/random"];
    
    
    NetworkService *networkService = [[NetworkService alloc] init];
    [networkService receiveData:url completion:^(NSData *data) {
        NSError *error = nil;
        
        NSDictionary *dictData = [NSJSONSerialization JSONObjectWithData:data options:0 error:&error];
        
        if(error){
            NSLog(@"Error = %@", error);
        }
        
        NSString *type = [dictData valueForKey:@"type"];
        
        NSLog(@"Type = %@", type);
        
        NSDictionary *categories = [NSDictionary dictionaryWithDictionary:[dictData valueForKey:@"value"]];
        NSString *joke = [categories valueForKey:@"joke"];
        
        dispatch_async(dispatch_get_main_queue(), ^{
            self.jokesText.text = joke;
        });
        
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end

//
//  LetraAViewController.m
//  Navigation
//
//  Created by Vinicius Miana on 2/23/14.
//  Copyright (c) 2014 Vinicius Miana. All rights reserved.
//

#import "LetraAViewController.h"
#import "Palavra.h"

@implementation LetraAViewController

@synthesize letra;

 int contLetra = 0;

-(void) viewDidLoad {
    
    //UIImageView imgA = [UIImageView alloc] ini
    //Band *a = [[Band alloc] initWithName:@"Arctic Monkeys" ima];
    
    
    [super viewDidLoad];
    letra = [NSString stringWithFormat:@"%c",contLetra+65];
    
    if(contLetra==26){
        [self.navigationController popToRootViewControllerAnimated:true];
        contLetra = 0;
    }
    

    
    self.title = letra;
    
    UIBarButtonItem *next = [[UIBarButtonItem alloc]
                             initWithBarButtonSystemItem:UIBarButtonSystemItemFastForward target:self action:@selector(next:)];
    self.navigationItem.rightBarButtonItem=next;
    
    UIBarButtonItem *back = [[UIBarButtonItem alloc] initWithTitle:@"Back" style:UIBarButtonItemStyleBordered target:self action:@selector(back:)];
    self.navigationItem.hidesBackButton = YES;
    self.navigationItem.leftBarButtonItem = back;
    
    UIButton *botao = [UIButton
                                        buttonWithType:UIButtonTypeSystem];
    [botao
     setTitle:@"Mostre uma palavra, uma figura e leia a palavra ao apertar um botao"
     forState:UIControlStateNormal];
    [botao sizeToFit];
    botao.center = self.view.center;
    
    [self.view addSubview:botao];
    
    
}

-(void)next:(id)sender {
    LetraAViewController *proximo = [[LetraAViewController alloc]
                                              initWithNibName:nil
                                            bundle:NULL];
    [self.navigationController pushViewController:proximo
                                         animated:YES];
    
    
    contLetra++;
    NSLog(@"%i",contLetra);
    
}

-(void)back:(id)sender{
    if(contLetra>=1){
        [self.navigationController popViewControllerAnimated:YES];
        contLetra--;
        NSLog(@"%i",contLetra);
    }
}

@end

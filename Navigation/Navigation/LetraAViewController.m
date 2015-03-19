//
//  LetraAViewController.m
//  Navigation
//
//  Created by Vinicius Miana on 2/23/14.
//  Copyright (c) 2014 Vinicius Miana. All rights reserved.
//

#import "LetraAViewController.h"
#import "Palavras.h"
#import "Palavra.h"

@implementation LetraAViewController

@synthesize letra, arrayPalavras;

int contLetra = 0;


-(void) viewDidLoad {
    
    arrayPalavras = [Palavras getInstance];
    
    [super viewDidLoad];
    letra = [NSString stringWithFormat:@"%c",contLetra+65];
    
    if(contLetra==26){
        [self.navigationController popToRootViewControllerAnimated:true];
        contLetra = 0;
    }
    
    self.navigationItem.title = letra;
    
    UIBarButtonItem *next = [[UIBarButtonItem alloc]
                             initWithBarButtonSystemItem:UIBarButtonSystemItemFastForward target:self action:@selector(next:)];
    self.navigationItem.rightBarButtonItem=next;
    
    UIBarButtonItem *back = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemRewind target:self action:@selector(back:)];
    self.navigationItem.hidesBackButton = YES;
    self.navigationItem.leftBarButtonItem = back;
    if(contLetra==0){
        back.enabled = FALSE;
    }
    
    UIButton *botao = [UIButton buttonWithType:UIButtonTypeSystem];
    NSString *texto = [[arrayPalavras.palavras objectAtIndex:contLetra] palavra];
    
    [botao
     setTitle:texto
     forState:UIControlStateNormal];
    [botao sizeToFit];
    botao.center = CGPointMake(self.view.frame.size.width/2,100);
    
    UIImageView *imagemview = [[UIImageView alloc] initWithFrame:CGRectMake(60.0f, 200.0f, 200, 200)];
    imagemview.image = [[arrayPalavras.palavras objectAtIndex:contLetra] imagem];
    
    UITabBar *tabbar = [[UITabBar alloc] init];
    [self.view addSubview:imagemview];
    [self.view addSubview:botao];
    [self.view addSubview:tabbar];
    
    //Desaparece
    [UIView animateWithDuration:0.5 animations:^(void) {
        imagemview.hidden = TRUE;
        imagemview.alpha = 0;
    }
                     completion:^(BOOL finished){
                         //Aparece
                         imagemview.hidden = false;
                         [UIView animateWithDuration:0.5 animations:^(void) {
                             imagemview.alpha = 1;
                         }];
                     }];
    
    
}

-(void)next:(id)sender {
    LetraAViewController *proximo = [[LetraAViewController alloc]
                                              initWithNibName:nil
                                            bundle:NULL];
    [self.navigationController pushViewController:proximo
                                         animated:NO];
    
    
    contLetra++;

    NSLog(@"%i",contLetra);
    
}

-(void)back:(id)sender{
    [self.navigationController popViewControllerAnimated:NO];
    contLetra--;
    NSLog(@"%i",contLetra);
}
@end

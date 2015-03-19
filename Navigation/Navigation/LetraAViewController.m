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

@synthesize letra, arrayPalavras,toolbar, toolBarTextField, fieldTool, botao;

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
    
    toolbar = [[UIToolbar alloc] initWithFrame:CGRectMake(0, 475, self.view.frame.size.width, 44)];
    toolbar.backgroundColor = [UIColor clearColor];
    
    fieldTool = [[UITextField alloc] initWithFrame:CGRectMake(100, 100, 300, 20)];
    fieldTool.placeholder = @"Altere palavra...";
    
    
    
    toolBarTextField = [[UIBarButtonItem alloc] initWithCustomView:fieldTool];
    
    [toolbar setItems:[NSArray arrayWithObject:toolBarTextField]];
    
    UIBarButtonItem *next = [[UIBarButtonItem alloc]
                             initWithBarButtonSystemItem:UIBarButtonSystemItemFastForward target:self action:@selector(next:)];
    
    self.navigationItem.rightBarButtonItem=next;
    
    UIBarButtonItem *back = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemRewind target:self action:@selector(back:)];
    self.navigationItem.hidesBackButton = YES;
    self.navigationItem.leftBarButtonItem = back;
    if(contLetra==0){
        back.enabled = FALSE;
    }
    
    botao = [UIButton buttonWithType:UIButtonTypeSystem];
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
    [self.view addSubview:toolbar];
    
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
    fieldTool.placeholder = @"Alterar palavra...";
    
}

-(void)back:(id)sender{
    [self.navigationController popViewControllerAnimated:NO];
    contLetra--;
    NSLog(@"%i",contLetra);
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    [botao setTitle:fieldTool.text forState:UIControlStateNormal];
    [fieldTool resignFirstResponder];
}
@end

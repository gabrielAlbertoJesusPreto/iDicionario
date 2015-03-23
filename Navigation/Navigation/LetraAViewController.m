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

@synthesize letra, arrayPalavras,toolbar, toolBarTextField, fieldTool, botao, buttonTool,toolBarButton, imagemview;

int contLetra = 0;
bool dragging;
float x01, y01;

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
    fieldTool.placeholder = @"Altere a palavra...";
    
    buttonTool = [[UIButton alloc] init];
    [buttonTool setTitle:@"Alterar" forState:UIControlStateNormal];
    
    toolBarTextField = [[UIBarButtonItem alloc] initWithCustomView:fieldTool];
    toolBarButton = [[UIBarButtonItem alloc] initWithCustomView:buttonTool];
    
    NSArray *componentesTool = [[NSArray alloc] initWithObjects:toolBarTextField,toolBarButton, nil];
   
    [toolbar setItems:componentesTool];
    
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
    botao.frame = CGRectMake(0, 0, self.view.frame.size.width, 20);
    botao.center = CGPointMake(self.view.frame.size.width/2,100);
    
    imagemview = [[UIImageView alloc] initWithFrame:CGRectMake(60.0f, 200.0f, 200, 200)];
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
    
    [imagemview setUserInteractionEnabled:YES];
}

-(void)next:(id)sender {
    LetraAViewController *proximo = [[LetraAViewController alloc]
                                              initWithNibName:nil
                                            bundle:NULL];
    [self.navigationController pushViewController:proximo
                                         animated:NO];
    
    
    contLetra++;

    NSLog(@"%i",contLetra);
    fieldTool.placeholder = @"Alterar  a palavra...";
    
}

-(void)back:(id)sender{
    [self.navigationController popViewControllerAnimated:NO];
    contLetra--;
    NSLog(@"%i",contLetra);
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    
    UITouch *touch = [[event allTouches] anyObject];
    
    if([touch view] == imagemview){
        [imagemview setFrame:CGRectMake(60, 200, 250, 250)];
        CGPoint location = [touch locationInView:touch.view];
        imagemview.center = location;
    }
    
    if(fieldTool.text.length > 0){
        [[arrayPalavras.palavras objectAtIndex:contLetra] setPalavra:fieldTool.text];
        [botao setTitle:fieldTool.text forState:UIControlStateNormal];
        [fieldTool resignFirstResponder];
    }
}
- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event{
    
    UITouch *touch = [[event allTouches] anyObject];
    if([touch view] == imagemview){
        CGPoint location = [touch locationInView:self.view];
        //imagemview.center = location;
        [imagemview setFrame:CGRectMake(location.x, location.y, 200, 200)];
        
    }
         
    fieldTool.text = @"";
    [fieldTool setPlaceholder:@"Altera a palavra..."];
    dragging = NO;
}

-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event{
    UITouch *touch = [[event allTouches] anyObject];
    if ([touch view] == imagemview) {
        CGPoint location = [touch locationInView:self.view];
        imagemview.center = location;
    }
}
@end

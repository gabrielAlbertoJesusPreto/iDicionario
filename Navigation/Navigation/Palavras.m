//
//  Palavras.m
//  Navigation
//
//  Created by Gabriel Alberto de Jesus Preto on 17/03/15.
//  Copyright (c) 2015 Vinicius Miana. All rights reserved.
//

#import "Palavras.h"
#import "Palavra.h"

@implementation Palavras

@synthesize palavras;

-(id)init{
    Palavra *pA = [[Palavra alloc]initWithPalavra:@"Abacaxi" image:[UIImage imageNamed:@"abacaxi"]];
    Palavra *pB = [[Palavra alloc]initWithPalavra:@"Banana" image:[UIImage imageNamed:@"banana"]];
    Palavra *pC = [[Palavra alloc]initWithPalavra:@"Cadeira" image:[UIImage imageNamed:@"cadeira"]];
    Palavra *pD = [[Palavra alloc]initWithPalavra:@"Dado" image:[UIImage imageNamed:@"dado"]];
    Palavra *pE = [[Palavra alloc]initWithPalavra:@"Elefante" image:[UIImage imageNamed:@"elefante"]];
    Palavra *pF = [[Palavra alloc]initWithPalavra:@"Fada" image:[UIImage imageNamed:@"fada"]];
    Palavra *pG = [[Palavra alloc]initWithPalavra:@"Gato" image:[UIImage imageNamed:@"gato"]];
    Palavra *pH = [[Palavra alloc]initWithPalavra:@"Helicoptero" image:[UIImage imageNamed:@"helicoptero"]];
    Palavra *pI = [[Palavra alloc]initWithPalavra:@"Indio" image:[UIImage imageNamed:@"indio"]];
    Palavra *pJ = [[Palavra alloc]initWithPalavra:@"Jacaré" image:[UIImage imageNamed:@"jacare"]];
    Palavra *pK = [[Palavra alloc]initWithPalavra:@"Kiwi" image:[UIImage imageNamed:@"kiwi"]];
    Palavra *pL = [[Palavra alloc]initWithPalavra:@"Lousa" image:[UIImage imageNamed:@"lousa"]];
    Palavra *pM = [[Palavra alloc]initWithPalavra:@"Mala" image:[UIImage imageNamed:@"mala"]];
    Palavra *pN = [[Palavra alloc]initWithPalavra:@"Navio" image:[UIImage imageNamed:@"navio"]];
    Palavra *pO = [[Palavra alloc]initWithPalavra:@"Olho" image:[UIImage imageNamed:@"olho"]];
    Palavra *pP = [[Palavra alloc]initWithPalavra:@"Panela" image:[UIImage imageNamed:@"panela"]];
    Palavra *pQ = [[Palavra alloc]initWithPalavra:@"Queijo" image:[UIImage imageNamed:@"queijo"]];
    Palavra *pR = [[Palavra alloc]initWithPalavra:@"Rato" image:[UIImage imageNamed:@"rato"]];
    Palavra *pS = [[Palavra alloc]initWithPalavra:@"Saia" image:[UIImage imageNamed:@"saia"]];
    Palavra *paT = [[Palavra alloc]initWithPalavra:@"Televisão" image:[UIImage imageNamed:@"televisao"]];
    Palavra *pU = [[Palavra alloc]initWithPalavra:@"Uva" image:[UIImage imageNamed:@"uva"]];
    Palavra *pV = [[Palavra alloc]initWithPalavra:@"Vestido" image:[UIImage imageNamed:@"vestido"]];
    Palavra *pW = [[Palavra alloc]initWithPalavra:@"Walter" image:[UIImage imageNamed:@"walter"]];
    Palavra *pX = [[Palavra alloc]initWithPalavra:@"Xícara" image:[UIImage imageNamed:@"xicara"]];
    Palavra *pY = [[Palavra alloc]initWithPalavra:@"Yakult" image:[UIImage imageNamed:@"yakult"]];
    Palavra *pZ = [[Palavra alloc]initWithPalavra:@"Zebra" image:[UIImage imageNamed:@"zebra"]];
    
    self = [super init];
    
    if (self) {
        palavras = [[NSMutableArray alloc]init];
        [palavras addObject:pA];
        [palavras addObject:pB];
        [palavras addObject:pC];
        [palavras addObject:pD];
        [palavras addObject:pE];
        [palavras addObject:pF];
        [palavras addObject:pG];
        [palavras addObject:pH];
        [palavras addObject:pI];
        [palavras addObject:pJ];
        [palavras addObject:pK];
        [palavras addObject:pL];
        [palavras addObject:pM];
        [palavras addObject:pN];
        [palavras addObject:pO];
        [palavras addObject:pP];
        [palavras addObject:pQ];
        [palavras addObject:pR];
        [palavras addObject:pS];
        [palavras addObject:paT];
        [palavras addObject:pU];
        [palavras addObject:pV];
        [palavras addObject:pW];
        [palavras addObject:pX];
        [palavras addObject:pY];
        [palavras addObject:pZ];
    }
    
    return self;
}

+(id)getInstance{
    
    static Palavras *instance = nil;
    
    if(instance == nil){
        instance = [[Palavras alloc]init];
    }
    
    return instance;
}

@end

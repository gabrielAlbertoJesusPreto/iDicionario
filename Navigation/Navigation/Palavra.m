//
//  Band.m
//  Navigation
//
//  Created by Gabriel Alberto de Jesus Preto on 16/03/15.
//  Copyright (c) 2015 Vinicius Miana. All rights reserved.
//

#import "Palavra.h"

@implementation Band

- (id) initWithPalavra:(NSString*)name image:(UIImage*)image{
    
    self = [super init];
    
    if (self) {
        palavra = name;
        imagem = image;
    }
    
    return self;
}

@end

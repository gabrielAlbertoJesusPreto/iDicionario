//
//  Band.h
//  Navigation
//
//  Created by Gabriel Alberto de Jesus Preto on 16/03/15.
//  Copyright (c) 2015 Vinicius Miana. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Palavra : NSObject{
    NSString *palavra;
    UIImage *imagem;
}

@property NSString *palavra;
@property UIImage *imagem;

- (id) initWithPalavra:(NSString*)name image:(UIImage*)image;
@end

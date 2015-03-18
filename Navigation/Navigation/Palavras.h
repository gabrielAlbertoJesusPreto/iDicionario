//
//  Palavras.h
//  Navigation
//
//  Created by Gabriel Alberto de Jesus Preto on 17/03/15.
//  Copyright (c) 2015 Vinicius Miana. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Palavras : NSObject
{
    NSMutableArray *palavras;
}

@property NSMutableArray *palavras;

+(id)getInstance;

@end

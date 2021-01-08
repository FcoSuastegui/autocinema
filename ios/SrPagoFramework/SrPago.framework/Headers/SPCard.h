//
//  SPCard.h
//  SrPago
//
//  Created by Armando on 10/05/17.
//  Copyright © 2017 Sr. Pago. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SPCard : NSObject

@property (nonatomic, weak)NSString *name;
@property (nonatomic, weak)NSString *number;
@property (nonatomic, weak)NSString *expMonth;
@property (nonatomic, weak)NSString *expYear;
@property (nonatomic, weak)NSString *cvv;



-(NSString *)cardJSONForRequest;

@end

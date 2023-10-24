//
//  Ticket.m
//  RaptorsTicketApp
//
//  Created by Fevin Patel on 2023-10-22.
//

#import "Ticket.h"

@implementation Ticket

- (instancetype)initWithPrice:(double)price typeOfTicket:(NSString *)typeOfTicket numOfTickets:(NSInteger)numOfTickets {
    self = [super init];
    
    if (self) {
        self.typeOfTicket = [typeOfTicket copy];
        self.numOfTickets = numOfTickets;
        self.price = price;
    }
    return self;
}

-(double)calcTicketPrice:(NSInteger)quantity {
    if(self.numOfTickets >= quantity) {
        self.numOfTickets = self.numOfTickets - quantity;
        return quantity * self.price;
    }
    return -1;
}

-(NSString *) description {
    return [NSString stringWithFormat:@"%@ Quantity:%ld Price:$%.2f", self.typeOfTicket, self.numOfTickets, self.price];
}

@end

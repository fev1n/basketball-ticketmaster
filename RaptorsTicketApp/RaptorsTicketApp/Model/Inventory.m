//
//  Inventory.m
//  RaptorsTicketApp
//
//  Created by Fevin Patel on 2023-10-22.
//

#import "Inventory.h"
#import "Ticket.h"
#import "History.h"

@implementation Inventory

- (NSMutableArray *) listOfTickets {
    if (_listOfTickets == nil) {
        _listOfTickets = [[NSMutableArray alloc] init];
        _listOfTickets = [[NSMutableArray alloc] initWithObjects:[[Ticket alloc] initWithPrice:1170 typeOfTicket:@"Balcony Level Ticket" numOfTickets:12],
                              [[Ticket alloc] initWithPrice:10434 typeOfTicket:@"Lower Level Ticket" numOfTickets:20], [[Ticket alloc]initWithPrice:27777 typeOfTicket:@"Courtside" numOfTickets:13], nil];
    }
    return _listOfTickets;
}

- (NSMutableArray *) purchasedTickets {
    if (_purchasedTickets == nil) {
        _purchasedTickets = [[NSMutableArray alloc] init];
    }
    return  _purchasedTickets;
}

- (BOOL) buyTicketAtIndex:(NSInteger)numOfTickets atIndex:(NSInteger)index {
    Ticket *t = [self.listOfTickets objectAtIndex:index];
    if (numOfTickets <= t.numOfTickets) {
        double price = numOfTickets * t.price;
        History *h = [[History alloc] initWithPrice:price typeOfTicket:t.typeOfTicket numOfTickets:numOfTickets];
        h.dateTime = [NSDate date];
        [self.purchasedTickets addObject:h];
        return YES;
    }
    else {
        return NO;
    }
}

-(BOOL) resetTickets:(NSInteger)numOfTickets atIndex:(NSInteger)index {
    if (numOfTickets > 0 && index < self.listOfTickets.count && index > -1) {
        Ticket *t = [self.listOfTickets objectAtIndex:index];
        t.numOfTickets = t.numOfTickets + numOfTickets;
        NSLog(@"%ld",t.numOfTickets);
        return YES;
    }
    return NO;
}

-(NSString*) historyTypeOfTicketAtIndex:(NSInteger)index {
    return [[self.purchasedTickets objectAtIndex:index]ticketTypeData];
}
-(NSString*) historyNumOfTicketsAtIndex:(NSInteger)index {
    return [[self.purchasedTickets objectAtIndex:index]numOfTicketsData];
}


@end

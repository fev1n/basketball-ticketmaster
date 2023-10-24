//
//  History.m
//  RaptorsTicketApp
//
//  Created by Fevin Patel on 2023-10-22.
//

#import "History.h"

@implementation History

- (instancetype)init {
    self = [super init];
    if (self) {
        self.dateTime = [NSDate date];
    }
    return self;
}

- (NSString *) ticketTypeData {
    return [NSString stringWithFormat:@"Item: %@", self.typeOfTicket];
}

- (NSString *) numOfTicketsData {
    return [NSString stringWithFormat:@"Quantity: %ld", self.numOfTickets];
}

- (NSString *) totalPriceData {
    return [NSString stringWithFormat:@"Total: %.2f", self.price];
}

- (NSString *) dateTimeData {
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"EEEE MMMM d, yyyy HH:mm:SS a"];
    NSString *resultDateString = [NSString stringWithFormat:@"%@", [dateFormatter stringFromDate:self.dateTime]];
    return resultDateString;
}

@end

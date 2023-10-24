//
//  History.h
//  RaptorsTicketApp
//
//  Created by Fevin Patel on 2023-10-22.
//
#import <Foundation/Foundation.h>
#import "Ticket.h"

NS_ASSUME_NONNULL_BEGIN

@interface History : Ticket

@property (nonatomic) NSDate *dateTime;
- (NSString *) ticketTypeData;
- (NSString *) numOfTicketsData;
- (NSString *) totalPriceData;
- (NSString *) dateTimeData;

- (instancetype)init;

@end

NS_ASSUME_NONNULL_END

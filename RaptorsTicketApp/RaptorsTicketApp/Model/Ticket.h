//
//  Ticket.h
//  RaptorsTicketApp
//
//  Created by Fevin Patel on 2023-10-22.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Ticket : NSObject

@property (nonatomic) double price;
@property (nonatomic) NSString *typeOfTicket;
@property (nonatomic) NSInteger numOfTickets;

- (instancetype)initWithPrice:(double)price typeOfTicket:(NSString *)typeOfTicket numOfTickets:(NSInteger)numOfTickets;
- (double) calcTicketPrice:(NSInteger)quantity;
- (NSString *) description;

@end

NS_ASSUME_NONNULL_END

//
//  Inventory.h
//  RaptorsTicketApp
//
//  Created by Fevin Patel on 2023-10-22.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Inventory : NSObject

@property (nonatomic) NSMutableArray *listOfTickets;
@property (nonatomic) NSMutableArray *purchasedTickets;

- (BOOL) buyTicketAtIndex:(NSInteger)numOfTickets atIndex:(NSInteger)index;
-(BOOL) resetTickets:(NSInteger)numOfTickets atIndex:(NSInteger)index;
-(NSString*) historyTypeOfTicketAtIndex:(NSInteger)index;
-(NSString*) historyNumOfTicketsAtIndex:(NSInteger)index;

@end

NS_ASSUME_NONNULL_END

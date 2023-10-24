//
//  ViewController.h
//  RaptorsTicketApp
//
//  Created by Fevin Patel on 2023-10-21.
//

#import <UIKit/UIKit.h>
#import "Model/Inventory.h"
#import "Model/Ticket.h"

@interface ViewController : UIViewController

@property (nonatomic) NSInteger selectedRow;
@property (nonatomic) Inventory *inventoryModel;
@property (nonatomic) Ticket *ticketModel;
@property (nonatomic) double totalPrice;
@property (nonatomic) BOOL isNewNum;

- (void) updateData;

@end


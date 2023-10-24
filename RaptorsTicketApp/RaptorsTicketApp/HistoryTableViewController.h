//
//  HistoryTableViewController.h
//  RaptorsTicketApp
//
//  Created by Fevin Patel on 2023-10-22.
//

#import <UIKit/UIKit.h>
#import "Model/Inventory.h"

NS_ASSUME_NONNULL_BEGIN

@interface HistoryTableViewController : UITableViewController <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic) Inventory *hvcToInventroyObj;
@property (nonatomic) NSMutableArray *purchasedTicketHistory;

@end

NS_ASSUME_NONNULL_END

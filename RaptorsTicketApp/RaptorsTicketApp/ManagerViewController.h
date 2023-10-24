//
//  ManagerViewController.h
//  RaptorsTicketApp
//
//  Created by Fevin Patel on 2023-10-22.
//

#import <UIKit/UIKit.h>
#import "Model/Inventory.h"

NS_ASSUME_NONNULL_BEGIN

@interface ManagerViewController : UIViewController

@property (nonatomic) Inventory *mvcToInventoryObj;

@end

NS_ASSUME_NONNULL_END

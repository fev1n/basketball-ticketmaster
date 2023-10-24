//
//  ResetViewController.h
//  RaptorsTicketApp
//
//  Created by Fevin Patel on 2023-10-23.
//

#import <UIKit/UIKit.h>
#import "Model/Inventory.h"

NS_ASSUME_NONNULL_BEGIN

@interface ResetViewController : UIViewController

@property (nonatomic) Inventory *rvcToInventoryObject;
@property (nonatomic) NSInteger selectedRow;

@end

NS_ASSUME_NONNULL_END

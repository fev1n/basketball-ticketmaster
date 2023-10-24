//
//  ManagerViewController.m
//  RaptorsTicketApp
//
//  Created by Fevin Patel on 2023-10-22.
//

#import "ManagerViewController.h"
#import "HistoryTableViewController.h"
#import "ResetViewController.h"

@interface ManagerViewController ()

@end

@implementation ManagerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}


#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"historyTable"]) {
        HistoryTableViewController *hvc = (HistoryTableViewController *) segue.destinationViewController;
        hvc.hvcToInventroyObj = self.mvcToInventoryObj;
    }
    else {
        ResetViewController *rvc = (ResetViewController *)segue.destinationViewController;
        rvc.rvcToInventoryObject = self.mvcToInventoryObj;
    }
}


@end

//
//  HistoryTableViewController.m
//  RaptorsTicketApp
//
//  Created by Fevin Patel on 2023-10-22.
//

#import "HistoryTableViewController.h"
#import "Model/History.h"
#import "PurchasedTicketViewController.h"


@interface HistoryTableViewController ()

@end

@implementation HistoryTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
}

- (Inventory *) hvcToInventroyObj {
    if (_hvcToInventroyObj == nil) {
        _hvcToInventroyObj = [[Inventory alloc] init];
    }
    return _hvcToInventroyObj;
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
#warning Incomplete implementation, return the number of sections
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete implementation, return the number of rows
    return self.hvcToInventroyObj.purchasedTickets.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell1" forIndexPath:indexPath];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"cell1"];
    }
    cell.textLabel.text = [self.hvcToInventroyObj historyTypeOfTicketAtIndex:indexPath.row];
    cell.detailTextLabel.text = [self.hvcToInventroyObj historyNumOfTicketsAtIndex:indexPath.row];
    return cell;
}

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if([segue.identifier isEqualToString:@"TicketData"])
    {
        NSIndexPath *indexPath = self.tableView.indexPathForSelectedRow;
        
        PurchasedTicketViewController *ptvc = (PurchasedTicketViewController *)[segue destinationViewController];
        ptvc.ticketInfo = [self.hvcToInventroyObj.purchasedTickets objectAtIndex:indexPath.row];
    }
}


@end

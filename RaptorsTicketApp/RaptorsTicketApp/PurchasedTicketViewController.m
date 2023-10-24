//
//  PurchasedTicketViewController.m
//  RaptorsTicketApp
//
//  Created by Fevin Patel on 2023-10-22.
//

#import "PurchasedTicketViewController.h"

@interface PurchasedTicketViewController ()

@property (weak, nonatomic) IBOutlet UILabel *typeOfTicketLbl;
@property (weak, nonatomic) IBOutlet UILabel *numOfTicketsLbl;
@property (weak, nonatomic) IBOutlet UILabel *priceLbl;
@property (weak, nonatomic) IBOutlet UILabel *dateOfPurchaseLbl;

@end

@implementation PurchasedTicketViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.typeOfTicketLbl.text = [self.ticketInfo ticketTypeData];
    self.numOfTicketsLbl.text = [self.ticketInfo numOfTicketsData];
    self.priceLbl.text = [self.ticketInfo totalPriceData];
    self.dateOfPurchaseLbl.text = [self.ticketInfo dateTimeData];
}

-(History *) ticketInfo {
    if (_ticketInfo == nil) {
        _ticketInfo = [[History alloc]init];
    }
    return _ticketInfo;
}

@end

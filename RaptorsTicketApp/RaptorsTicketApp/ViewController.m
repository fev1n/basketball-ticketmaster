//
//  ViewController.m
//  RaptorsTicketApp
//
//  Created by Fevin Patel on 2023-10-21.
//

#import "ViewController.h"
#import "ManagerViewController.h"


@interface ViewController () <UIPickerViewDelegate, UIPickerViewDataSource>
@property (weak, nonatomic) IBOutlet UILabel *totalPriceLbl;
@property (weak, nonatomic) IBOutlet UILabel *numOfTicketsLbl;
@property (weak, nonatomic) IBOutlet UILabel *typeOfTicketLbl;
@property (weak, nonatomic) IBOutlet UIPickerView *ticketTypePickerView;

@end

@implementation ViewController

- (Inventory *) inventoryModel {
    if (_inventoryModel == nil) {
        _inventoryModel = [[Inventory alloc] init];
    }
    return _inventoryModel;
}

- (Ticket *) ticketModel {
    if (_ticketModel == nil) {
        _ticketModel = [[Ticket alloc] init];
    }
    return _ticketModel;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.ticketTypePickerView.delegate = self;
    self.ticketTypePickerView.dataSource = self;
    self.numOfTicketsLbl.text = @"";
    self.typeOfTicketLbl.text = @"";
    self.totalPriceLbl.text = @"0";
    self.selectedRow = 0;
    [self updateData];
}

-(void)viewDidAppear:(BOOL)animated{
    [self.ticketTypePickerView reloadAllComponents];
}

- (IBAction)numBtnPressed:(UIButton *)sender {
    if (self.isNewNum) {
        self.numOfTicketsLbl.text = sender.titleLabel.text;
        self.isNewNum = NO;
    }
    else {
        self.numOfTicketsLbl.text = [NSString stringWithFormat:@"%@%@", self.numOfTicketsLbl.text, sender.titleLabel.text];
    }
}


- (IBAction)buyBtnPressed:(id)sender {
    NSInteger numOfTickets = [self.numOfTicketsLbl.text intValue];
    if (numOfTickets > 0) {
        bool isAvailable = [self.inventoryModel buyTicketAtIndex:numOfTickets atIndex:self.selectedRow];
        if (!isAvailable) {
            self.totalPriceLbl.text = @"Not available";
            self.numOfTicketsLbl.text = @"";
        }
        else {
            self.totalPriceLbl.text = [NSString stringWithFormat:@"$ %.2f", [self.ticketModel calcTicketPrice:numOfTickets]];
            self.ticketModel = [self.inventoryModel.listOfTickets objectAtIndex:self.selectedRow];
            self.typeOfTicketLbl.text = self.ticketModel.typeOfTicket;
            [self.ticketTypePickerView reloadAllComponents];
            self.numOfTicketsLbl.text = @"";
        }
    }
    else {
        self.totalPriceLbl.text = @"Please enter No. of Tickets";
        self.numOfTicketsLbl.text = @"";
    }
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 1;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    return 3;
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    Ticket *t = [self.inventoryModel.listOfTickets objectAtIndex:row];
    return [NSString stringWithFormat:@"%@ %ld Price: %.00f$", t.typeOfTicket, t.numOfTickets, t.price];
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    self.ticketModel = [self.inventoryModel.listOfTickets objectAtIndex:row];
    self.selectedRow = row;
    self.numOfTicketsLbl.text = @"";
    self.typeOfTicketLbl.text = @"";
    self.totalPriceLbl.text = @"0";
    [self updateData];
}

- (void) updateData {
    self.typeOfTicketLbl.text = self.ticketModel.typeOfTicket;
}

- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    ManagerViewController *mvc = (ManagerViewController *)segue.destinationViewController;
    mvc.mvcToInventoryObj = self.inventoryModel;
}


@end

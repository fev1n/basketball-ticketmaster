//
//  ResetViewController.m
//  RaptorsTicketApp
//
//  Created by Fevin Patel on 2023-10-23.
//

#import "ResetViewController.h"
#import "Model/Ticket.h"

@interface ResetViewController () <UIPickerViewDelegate, UIPickerViewDataSource>
@property (weak, nonatomic) IBOutlet UIPickerView *resetTicketPickerView;
@property (weak, nonatomic) IBOutlet UITextField *resetNumOfTicketTxtFld;
@property (nonatomic) Ticket *ticketModel;


@end

@implementation ResetViewController

- (Inventory *) rvcToInventoryObject {
    if (_rvcToInventoryObject == nil) {
        _rvcToInventoryObject = [[Inventory alloc] init];
    }
    return _rvcToInventoryObject;;
}

- (Ticket *) ticketModel {
    if (_ticketModel == nil) {
        _ticketModel = [[Ticket alloc] init];
    }
    return _ticketModel;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.selectedRow = 0;
    self.resetTicketPickerView.delegate = self;
    self.resetTicketPickerView.dataSource = self;
    Ticket *t = [self.rvcToInventoryObject.listOfTickets objectAtIndex:0];
    NSString *currentTicketTypeTitle = [NSString stringWithFormat:@"%@", t.typeOfTicket];
    self.navigationItem.title = currentTicketTypeTitle;
}

- (IBAction)okBtnPressed:(id)sender {
    NSString *numOfTickets = self.resetNumOfTicketTxtFld.text;
    NSInteger amountOfTicketsToAdd = [numOfTickets intValue];
    [self.rvcToInventoryObject resetTickets:amountOfTicketsToAdd atIndex:self.selectedRow];
    [self.resetTicketPickerView reloadAllComponents];
    self.resetNumOfTicketTxtFld.text = @"";
}

- (IBAction)CancelBtnPressed:(id)sender {
    self.resetNumOfTicketTxtFld.text = @"";
}

- (IBAction)doneBtnPressed:(id)sender {
    [self.navigationController popToRootViewControllerAnimated:YES];
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 1;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    return 3;
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    Ticket *t = [self.rvcToInventoryObject.listOfTickets objectAtIndex:row];
    return [NSString stringWithFormat:@"%@ %ld Price: %.00f$", t.typeOfTicket, t.numOfTickets, t.price];
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    self.selectedRow = row;
    self.ticketModel = [self.rvcToInventoryObject.listOfTickets objectAtIndex:self.selectedRow];
    self.navigationItem.title = self.ticketModel.typeOfTicket;
}

@end

//
//  AddRequestViewController.m
//  Prestapp
//
//  Created by Abner Castro Aguilar on 12/04/15.
//  Copyright (c) 2015 Abner Castro Aguilar. All rights reserved.
//

#import "AddRequestViewController.h"
#import <Parse/Parse.h>


@interface AddRequestViewController ()
{
    int cantidad;
    NSArray *cantidades;
}

@end

@implementation AddRequestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"Agregar Préstamo";
    UIBarButtonItem *doneButton = [[UIBarButtonItem alloc] initWithTitle:@"Listo" style:UIBarButtonItemStyleDone target:self action:@selector(addRequest)];
    UIBarButtonItem *cancelButton = [[UIBarButtonItem alloc] initWithTitle:@"Cancelar" style:UIBarButtonItemStylePlain target:self action:@selector(cancelRequest)];
    self.navigationItem.rightBarButtonItem = doneButton;
    self.navigationItem.leftBarButtonItem = cancelButton;
    
    self.pickerView.dataSource = self;
    self.pickerView.delegate = self;
    cantidades = [NSArray arrayWithObjects:@"5000", @"6500", @"8000", @"9500", @"11000", @"12500", @"14000", nil];
    cantidad = 5000;
    
    
}

#pragma mark Picker Delegate
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return [cantidades count];
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    return [cantidades objectAtIndex:row];
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    cantidad = [[cantidades objectAtIndex:row] intValue];
}

- (void)addRequest
{
    PFObject *object = [PFObject objectWithClassName:@"Prestamista"];
    [object setObject:self.fieldReq.text forKey:@"necesita"];
    [object setObject:[NSNumber numberWithInt:cantidad] forKey:@"precio"];
    [object setObject:[PFUser currentUser].username forKey:@"name"];
    [object saveInBackground];
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)cancelRequest
{
    [self dismissViewControllerAnimated:YES completion:nil];
}


@end

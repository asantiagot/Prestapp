//
//  LendViewController.m
//  Prestapp
//
//  Created by Abner Castro Aguilar on 11/04/15.
//  Copyright (c) 2015 Abner Castro Aguilar. All rights reserved.
//

#import "LendViewController.h"

@interface LendViewController ()
{
    NSArray *cientos;
    NSArray *decenas;
    NSArray *unidades;
    
    int suma;
}

@end

@implementation LendViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.navigationItem.title = @"Prestar";
    UIBarButtonItem *doneButton = [[UIBarButtonItem alloc] initWithTitle:@"Listo" style:UIBarButtonItemStyleDone target:self action:@selector(prestar)];
    UIBarButtonItem *cancelButton = [[UIBarButtonItem alloc] initWithTitle:@"Cancelar" style:UIBarButtonItemStylePlain target:self action:@selector(dismissView)];
    self.navigationItem.rightBarButtonItem = doneButton;
    self.navigationItem.leftBarButtonItem = cancelButton;
    
    self.tasaLabel.text = @"Tasa: 8.2";
    self.cantidadLabel.text = @"Cantidad:";
    suma = 0;
    
    cientos = [NSArray arrayWithObjects:@"5000", @"6500", @"8000", @"9500",@"11000", @"12500", @"14000", nil];
    decenas = [NSArray arrayWithObjects:@"12 meses", @"24 meses", @"36 meses", nil];
    unidades = [NSArray arrayWithObjects:@"90", @"80", @"70", @"60", @"50", @"40", @"30", @"20", @"10", nil];
    
    self.pickerView.delegate = self;
    self.pickerView.dataSource = self;
}

#pragma mark PickerView Delegate
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 2;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    switch(component)
    {
        case 0:
            return [cientos count];
            break;
        case 1:
            return [decenas count];
            break;
        default:
            return 0;
            break;
    }
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    switch(component)
    {
        case 0:
            return [cientos objectAtIndex:row];
            break;
        case 1:
            return [decenas objectAtIndex:row];
            break;
        default:
            return nil;
            break;
    }
}

- (void)sumaCantidad:(NSArray *)array row:(NSInteger)row
{
    int numero = [[array objectAtIndex:row] floatValue];
    suma = suma + numero;
    self.cantidadLabel.text = [NSString stringWithFormat:@"$%i", suma];
}

- (void)dismissView
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)prestar
{
    
}


- (IBAction)moveSlider:(UISlider *)sender
{
    self.tasaLabel.text = [NSString stringWithFormat:@"Tasa: %.2f", sender.value];
}
@end

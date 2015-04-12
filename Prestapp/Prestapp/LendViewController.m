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
    
    cientos = [NSArray arrayWithObjects:@"15000", @"14000", @"13000", @"12000", @"11000", @"10000", @"9000", @"8000", @"7000", @"6000", @"5000", @"4000", @"3000", @"2000", @"10000", nil];
    decenas = [NSArray arrayWithObjects:@"900", @"800", @"700", @"600", @"500", @"400", @"300", @"200", @"100", nil];
    unidades = [NSArray arrayWithObjects:@"90", @"80", @"70", @"60", @"50", @"40", @"30", @"20", @"10", nil];
    
    self.pickerView.delegate = self;
    self.pickerView.dataSource = self;
}

#pragma mark PickerView Delegate
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
        case 2:
            return [unidades count];
        break;
        default:
            break;
    }
    return 0;
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 3;
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    switch(component)
    {
        case 0:
            return [cientos objectAtIndex:row];
        case 1:
            return [decenas objectAtIndexedSubscript:row];
            break;
        case 2:
            return [unidades objectAtIndex:row];
            break;
        default:
            break;
    }
    return nil;
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    switch(component)
    {
        case 0:
            
            break;
        case 1:
            
            break;
        case 2:
            
            break;
        default:
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

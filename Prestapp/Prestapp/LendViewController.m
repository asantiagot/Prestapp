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
    
    NSDictionary *tasas;
    
    int cantidad;
    int meses;
    
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
    
    self.tasaLabel.text = @"Tasa: ";
    self.cantidadLabel.text = @"Cantidad:";
    suma = 0;
    
    cientos = [NSArray arrayWithObjects:@"5000", @"6500", @"8000", @"9500",@"11000", @"12500", @"14000", nil];
    decenas = [NSArray arrayWithObjects:@"12 meses", @"24 meses", @"36 meses", nil];
    unidades = [NSArray arrayWithObjects:@"90", @"80", @"70", @"60", @"50", @"40", @"30", @"20", @"10", nil];
    
    self.pickerView.delegate = self;
    self.pickerView.dataSource = self;
    cantidad = 5000;
    meses  = 12;
    self.slider.hidden = YES;

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

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    if(component == 0)
        cantidad = [[cientos objectAtIndex:row] intValue];
    if(component == 1)
        meses = [[decenas objectAtIndex:row] intValue];
    switch(cantidad)
    {
        case 5000:
        {
            if(meses == 12)
                self.tasaLabel.text = @"Tasa: 20%";
            else if(meses == 24)
                self.tasaLabel.text = @"Tasa: 22%";
            else
                self.tasaLabel.text = @"Tasa: 24%";
        }
            break;
        case 6500:
        {
            if(meses == 12)
                self.tasaLabel.text = @"Tasa: 25%";
            else if(meses == 24)
                self.tasaLabel.text = @"Tasa: 27%";
            else
                self.tasaLabel.text = @"Tasa: 29%";
        }
            break;
        case 8000:
        {
            if(meses == 12)
                self.tasaLabel.text = @"Tasa: 30%";
            else if(meses == 24)
                self.tasaLabel.text = @"Tasa: 32%";
            else
                self.tasaLabel.text = @"Tasa: 34%";
        }
            break;
        case 9500:
        {
            if(meses == 12)
                self.tasaLabel.text = @"Tasa: 35%";
            else if(meses == 24)
                self.tasaLabel.text = @"Tasa: 37%";
            else
                self.tasaLabel.text = @"Tasa: 39%";
        }
            break;
        case 11000:
        {
            if(meses == 12)
                self.tasaLabel.text = @"Tasa: 40%";
            else if(meses == 24)
                self.tasaLabel.text = @"Tasa: 42%";
            else
                self.tasaLabel.text = @"Tasa: 44%";
        }
            break;
        case 12500:
        {
            if(meses == 12)
                self.tasaLabel.text = @"Tasa: 43%";
            else if(meses == 24)
                self.tasaLabel.text = @"Tasa: 45%";
            else
                self.tasaLabel.text = @"Tasa: 47%";
        }
            break;
        case 14000:
        {
            if(meses == 12)
                self.tasaLabel.text = @"Tasa: 45%";
            else if(meses == 24)
                self.tasaLabel.text = @"Tasa: 47%";
            else
                self.tasaLabel.text = @"Tasa: 49%";
        }
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
    switch(cantidad)
    {
        case 5000:
        {
            if(meses == 12)
                self.tasaLabel.text = @"20";
            else if(meses == 24)
                self.tasaLabel.text = @"22";
            else
                self.tasaLabel.text = @"24";
        }
            break;
        case 6500:
        {
            if(meses == 12)
                self.tasaLabel.text = @"25";
            else if(meses == 24)
                self.tasaLabel.text = @"27";
            else
                self.tasaLabel.text = @"29";
        }
            break;
        case 8000:
        {
            if(meses == 12)
                self.tasaLabel.text = @"30";
            else if(meses == 24)
                self.tasaLabel.text = @"32";
            else
                self.tasaLabel.text = @"34";
        }
            break;
        case 9500:
        {
            if(meses == 12)
                self.tasaLabel.text = @"35";
            else if(meses == 24)
                self.tasaLabel.text = @"37";
            else
                self.tasaLabel.text = @"39";
        }
            break;
        case 11000:
        {
            if(meses == 12)
                self.tasaLabel.text = @"40";
            else if(meses == 24)
                self.tasaLabel.text = @"42";
            else
                self.tasaLabel.text = @"44";
        }
            break;
        case 12500:
        {
            if(meses == 12)
                self.tasaLabel.text = @"43";
            else if(meses == 24)
                self.tasaLabel.text = @"45";
            else
                self.tasaLabel.text = @"47";
        }
            break;
        case 14000:
        {
            if(meses == 12)
                self.tasaLabel.text = @"45";
            else if(meses == 24)
                self.tasaLabel.text = @"47";
            else
                self.tasaLabel.text = @"49";
        }
            break;
        default:
            break;
    }
    [self dismissViewControllerAnimated:YES completion:nil];
}


- (IBAction)moveSlider:(UISlider *)sender
{
    self.tasaLabel.text = [NSString stringWithFormat:@"Tasa: %.2f", sender.value];
}
@end

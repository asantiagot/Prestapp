//
//  LendViewController.h
//  Prestapp
//
//  Created by Abner Castro Aguilar on 11/04/15.
//  Copyright (c) 2015 Abner Castro Aguilar. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LendViewController : UIViewController <UIPickerViewDataSource, UIPickerViewDelegate>

@property (weak, nonatomic) IBOutlet UILabel *cantidadLabel;
@property (weak, nonatomic) IBOutlet UILabel *tasaLabel;
@property (weak, nonatomic) IBOutlet UIPickerView *pickerView;
- (IBAction)moveSlider:(UISlider *)sender;
@end

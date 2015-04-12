//
//  AddRequestViewController.h
//  Prestapp
//
//  Created by Abner Castro Aguilar on 12/04/15.
//  Copyright (c) 2015 Abner Castro Aguilar. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AddRequestViewController : UIViewController <UIPickerViewDataSource, UIPickerViewDelegate>
@property (weak, nonatomic) IBOutlet UITextField *fieldReq;
@property (weak, nonatomic) IBOutlet UIPickerView *pickerView;

@end

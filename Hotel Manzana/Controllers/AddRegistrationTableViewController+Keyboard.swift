//
//  AddRegistrationTableViewController+KeyBoard.swift
//  Hotel Manzana
//
//  Created by Гость on 16/02/2019.
//  Copyright © 2019 Гость. All rights reserved.
//

import UIKit

extension AddRegistrationTableViewController {
    func setupKeyboardNotification() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardIsHidden), name: UIControl.keyboardDidHideNotification, object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardIsShown), name: UIControl.keyboardWillShowNotification, object: nil)
    }
    
    @objc func keyboardIsHidden() {
        print(#function)
    }
    
    @objc func keyboardIsShown() {
        print(#function)
    }
}

//
//  AddRegistrationTableViewController.swift
//  Hotel Manzana
//
//  Created by Гость on 04/02/2019.
//  Copyright © 2019 Гость. All rights reserved.
//

import UIKit

class AddRegistrationTableViewController: UITableViewController {

    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBAction func doneBarButtonTapped(_ sender: UIBarButtonItem) {
        let firstName = firstNameTextField.text ?? ""
        let lastName = lastNameTextField.text ?? ""
        let email = emailTextField.text ?? ""
        
        let registration = Registration(
            firstName: firstName,
            lastName: lastName,
            emailAddress: email,
            checkInDate: Date(),
            checkOutDate: Date(),
            numberOfAdults: Int(),
            numderOfChildren: Int(),
            roomType: RoomType(
                id: Int(),
                name: String(),
                shortName: String(),
                price: Int()
            ),
            wifi: Bool()
        )
        
        print(#function, registration)
    }
    
}

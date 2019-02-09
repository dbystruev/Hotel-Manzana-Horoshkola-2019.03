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
    
    @IBOutlet weak var checkInLabel: UILabel!
    @IBOutlet weak var checkInPicker: UIDatePicker!
    @IBOutlet weak var checkOutLabel: UILabel!
    @IBOutlet weak var checkOutPicker: UIDatePicker!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    func setupUI() {
        checkInPicker.date = Date()
        updateUI()
    }
    func updateUI() {
        checkInPicker.date = max(checkInPicker.date, Date())
        checkOutPicker.date = max(checkOutPicker.date, checkInPicker.date.addingTimeInterval(24 * 60 * 60))
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        
        checkInLabel.text = dateFormatter.string(from: checkInPicker.date)
        checkOutLabel.text = dateFormatter.string(from: checkOutPicker.date)
    }
    
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
    
    @IBAction func checkInChanged(_ sender: UIDatePicker) {
        updateUI()
    }
    
    @IBAction func checkOutChanged(_ sender: UIDatePicker) {
        updateUI()
    }
}

//
//  AddRegistrationTableViewController.swift
//  Hotel Manzana
//
//  Created by Гость on 04/02/2019.
//  Copyright © 2019 Гость. All rights reserved.
//

import UIKit

class AddRegistrationTableViewController: UITableViewController {

    @IBOutlet weak var doneBarButton: UIBarButtonItem!
    
    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var checkInLabel: UILabel!
    @IBOutlet weak var checkInPicker: UIDatePicker!
    @IBOutlet weak var checkOutLabel: UILabel!
    @IBOutlet weak var checkOutPicker: UIDatePicker!
    
    @IBOutlet weak var adultsLabel: UILabel!
    @IBOutlet weak var adultsStepper: UIStepper!
    @IBOutlet weak var childrenLabel: UILabel!
    @IBOutlet weak var childrenStepper: UIStepper!
    
    
    let checkInLabelPath = IndexPath(row: 0, section: 1)
    let checkInPickerPath = IndexPath(row: 1, section: 1)
    let checkOutLabelPath = IndexPath(row: 2, section: 1)
    let checkOutPickerPath = IndexPath(row: 3, section: 1)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    func setupUI() {
        checkInPicker.date = Date()
        checkInPicker.isHidden = true
        checkOutPicker.isHidden = true
        setupKeyboardNotification()
        updateDoneButton()
        updateUI()
    }
    
    func updateDoneButton() {
      doneBarButton.isEnabled = !(firstNameTextField.text?.isEmpty ?? true)
      doneBarButton.isEnabled = doneBarButton.isEnabled && !(lastNameTextField.text?.isEmpty ?? true)
      doneBarButton.isEnabled = doneBarButton.isEnabled && !(emailTextField.text?.isEmpty ?? true)
    }
    
    func updateUI() {
        checkInPicker.date = max(checkInPicker.date, Date())
        checkOutPicker.date = max(checkOutPicker.date, checkInPicker.date.addingTimeInterval(24 * 60 * 60))
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        
        checkInLabel.text = dateFormatter.string(from: checkInPicker.date)
        checkOutLabel.text = dateFormatter.string(from: checkOutPicker.date)
        
        adultsLabel.text = "Adults: \(Int(adultsStepper.value))"
        childrenLabel.text = "Children: \(Int(childrenStepper.value))"
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath {
        case checkInLabelPath:
            checkInPicker.isHidden.toggle()
        case checkOutLabelPath:
            checkOutPicker.isHidden.toggle()
        default:
            return
        }
        tableView.beginUpdates()
        tableView.endUpdates()
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath {
        case checkInPickerPath:
                return checkInPicker.isHidden ? 0 : 200
            case checkOutPickerPath:
                return checkOutPicker.isHidden ? 0 : 200
        default:
            return 44
        }
    }
    
    @IBAction func doneBarButtonTapped(_ sender: UIBarButtonItem) {
        view.endEditing(true)
        
        let firstName = firstNameTextField.text ?? ""
        let lastName = lastNameTextField.text ?? ""
        let email = emailTextField.text ?? ""
        let checkInDate = self.checkInPicker.date
        let checkOutDate = self.checkOutPicker.date
        let adults = Int(adultsStepper.value)
        let children = Int(childrenStepper.value)
        
        let registration = Registration(
            firstName: firstName,
            lastName: lastName,
            emailAddress: email,
            checkInDate: checkInDate,
            checkOutDate: checkOutDate,
            numberOfAdults: adults,
            numderOfChildren: children,
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
    
    @IBAction func textFieldFinished(_ sender: UITextField) {
        sender.resignFirstResponder()
    }
    
    @IBAction func tapPressed(_ sender: UITapGestureRecognizer) {
        view.endEditing(true)
    }
    
    @IBAction func textFieldChaged(_ sender: UITextField) {
        updateDoneButton()
    }
    
    @IBAction func checkInChanged(_ sender: UIDatePicker) {
        updateUI()
    }
    
    @IBAction func checkOutChanged(_ sender: UIDatePicker) {
        updateUI()
    }
    
    @IBAction func UIStepper(_ sender: Any) {
        updateUI()
    }
    
}


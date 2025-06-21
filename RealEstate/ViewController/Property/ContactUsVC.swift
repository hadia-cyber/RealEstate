//
//  ContactUsVC.swift
//  RealEstate
//
//  Created by TecSpine on 25/10/2021.
//

import UIKit

class ContactUsVC: BaseClass {

    
    @IBOutlet weak var nameFld: UITextField!
    @IBOutlet weak var emailFld: UITextField!
    @IBOutlet weak var phoneFld: UITextField!
    @IBOutlet weak var subjectFld: UITextField!
    @IBOutlet weak var descriptionText: UITextView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func contact(_ sender: Any) {
        if isValid() {
            
        }
    }
    @IBAction func didTapBack(_ sender : UIButton){
        dismiss(animated: false)
    }
    
    func isValid() -> Bool {
        
        guard !nameFld.text!.isEmpty else {
            showAlert(message: "Please enter name")
            return false
        }
        
        guard !emailFld.text!.isEmpty else {
            showAlert(message: "Please enter email")
            return false
        }
        
        guard !phoneFld.text!.isEmpty else {
            showAlert(message: "Please enter phone no")
            return false
        }
        
        guard !subjectFld.text!.isEmpty else {
            showAlert(message: "Please enter subject")
            return false
        }
        
        guard !descriptionText.text!.isEmpty else {
            showAlert(message: "Please enter detail")
            return false
        }
        
        return true
        
    }

}

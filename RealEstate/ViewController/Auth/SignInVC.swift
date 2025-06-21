//
//  SignInVC.swift
//  RealEstate
//
//  Created by TecSpine on 27/10/2021.
//

import UIKit
import CountryPickerView

class SignInVC: BaseClass {
    
    @IBOutlet weak var emailFld: UITextField!
    @IBOutlet weak var signInLbl: UILabel!
    @IBOutlet weak var viewRememberBack : UIView!
    @IBOutlet weak var btnRememberMe : UIButton!
    @IBOutlet weak var btnCountryPicker : UIButton!
    @IBOutlet weak var textField1 : UITextField!
    @IBOutlet weak var textField2 : UITextField!
    @IBOutlet weak var textField3 : UITextField!
    @IBOutlet weak var textField4 : UITextField!
    @IBOutlet weak var textField5 : UITextField!
    @IBOutlet weak var textField6 : UITextField!
    @IBOutlet weak var viewOtp : UIView!
    
    var countryPickerView: CountryPickerView = CountryPickerView()
    var coutryCode = ""
    var isRemember  = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        countryPickerView.delegate = self
        countryPickerView.dataSource = self
        setLayouts()
    }
    func setLayouts(){
        viewOtp.isHidden = true
        emailFld.delegate = self
        textField1.delegate = self
        textField2.delegate = self
        textField3.delegate = self
        textField4.delegate = self
        textField5.delegate = self
        textField6.delegate = self
        textField1.isUserInteractionEnabled = true
        textField2.isUserInteractionEnabled = false
        textField3.isUserInteractionEnabled = false
        textField4.isUserInteractionEnabled = false
        textField5.isUserInteractionEnabled = false
        textField6.isUserInteractionEnabled = false
        textField1.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
        textField2.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
        textField3.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
        textField4.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
        textField5.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
        textField6.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
        viewRememberBack.layer.cornerRadius = viewRememberBack.frame.size.height / 2
    }
    
    @IBAction func didTapRememberMe(_ sender : UIButton){
        if isRemember{
            isRemember = !isRemember
            btnRememberMe.tintColor = .black
        }
        else{
            isRemember = !isRemember
            btnRememberMe.tintColor = .white
        }
    }
    @IBAction func countryCodeAction(_ sender: UIButton){
        countryPickerView.showCountriesList(from: self)
    }
    @IBAction func signIn(_ sender: Any) {
        if isValid() {
            moveToOtp()
        }
    }
    @IBAction func skip(_ sender: Any) {
        let storyboard = UIStoryboard(name: "PropertyDesign", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "TabBarVC") as! UITabBarController
        vc.modalPresentationStyle = .fullScreen
        self.navigationController?.pushViewController(vc, animated: true)

    }
    func moveToOtp(){
        viewOtp.isHidden = false
        let storyboard = UIStoryboard(name: "PropertyDesign", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "TabBarVC") as! UITabBarController
        vc.modalPresentationStyle = .fullScreen
        self.navigationController?.pushViewController(vc, animated: true)
    }
    func isValid() -> Bool {
        guard let number = emailFld.text, number != "", number != "XXXXXXXXXX" else {
            showAlert(message: "Please enter number")
            return false
        }
        return true
    }

}

/* MARK:- Country Picker Delegate */
extension SignInVC: CountryPickerViewDelegate, CountryPickerViewDataSource{
    func countryPickerView(_ countryPickerView: CountryPickerView, didSelectCountry country: Country){
        coutryCode         = country.phoneCode
        btnCountryPicker.setTitle("\(coutryCode)", for: .normal)
        emailFld.becomeFirstResponder()
    }
}

/* MARK:- UITextFieldDelegate*/
extension SignInVC : UITextFieldDelegate{
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if textField == emailFld{
            emailFld.text = ""
        }
    }
    @objc func textFieldDidChange(_ textField: UITextField) {
        var text = textField.text!
        if text.utf16.count == 0 {
            switch textField {
            case textField2:
                textField1.isUserInteractionEnabled = true
                textField1.becomeFirstResponder()
            case textField3:
                textField2.isUserInteractionEnabled = true
                textField2.becomeFirstResponder()
            case textField4:
                textField3.isUserInteractionEnabled = true
                textField3.becomeFirstResponder()
            case textField5:
                textField4.isUserInteractionEnabled = true
                textField4.becomeFirstResponder()
            case textField6:
                textField5.isUserInteractionEnabled = true
                textField5.becomeFirstResponder()
            default:
                break
            }
        }
        else if text.utf16.count >= 1 {
            if text.utf16.count == 2{
                let str =  text
                let arr = str.map { String($0) }
                print(arr)
                text = arr[1]
                switch textField {
                case textField1:
                    textField1.text = ""
                    textField1.text = text
                    textField2.isUserInteractionEnabled = true
                    textField2.becomeFirstResponder()
                case textField6:
                    textField6.text = ""
                    textField6.text = text
                default:
                    break
                }
            }
            switch textField {
            case textField1:
                textField1.isUserInteractionEnabled = false
                textField2.isUserInteractionEnabled = true
                textField2.becomeFirstResponder()
            case textField2:
                textField2.isUserInteractionEnabled = false
                textField3.isUserInteractionEnabled = true
                textField3.becomeFirstResponder()
            case textField3:
                textField3.isUserInteractionEnabled = false
                textField4.isUserInteractionEnabled = true
                textField4.becomeFirstResponder()
            case textField4:
                textField4.isUserInteractionEnabled = false
                textField5.isUserInteractionEnabled = true
                textField5.becomeFirstResponder()
            case textField5:
                textField5.isUserInteractionEnabled = false
                textField6.isUserInteractionEnabled = true
                textField6.becomeFirstResponder()
            case textField6:
                textField6.resignFirstResponder()
            default:
                break
            }
        }
    }
}

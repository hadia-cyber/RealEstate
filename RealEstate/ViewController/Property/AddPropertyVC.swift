//
//  AddPropertyVC.swift
//  RealEstate
//
//  Created by TecSpine on 24/10/2021.
//

import UIKit
import iOSDropDown


var propertyType = ["Apartment", "Commercial", "House", "Land"]
var propertyPurposeType = ["Sale", "Rent"]
var propertyCondition = ["Furnished", "Semi-Furnished", "Un-Furnished"]

class AddPropertyVC: BaseClass {

    @IBOutlet weak var categoryDD: DropDown!
    @IBOutlet weak var purposeDD: DropDown!
    @IBOutlet weak var propertyNameFld: UITextField!
    @IBOutlet weak var propertyDesFld: UITextField!
    @IBOutlet weak var phoneFld: UITextField!
    @IBOutlet weak var propertyAddressFld: UITextField!
    
    @IBOutlet weak var latFld: UITextField!
    @IBOutlet weak var lngFld: UITextField!
    @IBOutlet weak var totalBedRoomsFld: UITextField!
    @IBOutlet weak var totalBathRoomsFld: UITextField!
    @IBOutlet weak var propertyAreaFld: UITextField!
    @IBOutlet weak var priceFld: UITextField!
    
    @IBOutlet weak var amenitiesFld: UITextField!
    @IBOutlet weak var furnishedDD: DropDown!
    
    
    @IBOutlet weak var featuredImage: UIImageView!
    @IBOutlet weak var floorPlanImage: UIImageView!
    @IBOutlet weak var galleryImage: UIImageView!
    
    
    var isFeatureImageAdded = false
    var isFloorPlanImageAdded = false
    var isGalleryImageAdded = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpCategory()
        setUpPropertyPurposeType()
        setUpPropertyCondition()
        setUpTapGesture()
    }
    
    func setUpCategory(){
        categoryDD.optionArray = propertyType
        categoryDD.didSelect { selectedText, index, id in
            self.categoryDD.text = selectedText
        }
    }
    
    func setUpPropertyPurposeType(){
        purposeDD.optionArray = propertyPurposeType
        purposeDD.didSelect { selectedText, index, id in
            self.purposeDD.text = selectedText
        }
    }
    
    func setUpPropertyCondition(){
        furnishedDD.optionArray = propertyCondition
        furnishedDD.didSelect { selectedText, index, id in
            self.furnishedDD.text = selectedText
        }
    }

    func setUpTapGesture(){
        
        featuredImage.isUserInteractionEnabled = true
        featuredImage.addGestureRecognizer(UITapGestureRecognizer.init(target: self, action: #selector(selectFeatureImage)))
        
        floorPlanImage.isUserInteractionEnabled = true
        floorPlanImage.addGestureRecognizer(UITapGestureRecognizer.init(target: self, action: #selector(selectFloorPlanImage)))
       
        galleryImage.isUserInteractionEnabled = true
        galleryImage.addGestureRecognizer(UITapGestureRecognizer.init(target: self, action: #selector(selectGalleryImage)))
        
    }
    
    @objc func selectFeatureImage(_ tap: UITapGestureRecognizer) {
        openImageResourse()
    }
    
    @objc func selectFloorPlanImage(_ tap: UITapGestureRecognizer) {
        openImageResourse()
    }
    
    @objc func selectGalleryImage(_ tap: UITapGestureRecognizer) {
        openImageResourse()
    }
    
    
    @IBAction func addProperty(_ sender: Any) {
        if isValid() {
            
        }
    }
    
    func isValid() -> Bool {
        guard !categoryDD.text!.isEmpty else {
            showAlert(message: "Please select property category")
            return false
        }
        
        guard !purposeDD.text!.isEmpty else {
            showAlert(message: "Please select property purpose type")
            return false
        }
        
        guard !propertyNameFld.text!.isEmpty else {
            showAlert(message: "Please enter property name")
            return false
        }
        
        guard !propertyDesFld.text!.isEmpty else {
            showAlert(message: "Please enter property description")
            return false
        }
        
        guard !phoneFld.text!.isEmpty else {
            showAlert(message: "Please enter phone no")
            return false
        }
        
        guard !propertyAddressFld.text!.isEmpty else {
            showAlert(message: "Please enter property address")
            return false
        }
        
        guard !latFld.text!.isEmpty else {
            showAlert(message: "Please enter property latitude")
            return false
        }
        
        guard !lngFld.text!.isEmpty else {
            showAlert(message: "Please enter property longitude")

            return false
        }
        
        guard !totalBedRoomsFld.text!.isEmpty else {
            showAlert(message: "Please enter total bed rooms")
            return false
        }
        
        guard !totalBathRoomsFld.text!.isEmpty else {
            showAlert(message: "Please enter total bath rooms")
            return false
        }
        
        guard !propertyAreaFld.text!.isEmpty else {
            showAlert(message: "Please enter property area")
            return false
        }
        
        guard !priceFld.text!.isEmpty else {
            showAlert(message: "Please enter price")
            return false
        }
        
        guard !amenitiesFld.text!.isEmpty else {
            showAlert(message: "Please enter amenities")
            return false
        }
        
        guard !furnishedDD.text!.isEmpty else {
            showAlert(message: "Please select property condition")
            return false
        }
        
        guard isFeatureImageAdded else {
            showAlert(message: "Please select feature image")
            return false
        }
        
        guard isFloorPlanImageAdded else {
            showAlert(message: "Please select floor image")
            return false
        }
        
        guard isGalleryImageAdded else {
            showAlert(message: "Please select gallery image")
            return false
        }
        
        return true
        
    }
    
}

extension AddPropertyVC: UIImagePickerControllerDelegate & UINavigationControllerDelegate {
    
    func openImageResourse(){
        let alert = UIAlertController(title: "", message: "Please Select an Option", preferredStyle: .actionSheet)
            
            alert.addAction(UIAlertAction(title: "Camera", style: .default , handler:{ (UIAlertAction)in
                let picker = UIImagePickerController()
                picker.sourceType = .camera
                picker.delegate = self
                picker.allowsEditing = false
                self.present(picker, animated: true)
            }))
            
            alert.addAction(UIAlertAction(title: "Photos", style: .default , handler:{ (UIAlertAction)in
                
                let picker = UIImagePickerController()
                picker.sourceType = .photoLibrary
                picker.delegate = self
                self.present(picker, animated: true)
                
            }))
            
            alert.addAction(UIAlertAction(title: "Dismiss", style: .cancel, handler:{ (UIAlertAction)in
               
            }))
            self.present(alert, animated: true, completion: {
                print("completion block")
            })
    }
    
    
    
    func imagePickerController(_ picker: UIImagePickerController,didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let image = info[.originalImage] as? UIImage
        if let image = image{
           
        } else{
            
        }
        self.dismiss(animated: true, completion: nil)
    }


}


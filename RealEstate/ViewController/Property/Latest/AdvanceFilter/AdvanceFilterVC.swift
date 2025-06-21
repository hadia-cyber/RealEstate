//
//  AdvanceFilterVC.swift
//  RealEstate
//
//  Created by TecSpine on 04/11/2021.
//

import UIKit

class AdvanceFilterVC: BaseClass {
    
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var minPriceFld: UITextField!
    @IBOutlet weak var maxPriceFld: UITextField!
    
    var  recommendOptionSelected = -1
    var  furnishingOptionSelected = -1
    var  typeOptionSelected = -1
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func navigateBack(_ sender: Any) {
        dismiss()
    }
    
    @IBAction func recommendedFilterOption(_ sender: Any) {
    }
    
    @IBAction func furnishingOption(_ sender: Any) {
    }
    
    @IBAction func propertyTypeOption(_ sender: Any) {
    }
    
    
    @IBAction func applyFilter(_ sender: Any) {
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
       let touch = touches.first
       if touch?.view != self.contentView {
        self.dismiss(animated: true, completion: nil)
        
       }
    }
    
}

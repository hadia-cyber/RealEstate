//
//  UITextFieldExtension.swift
//  RealEstate
//
//  Created by TecSpine on 27/10/2021.
//

import UIKit

extension UITextField{
    
   @IBInspectable var placeHolderColor: UIColor? {
        get {
            return self.placeHolderColor
        }
        set {
            self.attributedPlaceholder = NSAttributedString(string:self.placeholder != nil ? self.placeholder! : "", attributes:[NSAttributedString.Key.foregroundColor: newValue!])
        }
    }
    
}

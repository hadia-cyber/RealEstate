//
//  PropertyMainColCell.swift
//  RealEstate
//
//  Created by TecSpine on 06/11/2021.
//

import UIKit

class PropertyMainColCell: UICollectionViewCell {
    
    @IBOutlet weak var priceLbl: UILabel!
    @IBOutlet weak var propertyTypeLbl: UILabel!
    @IBOutlet weak var propertyNameLbl: UILabel!
    @IBOutlet weak var propertyLocationLbl: UILabel!
    @IBOutlet weak var favView: UIView!
    @IBOutlet weak var viewContent: UIView!
    @IBOutlet weak var favImage: UIImageView!
    @IBOutlet weak var propertyImage: UIImageView!
    
    override func awakeFromNib() {
        viewContent.layer.cornerRadius = 10.0
    }
    
}

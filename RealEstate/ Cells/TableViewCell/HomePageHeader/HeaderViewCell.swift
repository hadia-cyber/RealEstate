//
//  HeaderViewCell.swift
//  RealEstate
//
//  Created by TecSpine on 10/10/2021.
//

import Foundation
import UIKit

class HeaderViewCell: UITableViewCell {
    @IBOutlet weak var headerLbl: UILabel!
    @IBOutlet weak var viewAll: UIButton!
    
    override func awakeFromNib() {
        viewAll.layer.cornerRadius = 5.0
    }
}

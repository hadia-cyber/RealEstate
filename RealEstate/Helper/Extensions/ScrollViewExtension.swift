//
//  ScrollViewExtension.swift
//  RealEstate
//
//  Created by TecSpine on 27/10/2021.
//

import UIKit

extension UIScrollView {
    func updateContentView() {
        contentSize.height = subviews.sorted(by: { $0.frame.maxY < $1.frame.maxY }).last?.frame.maxY ?? contentSize.height
    }
}

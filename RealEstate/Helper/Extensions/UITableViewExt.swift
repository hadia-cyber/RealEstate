//
//  UITableViewExt.swift
//  RealEstate
//
//  Created by TecSpine on 28/10/2021.
//

import UIKit

extension UITableView {

    func getIndexPathForView(view: AnyObject) -> NSIndexPath? {
        let originInTableView = self.convert(CGPoint.zero, from: (view as! UIView))
        return self.indexPathForRow(at: originInTableView)! as NSIndexPath
    }

}

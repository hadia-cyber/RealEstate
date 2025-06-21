//
//  UIViewController+Ext.swift
//  RealEstate
//
//  Created by Hamza's Mac on 28/12/2021.
//


import UIKit
extension UIViewController
{
    func presentModal(viewController: UIViewController) {
        viewController.modalPresentationStyle = .overFullScreen
        present(viewController, animated: true, completion:nil)
    }
}

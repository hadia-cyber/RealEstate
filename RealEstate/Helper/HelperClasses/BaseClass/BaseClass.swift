//
//  BaseClass.swift
//  RealEstate
//
//  Created by TecSpine on 24/10/2021.
//

import UIKit

class BaseClass: UIViewController {
    
    var indictor = UIActivityIndicatorView()
    
    func showLoader(){
        indictor =  UIActivityIndicatorView(frame: CGRect(x: 10, y: 5, width: 90, height: 80))
        indictor.startAnimating()
        view.isUserInteractionEnabled = false
        indictor.color = UIColor.gray
        indictor.style = UIActivityIndicatorView.Style.large
        indictor.startAnimating()
        indictor.center = CGPoint(x: view.frame.size.width  / 2,
                                     y: view.frame.size.height / 2)
        view.addSubview(indictor)
    }
    
    func hideLoader(){
        view.isUserInteractionEnabled = true
        indictor.stopAnimating()
    }
    
    
    func pushController(storyboardName: String, viewController: String){
        let storyboard = UIStoryboard.init(name: storyboardName, bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: viewController)
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func popController(){
        self.navigationController?.popViewController(animated: true)
    }
    
    
    func dismiss() {
        self.dismiss(animated: true)
    }
    
    
    func getRandomString(length: Int) -> String {
      let letters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
      return String((0..<length).map{ _ in letters.randomElement()! })
    }

    func isValidEmail(email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,20}"
        let emailTest  = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: email)
    }
    
    func getCurrentMillis()->Int64 {
        return Int64(Date().timeIntervalSince1970 * 1000)
    }

    func setImgTintColor(imgView:UIImageView, color:UIColor){
        if(imgView.image == nil){
            return
        }
        imgView.image = imgView.image!.withRenderingMode(UIImage.RenderingMode.alwaysTemplate)
        imgView.tintColor = color
    }
    
    func LoadImg(url: URL?, image: UIImageView, _ placeholder: String = "placeholder") {
//        if url != nil {
//            if #available(iOS 13.0, *) {
//                image.af.setImage(withURL: url!,placeholderImage: UIImage(named: placeholder)?.withTintColor( #colorLiteral(red: 0.3333333433, green: 0.3333333433, blue: 0.3333333433, alpha: 1), renderingMode: .alwaysTemplate))
//            } else {
//                image.af.setImage(withURL: url!,placeholderImage: UIImage(named: placeholder))
//            }
//        } else {
//            image.image = UIImage(named: "")
//        }
        
    }
    
    //table extension
    func addTableContentSpace(tableView : UITableView, top: CGFloat, left: CGFloat, bottom: CGFloat, right: CGFloat){
        tableView.contentInset = UIEdgeInsets.init(top: top, left: left, bottom: bottom, right: right)
    }
    
    func registerTableCells(tableView :UITableView , RegisterXib : [String]){
        for indexObj in RegisterXib {
            tableView.register(UINib.init(nibName: indexObj, bundle: nil), forCellReuseIdentifier: indexObj)
        }
    }
    
    //collectionview extension
    func addCollectionContentSpace(collectionView : UICollectionView, top: CGFloat, left: CGFloat, bottom: CGFloat, right: CGFloat){
        collectionView.contentInset = UIEdgeInsets.init(top: top, left: left, bottom: bottom, right: right)
    }
    
    func registerCollectionCells(collectionView : UICollectionView, RegisterXib : [String]){
        for indexObj in RegisterXib {
            collectionView.register(UINib.init(nibName: indexObj, bundle: nil), forCellWithReuseIdentifier: indexObj)
        }
    }
}

// Alert
extension BaseClass {
    
    
    func showAlert(title: String = "", message: String){
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: AlertConstants.ok, style: .default, handler: nil)
          alertController.addAction(action)
          navigationController?.present(alertController, animated: true, completion: nil)
    }
    
    func showAlertWithHandler(title: String = "" , message: String, DismissButton : String = AlertConstants.ok, completion: ((_ status: Bool) -> Void)? = nil) {
           let alert = UIAlertController(title: title , message: message, preferredStyle: .alert)
           alert.addAction(UIAlertAction(title: DismissButton, style: .default) { action in
               alert.dismiss(animated: true, completion: nil)
               completion!(false)
           })
           self.present(alert, animated: true, completion: nil)
    }
}


extension BaseClass {
    
    
    func showToast(_ message : String, _ font: UIFont = .systemFont(ofSize: 13), duration: Double = 4.0) {

        let toastLabel = UILabel(frame: CGRect(
                                    x: 30,
                                    y: self.view.frame.size.height/2 - 20,
                                    width: self.view.frame.size.width - 60,
                                    height: 45))
        toastLabel.backgroundColor = UIColor.black.withAlphaComponent(0.6)
        toastLabel.textColor = UIColor.white
        toastLabel.font = font
        toastLabel.textAlignment = .center;
        toastLabel.text = message
        toastLabel.alpha = 1.0
        toastLabel.numberOfLines = 0
        toastLabel.layer.cornerRadius = 10;
        toastLabel.clipsToBounds  =  true
        self.view.addSubview(toastLabel)
        UIView.animate(withDuration: duration, delay: 0.1, options: .curveEaseOut, animations: {
             toastLabel.alpha = 0.0
        }, completion: {(isCompleted) in
            toastLabel.removeFromSuperview()
        })
    }
    

    func getViewController<T: UIViewController>(sbName: String, vcName: String) -> T {
        let sb = UIStoryboard(name: sbName, bundle: nil)
        let vc = sb.instantiateViewController(withIdentifier: vcName) as! T
        vc.modalTransitionStyle = UIModalTransitionStyle.crossDissolve
        return vc
    }
    
    func goTo(sbName sb : String = "Main",
              vcName: String,
              transitionStyle: UIModalTransitionStyle = .crossDissolve,
              presentationStyle: UIModalPresentationStyle = .fullScreen,
              completion: (()->Void)? = nil
    ){
        let vc: UIViewController = getViewController(sbName: sb, vcName: vcName)
        goTo(vc: vc, transitionStyle: transitionStyle, presentationStyle: presentationStyle, completion: completion)
    }
    
    func goTo(vc: UIViewController,
              transitionStyle: UIModalTransitionStyle = .crossDissolve,
              presentationStyle: UIModalPresentationStyle = .fullScreen,
              completion: (()->Void)? = nil
    ){
        vc.modalTransitionStyle = transitionStyle
        vc.modalPresentationStyle = presentationStyle
        if presentationStyle == .popover {
            vc.view.backgroundColor = UIColor.clear
        }
        self.present(vc, animated: true, completion: completion)
    }
    
    func showAlert<T: UIViewController>(sbName sb: String = "Main",
                                        vcName: String,
                                        transitionStyle: UIModalTransitionStyle = .crossDissolve,
                                        presentationStyle: UIModalPresentationStyle = .overCurrentContext,
                                        completion: (()->Void)? = nil
    ) -> T {
        let vc = getViewController(sbName: sb, vcName: vcName) as! T
        vc.modalTransitionStyle = transitionStyle
        vc.modalPresentationStyle = presentationStyle
        vc.view.backgroundColor = UIColor(named: "Transparent")
        self.present(vc, animated: true, completion: completion)
        return vc
    }
    
    func goAndDismissCurrent(sbName sb: String = "Main",
                             vcName: String,
                             transitionStyle: UIModalTransitionStyle = .crossDissolve,
                             presentationStyle: UIModalPresentationStyle = .fullScreen,
                             completion: (()->Void)? = nil
    ){
        weak var pvc = self.presentingViewController ?? self
        self.dismiss(animated: true, completion: {
            let vc = self.getViewController(sbName: sb, vcName: vcName)
            vc.modalTransitionStyle = transitionStyle
            vc.modalPresentationStyle = presentationStyle
            pvc?.present(vc, animated: true, completion: completion)
        })
    }
    
    func showAlertDialog(style: UIAlertController.Style,
                         title: String?,
                         message: String?,
                         actions: [UIAlertAction] = [UIAlertAction(title: "Okay", style: .default, handler: nil)], completion: (() -> Void)? = nil
    ) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: style)
        for action in actions {
            alert.addAction(action)
        }
        present(alert, animated: true, completion: completion)
    }
    
    func showInputAlertDialog(style: UIAlertController.Style,
                              title: String?,
                              message: String?,
                              inputHint: String?,
                              actions: [UIAlertAction] = [UIAlertAction(title: "Okay", style: .default, handler: nil)], completion: (() -> Void)? = nil
    ) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: style)
        alert.addTextField { (textField) in
            textField.placeholder = inputHint
        }
        for action in actions {
            alert.addAction(action)
        }
        present(alert, animated: true, completion: completion)
        alert.addAction(UIAlertAction(title: "Add", style: .default, handler: { [weak alert] (_) in
            let textField = alert!.textFields![0].text
            if textField?.count == 0 {
                return
            }
            //            var newPreset = Preset()
            //            newPreset.name = textField!
            //            self.presets.append(newPreset)
            //            self.updateNewData(preset: newPreset)
            //            self.setUIData()
        }))
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: { [weak alert] (_) in
            alert?.dismiss(animated: true, completion: nil)
        }))
        self.present(alert, animated: true, completion: nil)
    }
    
}


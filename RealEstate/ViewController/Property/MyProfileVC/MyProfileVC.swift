//
//  MyProfileVC.swift
//  RealEstate
//
//  Created by Hamza's Mac on 11/12/2021.
//

import UIKit
import SideMenu

class MyProfileVC: BaseClass {
    
    /* MARK:- Outlets and Properties */
    @IBOutlet weak var viewBgRound  : UIView!
    @IBOutlet weak var imageViewBg  : UIView!
    @IBOutlet weak var imageProfile : UIImageView!
    @IBOutlet weak var viewListing  : UIView!
    @IBOutlet weak var viewProfile  : UIView!
    @IBOutlet weak var viewRecent   : UIView!
    @IBOutlet weak var viewFavorites  : UIView!
    @IBOutlet weak var btnSettings   : UIButton!
    @IBOutlet weak var btnContact    : UIButton!
    @IBOutlet weak var btnCondition  : UIButton!
    @IBOutlet weak var btnLogout  : UIButton!
    
    var menu : SideMenuNavigationController?

    override func viewDidLoad() {
        super.viewDidLoad()
        setupSideMenu()
        setLayout()
    }
}

/* MARK:- Actions */
extension MyProfileVC{
    @IBAction func didTapSettings(_ sender : UIButton){
        goTo(sbName: "PropertyDesign", vcName: "SettingVC", transitionStyle: .coverVertical, presentationStyle: .fullScreen)
    }
    @IBAction func didTapContactUs(_ sender : UIButton){
        print("Contact us taaped")
        goTo(sbName: "PropertyDesign", vcName: "ContactUsVC", transitionStyle: .coverVertical, presentationStyle: .fullScreen)
    }
    @IBAction func didTapTerms(_ sender : UIButton){
        print("Terms tapped")
    }
    @IBAction func didTapLogout(_ sender : UIButton){
        print("Logout tapped")
    }
    @IBAction func didTapMenu(_ sender : UIButton){
        setupSideMenu()
        presentModal(viewController: menu!)
    }
}

/* MARK:- Extension */
extension MyProfileVC{
    func setLayout(){
        viewBgRound.layer.cornerRadius = 25.0
        viewBgRound.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        imageViewBg.layer.cornerRadius = imageViewBg.frame.size.height / 2
        imageProfile.layer.cornerRadius = imageProfile.frame.size.height / 2
        viewListing.layer.cornerRadius = 5.0
        viewProfile.layer.cornerRadius = 5.0
        viewRecent.layer.cornerRadius = 5.0
        viewFavorites.layer.cornerRadius = 5.0
        btnLogout.layer.cornerRadius = btnLogout.frame.size.height / 2
    }
}

// Side Menu
extension MyProfileVC {
    private func setupSideMenu() {
        let storyboard = UIStoryboard.init(name: "PropertyDesign", bundle: Bundle.main)
        if let vc = storyboard.instantiateViewController(withIdentifier: "DrawerVC") as? DrawerVC {
            vc.callback = self
            menu = SideMenuNavigationController(rootViewController: vc)
            menu?.settings = makeSettings()
            menu?.leftSide = true
            SideMenuManager.default.leftMenuNavigationController =  menu
            SideMenuManager.default.addPanGestureToPresent(toView: self.navigationController!.navigationBar)
            SideMenuManager.default.addScreenEdgePanGesturesToPresent(toView: self.navigationController!.view, forMenu: .left)
        }
    }
    private func makeSettings() -> SideMenuSettings {
        var presentationStyle = SideMenuPresentationStyle()
        presentationStyle = .viewSlideOutMenuIn
        presentationStyle.backgroundColor = .clear
        presentationStyle.onTopShadowOpacity = 0.5
        presentationStyle.onTopShadowRadius = 5
        presentationStyle.onTopShadowColor = .black
        presentationStyle.menuOnTop = true
        
        var settings = SideMenuSettings()
        settings.presentationStyle = presentationStyle
        settings.menuWidth = 300//traitCollection.isIphone ? view.bounds.width - 60 : 350
        return settings
    }
}

extension MyProfileVC: SideMenuCallback{
    func clicked(controller: String) {
        if controller == "Home"{
            goToHome()
        } else if controller == "Latest"{
            goToLatest()
        } else if controller == "All Properties"{
            goToAllPrperties()
        } else if controller == "Favorties" {
            goToFavorite()
        }  else if controller == "My Properties"{
            goToMyProperties()
        }else if controller == "Contact Us"{
            goToContactUs()
        }else if controller == "Settings"{
            goToSettings()
        }else if controller == "Login"{
            goToLogin()
        }
    }
    func goToHome(){
        
    }
    func goToLatest(){
        
    }
    func goToAllPrperties(){
        
    }
    func goToFavorite(){
        
    }
    func goToMyProperties(){
        
    }
    func goToContactUs(){
        
    }
    func goToSettings(){
        
    }
    func goToLogin(){
        
    }
}

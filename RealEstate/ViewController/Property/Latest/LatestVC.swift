//
//  LatestVC.swift
//  RealEstate
//
//  Created by TecSpine on 26/10/2021.
//

import UIKit
import SideMenu

class LatestVC: BaseClass {
    
   
    @IBOutlet weak var tableView: UITableView!
    
    var menu : SideMenuNavigationController?

    override func viewDidLoad() {
        super.viewDidLoad()
        setupSideMenu()
        registerNib()
    }
    
    func registerNib(){
        tableView.delegate = self
        tableView.dataSource = self
        registerTableCells(tableView: tableView, RegisterXib: [Identifiers.name.leftPropertyView, Identifiers.name.rightPropertyView])
    }

    @IBAction func didTapMenu(_ sender : UIButton){
        setupSideMenu()
        presentModal(viewController: menu!)
    }
    
    @IBAction func filterOption(_ sender: Any) {
        goTo(sbName: "PropertyDesign", vcName: "AdvanceFilterVC", transitionStyle: .coverVertical, presentationStyle: .overFullScreen, completion:  nil)
    }
    
    @IBAction func sortingOption(_ sender: Any) {
        goTo(sbName: "PropertyDesign", vcName: "SortingOptionVC" )
    }
    
}

extension LatestVC: UITableViewDelegate, UITableViewDataSource {


    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let odd =  indexPath.row % 2
        if odd == 0 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: Identifiers().leftPropertyView) else { return UITableViewCell() }
            return  cell
        } else {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: Identifiers().rightPropertyView) else { return UITableViewCell() }
            return  cell

        }
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = getViewController(sbName: "PropertyDesign", vcName: "PropertyDetailVC") 
        goTo(vc: vc)
    }
}

extension LatestVC{
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

extension LatestVC: SideMenuCallback{
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

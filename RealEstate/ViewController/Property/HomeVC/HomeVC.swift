//
//  HomeVC.swift
//  RealEstate
//
//  Created by TecSpine on 25/10/2021.
//

import UIKit
import SideMenu

class HomeVC: BaseClass {
    
    @IBOutlet weak var btnApartment  : UIButton!
    @IBOutlet weak var btnShops      : UIButton!
    @IBOutlet weak var btnRentOffice : UIButton!
    @IBOutlet weak var tableView: UITableView!
    
    var menu : SideMenuNavigationController?

    override func viewDidLoad() {
        super.viewDidLoad()
        layouts()
        registerNib()
        setupSideMenu()
    }
    
    func layouts(){
        btnApartment.layer.cornerRadius  = btnApartment.frame.size.height / 2
        btnShops.layer.cornerRadius      = btnShops.frame.size.height / 2
        btnRentOffice.layer.cornerRadius = btnRentOffice.frame.size.height / 2
    }
    
    func registerNib(){
        tableView.delegate = self
        tableView.dataSource = self
        tableView.sectionHeaderHeight = UITableView.automaticDimension
        tableView.estimatedSectionHeaderHeight = 50
        tableView.rowHeight = 240
        tableView.tableFooterView = UIView()
        registerTableCells(tableView: tableView, RegisterXib: ["HeaderViewCell"])
    }

}

/* MARK:- Extension */
extension HomeVC{
    @IBAction func didTapMenu(_ sender : UIButton){
        setupSideMenu()
        presentModal(viewController: menu!)
    }
    @IBAction func filterOption(_ sender: Any) {
        goTo(sbName: "PropertyDesign", vcName: "AdvanceFilterVC", transitionStyle: .coverVertical, presentationStyle: .overFullScreen, completion:  nil)
    }
}

// Side Menu
extension HomeVC {
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

extension HomeVC: SideMenuCallback{
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

extension HomeVC: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerCell = tableView.dequeueReusableCell(withIdentifier: "HeaderViewCell") as! HeaderViewCell
        if section == 0{
            headerCell.headerLbl.text = "Optium Property"
        }else if section == 1{
            headerCell.headerLbl.text = "Popular"
        }else if section == 2{
            headerCell.headerLbl.text = "Latest"
        }
        else{
            headerCell.headerLbl.text = ""
        }
        return headerCell
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "HomeCell") as! HomeCell
        return  cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
}

class HomeCell: UITableViewCell, UICollectionViewDelegate, UICollectionViewDataSource ,UICollectionViewDelegateFlowLayout{
    @IBOutlet weak var collectionView: UICollectionView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        registerNib()
    }
    
    func registerNib(){
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(UINib.init(nibName: "PropertyMainColCell", bundle: nil), forCellWithReuseIdentifier: "PropertyMainColCell")

        
//        if let flowLayout = collectionView?.collectionViewLayout as? UICollectionViewFlowLayout {
//          flowLayout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
//        }
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    //TODO:- set Collection View
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell  = collectionView.dequeueReusableCell(withReuseIdentifier: "PropertyMainColCell", for: indexPath) as! PropertyMainColCell
        return cell
     
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

        return CGSize(width: self.collectionView.bounds.width, height: 234)
    }
    
}

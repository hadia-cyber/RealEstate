//
//  SettingVC.swift
//  RealEstate
//
//  Created by TecSpine on 29/10/2021.
//

import UIKit

struct SettingOptionModel {
    var name: String
    var ViewControllerName: String
}

class SettingVC: BaseClass {
    
    @IBOutlet weak var tableView: UITableView!
    var settingOptionsList: [SettingOptionModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerNib()
        settingOptionsList = [SettingOptionModel(name: "About Us", ViewControllerName: "AboutUsVC"), SettingOptionModel(name: "Privacy Policy", ViewControllerName: "PrivacyPolicyVC"), SettingOptionModel(name: "More Apps", ViewControllerName: ""), SettingOptionModel(name: "Share App", ViewControllerName: ""), SettingOptionModel(name: "Rate App", ViewControllerName: "")]

    }
    
    func registerNib(){
        tableView.delegate = self
        tableView.dataSource = self
        registerTableCells(tableView: tableView, RegisterXib: [Identifiers.name.settingOption])
    }

}

extension SettingVC{
    @IBAction func didTapBack(_ sender : UIButton){
        print("Back tapped")
        dismiss()
    }
}

extension SettingVC: UITableViewDelegate, UITableViewDataSource {


    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return settingOptionsList.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Identifiers.name.settingOption) as! SettingOptionCell
        cell.navbarLbl.text = settingOptionsList[indexPath.row].name
        return  cell
        
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    }

}

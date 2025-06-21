//
//  SortingOptionVC.swift
//  RealEstate
//
//  Created by TecSpine on 03/11/2021.
//

import UIKit

class SortingOptionVC:  BaseClass {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var contentView: UIView!
    
    var selectedOption = 0
    var sortingOptions = [ "Latest", "Price - High To Low", "Price -  Low To High", "Distance" ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerNib()
    }
    
    func registerNib(){
        tableView.delegate = self
        tableView.dataSource = self
    }

}

extension SortingOptionVC: UITableViewDelegate, UITableViewDataSource {


    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sortingOptions.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: Identifiers().sortingOption) as! SortingOptionCell
        let filter = sortingOptions[indexPath.row]
        cell.optionLbl.text = filter
        cell.optionBtn.setImage( #imageLiteral(resourceName: "ic_phone")
            , for: .normal)
        if selectedOption == indexPath.row {
            cell.optionBtn.setImage( #imageLiteral(resourceName: "ic_stat_onesignal_default")
                , for: .normal)
        }
        
        cell.optionBtn.isUserInteractionEnabled = true
        cell.optionBtn.tag = indexPath.row
        cell.optionBtn.addTarget(self, action: #selector(selectOption), for: .touchUpInside)
        return  cell
    }
    
    @objc func selectOption(_ tap : UIButton) {
        selectedOption = tap.tag
        tableView.reloadData()
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    }
}

extension SortingOptionVC {

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
       let touch = touches.first
       if touch?.view != self.contentView {
        self.dismiss(animated: true, completion: nil)
        
       }
    }
}



class SortingOptionCell: UITableViewCell {
    @IBOutlet weak var optionBtn: UIButton!
    @IBOutlet weak var optionLbl: UILabel!
}

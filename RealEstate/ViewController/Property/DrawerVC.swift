//
//  DrawerVC.swift
//  RealEstate
//
//  Created by Hamza's Mac on 16/12/2021.
//

import UIKit

class DrawerCell : UITableViewCell{
    /* MARK:- Outlets and Properties */
    @IBOutlet weak var rowImage : UIImageView!
    @IBOutlet weak var rowLabel : UILabel!
}

class DrawerVC: UIViewController {

    struct MenuItems {
        let title:String
        let storyBoardID:String?
        let image: UIImage!
    }
    
    /* MARK:- Outlets and Properties */
    @IBOutlet weak var tvMenu : UITableView!
    
    public var callback:SideMenuCallback?
    let arrMenu: [MenuItems] =
        [MenuItems(title: "Home", storyBoardID: "", image: #imageLiteral(resourceName: "ic_onesignal_large_icon_default")),
         MenuItems(title: "Latest", storyBoardID: "", image: #imageLiteral(resourceName: "ic_onesignal_large_icon_default")),
         MenuItems(title: "All Properties", storyBoardID: "", image: #imageLiteral(resourceName: "ic_onesignal_large_icon_default")),
         MenuItems(title: "Favorties", storyBoardID: "", image: #imageLiteral(resourceName: "ic_onesignal_large_icon_default")),
         MenuItems(title: "My Properties", storyBoardID: "", image: #imageLiteral(resourceName: "ic_onesignal_large_icon_default")),
         MenuItems(title: "Contact Us", storyBoardID: "", image: #imageLiteral(resourceName: "ic_onesignal_large_icon_default")),
         MenuItems(title: "Settings", storyBoardID: "", image: #imageLiteral(resourceName: "ic_onesignal_large_icon_default")),
         MenuItems(title: "Login", storyBoardID: "", image: #imageLiteral(resourceName: "ic_onesignal_large_icon_default"))]
    
    var rowLabelArr = ["Home", "Latest","All Properties", "Favorties", "My Properties", "Contact Us", "Settings", "Login"]
    var rowImageArr = ["app_icon", "app_icon", "app_icon","app_icon","app_icon", "app_icon", "app_icon","app_icon","app_icon"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension DrawerVC: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrMenu.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DrawerCell") as! DrawerCell
        cell.rowLabel.text = arrMenu[indexPath.row].title
        cell.rowImage.image = arrMenu[indexPath.row].image
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    
        if tableView == tvMenu{
            print(indexPath.row)
            if indexPath.row == 0{
                dismiss(animated: true, completion: {
                            self.callback!.clicked(controller:"Home")
                        })
            }
            if indexPath.row == 1{
                dismiss(animated: true, completion: {
                            self.callback!.clicked(controller:"Latest")
                        })
            }
            if indexPath.row == 2{
                dismiss(animated: true, completion: {
                            self.callback!.clicked(controller:"All Properties")
                        })
            }
            if indexPath.row == 3{
                dismiss(animated: true, completion: {
                            self.callback!.clicked(controller:"Favorties")
                        })
            }
            if indexPath.row == 4{
                dismiss(animated: true, completion: {
                            self.callback!.clicked(controller:"My Properties")
                        })
            }
            if indexPath.row == 5{
                dismiss(animated: true, completion: {
                            self.callback!.clicked(controller:"Contact Us")
                        })
            }
            if indexPath.row == 6{
                dismiss(animated: true, completion: {
                            self.callback!.clicked(controller:"Settings")
                        })
            }
            if indexPath.row == 7{
                dismiss(animated: true, completion: {
                            self.callback!.clicked(controller:"Login")
                        })
            }

        }
    }
}

//
//  PropertyDetailVC.swift
//  RealEstate
//
//  Created by TecSpine on 04/11/2021.
//

import UIKit

class PropertyDetailVC: BaseClass {
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var scrollView: UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerNib()
        scrollView.updateContentView()
    }
    
    
    func registerNib(){
        collectionView.delegate = self
        collectionView.dataSource = self
        registerCollectionCells(collectionView: collectionView, RegisterXib: [Identifiers.name.beds])
    }
    
    func setUpGesture(){
        
    }
    
    @IBAction func didTapBack(_ sender : UIButton){
        dismiss(animated: false)
    }

}

extension PropertyDetailVC:  UICollectionViewDelegate, UICollectionViewDataSource ,UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    //TODO:- set Collection View
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell  = collectionView.dequeueReusableCell(withReuseIdentifier: "BedsCell", for: indexPath) as! BedsCell
        return cell
     
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

        let noOfCellsInRow = 4

        let flowLayout = collectionViewLayout as! UICollectionViewFlowLayout

        let totalSpace = flowLayout.sectionInset.left
            + flowLayout.sectionInset.right
            + (flowLayout.minimumInteritemSpacing * CGFloat(noOfCellsInRow - 1))

        let size = Int((collectionView.bounds.width - totalSpace) / CGFloat(noOfCellsInRow))

        return CGSize(width: size, height: 80)
    }
}


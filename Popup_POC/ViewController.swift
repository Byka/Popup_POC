//
//  ViewController.swift
//  Popup_POC
//
//  Created by Srinivas Byka on 5/29/18.
//  Copyright © 2018 JNET Technologies. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBAction func tableButtonAction(_ sender: Any) {
        
        let collectionViewWidth = 120
        
        let tableWidth = tableView.frame.size.width
        
        if tableWidth == 0{
            UIView.animate(withDuration: 1.5, animations: {
               
                if self.collectionView.frame.size.height > 0{
                    self.collectionViewheigthConstraints.constant = 128
                }
                
                self.tableViewWidthConstraints.constant = self.view.frame.size.width/2 // Some value
                self.view.layoutIfNeeded()
            })
            
        }else{
            UIView.animate(withDuration: 1.5, animations: {
                
                if self.collectionView.frame.size.height > 0{
                    self.collectionViewheigthConstraints.constant = 60
                    self.tableViewWidthConstraints.constant = 0 // Some value

                }else{
                    self.collectionViewheigthConstraints.constant = 0

                    self.tableViewWidthConstraints.constant = 0 // Some value
                }
                
                self.view.layoutIfNeeded()
            })
        }
        
    }
    
    
    @IBOutlet weak var tableViewWidthConstraints: NSLayoutConstraint!
    
    @IBOutlet weak var tableView: UIView!
    
    
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    @IBOutlet weak var collectionViewheigthConstraints: NSLayoutConstraint!
    
    @IBAction func collectionViewButtonAction(_ sender: Any) {
        
        let collectionViewheight = collectionView.frame.size.height
        
        
        //60
        //120
        
        if collectionViewheight > 0{
           
            UIView.animate(withDuration: 1.5, animations: {
                
               
                self.collectionViewheigthConstraints.constant = 0
                self.view.layoutIfNeeded()
            })
            
        }else{
            UIView.animate(withDuration: 1.5, animations: {
                if self.tableView.frame.size.width == 0{
                    
                    //self.collectionViewheigthConstraints.constant = 60
                    
                    self.collectionViewheigthConstraints.constant = 60
                    
                }else{
                    self.collectionViewheigthConstraints.constant = 128
                }
                self.view.layoutIfNeeded()
            })
        }
    }
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        /*
        let myview = UIView()
        myview.frame = CGRect(x: 0 , y: 0 , width: self.view.frame.size.width, height: 150)
        myview.backgroundColor = UIColor.red
        self.view .addSubview(myview)
        self.view.bringSubview(toFront: myview)
        */
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}



extension ViewController : UICollectionViewDataSource {
    
    
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        //retur1 mainContens.count
        return 1//mainContens.count
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        
        return 6
    }
    
    func getRandomColor() -> UIColor{
        
        let randomRed:CGFloat = CGFloat(drand48())
        
        let randomGreen:CGFloat = CGFloat(drand48())
        
        let randomBlue:CGFloat = CGFloat(drand48())
        
        return UIColor(red: randomRed, green: randomGreen, blue: randomBlue, alpha: 1).withAlphaComponent(0.9)
        
    }
    
    internal func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellIdentifier",for:indexPath as IndexPath)
        
        
        cell.backgroundColor = getRandomColor()
        
        
        return cell
    }
    
    
}


// MARK:- UICollectionViewDelegate Methods

extension ViewController : UICollectionViewDelegate {
   
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAtIndex section: Int) -> UIEdgeInsets {
        
        let CellWidth = 50
        let CellCount = 6
        let CellSpacing = 5
        
        let totalCellWidth = CellWidth * CellCount
        let totalSpacingWidth = CellSpacing * (CellCount - 1)
        
        let leftInset = (collectionView.frame.size.width - CGFloat(totalCellWidth + totalSpacingWidth)) / 2
        let rightInset = leftInset
        
        return UIEdgeInsetsMake(0, leftInset, 0, rightInset)
    }
    
    
//        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
//            return UIEdgeInsetsMake(0,0,0,5)
//        }
//
    
    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
//        return 6
//    }
//
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
//        return 6
//
//    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(indexPath.row)
        
        
    }
    

    
}

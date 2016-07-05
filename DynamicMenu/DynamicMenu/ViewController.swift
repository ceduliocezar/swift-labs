//
//  ViewController.swift
//  DynamicMenu
//
//  Created by Cedulio Cezar on 05/07/16.
//  Copyright © 2016 Cedulio Cezar. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var collection: UICollectionView!
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        collection.collectionViewLayout.invalidateLayout()
    }


}


extension ViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int{
        return 13
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell{
        if indexPath.row % 7 == 0{
            return collectionView.dequeueReusableCellWithReuseIdentifier("square",forIndexPath: indexPath)
        }else{
            return collectionView.dequeueReusableCellWithReuseIdentifier("line" , forIndexPath: indexPath)
        }
    }
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 5
    }
    
    func collectionView(collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, atIndexPath indexPath: NSIndexPath)-> UICollectionReusableView{
        
        let header = collectionView.dequeueReusableSupplementaryViewOfKind(UICollectionElementKindSectionHeader, withReuseIdentifier: "header", forIndexPath: indexPath)
        
        return header
    }
    
    func collectionView(collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                               sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        
        if indexPath.row % 7 == 0{
            
            return CGSizeMake(collectionView.bounds.size.width, CGFloat(50))
        }else{
            return CGSizeMake(100, 100)
        }
    }
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        print("didSelectItemAtIndexPath \(indexPath.section) row \(indexPath.row) " )
    }

}


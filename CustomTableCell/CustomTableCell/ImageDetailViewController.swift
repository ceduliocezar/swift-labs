//
//  ImageDetailViewController.swift
//  CustomTableCell
//
//  Created by Cedulio Cezar on 25/04/16.
//  Copyright © 2016 Cedulio Cezar. All rights reserved.
//

import Foundation
import UIKit

class ImageDetailViewController: UIViewController, UIScrollViewDelegate{
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var imageView: UIImageView!
    
    weak var detail: Detail!
    
    override func viewDidLoad() {
        
        self.scrollView.minimumZoomScale =  1.0
        self.scrollView.maximumZoomScale =  6.0
        
        let doubleTap = UITapGestureRecognizer(target: self, action: #selector(ImageDetailViewController.zoom(_:)))
        doubleTap.numberOfTapsRequired = 2
        doubleTap.numberOfTouchesRequired = 1
        scrollView!.addGestureRecognizer(doubleTap)
        
        imageView.image = detail!.image
    }
    
    func zoom(tapGesture: UITapGestureRecognizer) {
        if (self.scrollView!.zoomScale == self.scrollView!.minimumZoomScale) {
            let center = tapGesture.locationInView(self.scrollView!)
            let size = self.imageView!.image!.size
            let zoomRect = CGRectMake(center.x, center.y, (size.width / 4), (size.height / 4))
            self.scrollView!.zoomToRect(zoomRect, animated: true)
        } else {
            self.scrollView!.setZoomScale(self.scrollView!.minimumZoomScale, animated: true)
        }
    }

    
    func viewForZoomingInScrollView(scrollView: UIScrollView) -> UIView? {
        return self.imageView
    }
    
    
    
}

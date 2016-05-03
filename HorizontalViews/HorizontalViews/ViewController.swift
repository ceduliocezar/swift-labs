//
//  ViewController.swift
//  HorizontalViews
//
//  Created by Cedulio Cezar on 02/05/16.
//  Copyright © 2016 Cedulio Cezar. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var myView: UIView!
    
    var numberOfColumns = 6
    
    override func viewDidLoad() {
        super.viewDidLoad()
        draw()
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(ViewController.rotated), name: UIDeviceOrientationDidChangeNotification, object: nil)
    }
    
    @IBAction func click(sender: AnyObject) {
        draw()
    }
    
    func rotated(){
        draw()
    }
    
    func draw(){
        print(myView.frame.size.width)
        
        removeAllSubViews(myView)
        
        let totalHeight =  myView.frame.height
        let labelWidth = calculateLabelWidth(numberOfColumns, viewContainer: myView)
        
        for index in 0..<numberOfColumns {
            let label = createLabel(labelWidth, index: index, totalHeight: totalHeight)
            myView.addSubview(label)
        }
        
        myView.layoutIfNeeded()
    }
    
    func createLabel(labelWidth: CGFloat, index: Int, totalHeight: CGFloat) -> UILabel{
        
        let distanceFromX = calculateDistanceFromX(labelWidth, index: index)
        
        let rect = CGRect(x: distanceFromX, y: 0, width: labelWidth, height: totalHeight)
        
        let label = UILabel(frame: rect)
        label.textAlignment = .Center
        
        label.text = "LABEL \(index)"
        label.backgroundColor = getRandomColor()
        
        return label
    }
    
    func calculateDistanceFromX(width: CGFloat, index: Int) -> CGFloat{
        return CGFloat(width * CGFloat(index))
    }
    
    func calculateLabelWidth(numberOfColumns: Int, viewContainer: UIView) -> CGFloat{
        return viewContainer.frame.width / CGFloat(numberOfColumns)
    }
    
    func removeAllSubViews(view: UIView){
        view.subviews.forEach({ $0.removeFromSuperview() })
    }
    
    func getRandomColor() -> UIColor{
        
        var randomRed:CGFloat = CGFloat(drand48())
        
        var randomGreen:CGFloat = CGFloat(drand48())
        
        var randomBlue:CGFloat = CGFloat(drand48())
        
        return UIColor(red: randomRed, green: randomGreen, blue: randomBlue, alpha: 1.0)
        
    }



}


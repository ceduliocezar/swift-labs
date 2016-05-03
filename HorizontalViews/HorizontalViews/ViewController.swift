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
                print(myView.frame.size.width)
        desenhar()


    }
    @IBAction func click(sender: AnyObject) {
        print(myView.frame.width)
        desenhar()
        
    }
    
    func desenhar(){
        
        
        
        //        let label = UILabel()
        //        label.text = "LABEL"
        //        label.backgroundColor =  getRandomColor()
        //
        //
        //
        //        myView.addSubview(label)
        //
        //        label.leadingAnchor.constraintEqualToAnchor(myView.leadingAnchor).active = true
        //        label.topAnchor.constraintEqualToAnchor(myView.topAnchor).active = true
        //        label.bottomAnchor.constraintEqualToAnchor(myView.bottomAnchor).active = true
        //        label.translatesAutoresizingMaskIntoConstraints = false
        //        label.frame = CGRectMake(0, 0, myView.frame.width, myView.frame.height)
        //        label.layoutIfNeeded()
        //
        //
        //        let label2 = UILabel()
        //        label2.text = "LABEL2"
        //        label2.backgroundColor =  getRandomColor()
        //
        //
        //
        //        myView.addSubview(label2)
        //
        //        label2.leadingAnchor.constraintEqualToAnchor(label.trailingAnchor).active = true
        //        label2.trailingAnchor.constraintEqualToAnchor(myView.trailingAnchor).active = true
        //        label2.topAnchor.constraintEqualToAnchor(myView.topAnchor).active = true
        //        label2.bottomAnchor.constraintEqualToAnchor(myView.bottomAnchor).active = true
        //        label2.translatesAutoresizingMaskIntoConstraints = false
        
        
        
        //        imageView.frame = CGrectMake(x,y imageView.frame.width*0.2,50);
        
        myView.subviews.forEach({ $0.removeFromSuperview() })
        
        let totalWidth = myView.frame.width
        let totalHeight =  myView.frame.height
        
        let labelWidth = totalWidth/CGFloat(numberOfColumns)
        
        for index in 0..<numberOfColumns {
            
            let rect = CGRect(x: CGFloat(labelWidth*CGFloat(index)), y: 0, width: labelWidth, height: totalHeight)
            
            let label = UILabel(frame: rect)
            label.text = "LABEL \(index)"
            label.backgroundColor = getRandomColor()
            
            myView.addSubview(label)
            
            //            if myView.subviews.count == 1 {
            //                label.leadingAnchor.constraintEqualToAnchor(myView.leadingAnchor).active = true
            //            }else{
            //                label.leadingAnchor.constraintEqualToAnchor(myView.subviews[index-1].trailingAnchor).active = true
            //            }
            //
            //            label.topAnchor.constraintEqualToAnchor(myView.topAnchor).active = true
            //            label.bottomAnchor.constraintEqualToAnchor(myView.bottomAnchor).active = true
            //            label.translatesAutoresizingMaskIntoConstraints = false
            
        }
        
        myView.layoutIfNeeded()
    }
    
    func getRandomColor() -> UIColor{
        
        var randomRed:CGFloat = CGFloat(drand48())
        
        var randomGreen:CGFloat = CGFloat(drand48())
        
        var randomBlue:CGFloat = CGFloat(drand48())
        
        return UIColor(red: randomRed, green: randomGreen, blue: randomBlue, alpha: 1.0)
        
    }



}


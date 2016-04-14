//
//  ViewController.swift
//  BullsEye
//
//  Created by Cedulio Cezar on 14/04/16.
//  Copyright © 2016 Cedulio Cezar. All rights reserved.
//

import UIKit
import Foundation

class ViewController: UIViewController {
    
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var targetField: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var roundLabel: UILabel!
    
    var currentValue = 0
    var targetValue = 0
    var score = 0
    var round = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        startOver()
        setImagesOnSlider()
    }
    
    func setImagesOnSlider(){
        let thumbImageNormal = UIImage(named: "SliderThumb-Normal")
        
        slider.setThumbImage(thumbImageNormal, forState: .Normal)
        let thumbImageHighlighted = UIImage(named: "SliderThumb-Highlighted")
        
        slider.setThumbImage(thumbImageHighlighted, forState: .Highlighted)
        let insets = UIEdgeInsets(top: 0, left: 14, bottom: 0, right: 14)
        
        
        if let trackLeftImage = UIImage(named: "SliderTrackLeft") { let trackLeftResizable =
            trackLeftImage.resizableImageWithCapInsets(insets)
            
            slider.setMinimumTrackImage(trackLeftResizable, forState: .Normal)
        }
        if let trackRightImage = UIImage(named: "SliderTrackRight") {
            let trackRightResizable = trackRightImage.resizableImageWithCapInsets(insets)
            slider.setMaximumTrackImage(trackRightResizable, forState: .Normal)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func showAlert(){
        
        let points = calculatePoints()
        
        score += points
        
        
        let title =  getTitleBasedOnPoints(points)
        
        let message = "You scored \(points) points"
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: .Alert)
        
        let action = UIAlertAction(title: "OK", style: .Default, handler: {action in
            self.startNewRound()
            self.updateLabels()
        })
        
        alert.addAction(action)
        
        presentViewController(alert, animated: true, completion: nil)
    }
    
    func getTitleBasedOnPoints(points: Int) -> String{
        if points == 100{
            return "Perfect"
        }else if points >= 95{
            return "You almost had it!"
        }else if points > 10{
            return "Pretty good!"
        }else{
            return "Not even close..."
        }
        
    }
    
    func calculatePoints() -> Int{
        return 100 - abs(currentValue - targetValue)
    }
    
    @IBAction func sliderMoved(slider: UISlider){
       currentValue =  lroundf(slider.value)
    }
    
    func startNewRound(){
        targetValue = generateNewTargetValue()
        currentValue =  50
        slider.value = Float(currentValue)
        round += 1
    }
    
    func generateNewTargetValue() -> Int{
        return 1  + Int(arc4random_uniform(100))
    }
    
    func updateLabels(){
        targetField.text = String(targetValue)
        scoreLabel.text = String(score)
        roundLabel.text = String(round)
    }
    
    @IBAction func startOver(){
        score = 0
        round = 0
        startNewRound()
        updateLabels()
    }


}


//
//  ViewController.swift
//  Bullseye
//
//  Created by Subhash  on 12/4/19.
//  Copyright © 2019 Subhash . All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var currvalue : Int=0
    var targetValue:Int = 0
    var score=0
    var round=0
  
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var targetLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    
    @IBOutlet weak var roundLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let roundedValue = slider.value.rounded()
        currvalue=Int(roundedValue)
         targetValue = Int.random(in: 1...100)
        startnewGame()
    }
    @IBAction func showAlert(){
        let diff=abs(targetValue-currvalue)
        var s=""
        if diff==0{
            s="Perfect"
        }
        else if diff>=1 {
            if diff>11{
                 s="Try again , You can do more better"
            }
            else {
            s="You are almost it"
            }
        }
        
        score+=100-diff
    round+=1
        
        
        let message = "You scored \(100-diff)"
       let alert=UIAlertController(title: s , message: message, preferredStyle: .alert)
        let action=UIAlertAction(title: "OK", style: .default, handler: {
            action in
            self.startnewGame()
        } )
        
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
      
    }
    @IBAction func slidermove(_ slider:UISlider){
        
     let roundedValue = slider.value.rounded()
         currvalue=Int(roundedValue)
    }
    func startnewGame(){
        targetValue=Int.random(in: 1...100)
        currvalue=50
        slider.value=Float(currvalue)
        updateLabels()
    }
    
    func updateLabels(){
        targetLabel.text=String(targetValue)
        scoreLabel.text=String(score)
        roundLabel.text=String(round)
        
    }
    @IBAction func startOver(){
        score=0
        round=0
        startnewGame()
    }
}


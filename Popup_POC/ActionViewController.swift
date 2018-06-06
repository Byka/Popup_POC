//
//  ActionViewController.swift
//  Popup_POC
//
//  Created by Srinivas Byka on 6/6/18.
//  Copyright © 2018 JNET Technologies. All rights reserved.
//

import UIKit

class ActionViewController: UIViewController {
    @IBOutlet weak var sampleTextField: UITextField!
    
    @IBOutlet weak var clickButton: UIButton!
    
    @IBAction func clickButtonAction(_ sender: Any) {
        sampleTextField.text = ""
        totalTime = 5
        startTimer()
    }
    
    var countdownTimer: Timer!
    var totalTime = 5
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    //MARK: Countdown Timer for auto dialing
    /*******************************************
     NEED TO DISPLAY SECONDS AS COUTDOWN NUMBER
     *******************************************/
    func startTimer() {
        countdownTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateTime), userInfo: nil, repeats: true)
    }
    
    @objc func updateTime() {
        
        let value: String = timeFormatted(totalTime)
        
        sampleTextField.text = sampleTextField.text! + value
        
        self.clickButton.setTitle(timeFormatted(totalTime), for: .normal)
        
        
        
        if totalTime != 0 {
            totalTime -= 1

        } else {
            print("Time Closed")
            
            endTimer()
        }
    }
    
    func endTimer() {
        countdownTimer.invalidate()
        self.clickButton.setTitle("Click", for: .normal)

    }
    
    func timeFormatted(_ totalSeconds: Int) -> String {
        //        let seconds: Int = totalSeconds % 60
        //        let minutes: Int = (totalSeconds / 60) % 60
        //     let hours: Int = totalSeconds / 3600
        //        return String(format: "%02d:%02d", minutes, seconds)
        
        return String(format: "%d", totalSeconds)
        
    }
    /*----------------------------------------------------*/

}

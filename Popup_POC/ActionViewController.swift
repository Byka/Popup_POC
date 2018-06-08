//
//  ActionViewController.swift
//  Popup_POC
//
//  Created by Srinivas Byka on 6/6/18.
//  Copyright © 2018 JNET Technologies. All rights reserved.
//

import UIKit

class ActionViewController: UIViewController, NSURLConnectionDelegate {
    @IBOutlet weak var sampleTextField: UITextField!
    
    @IBOutlet weak var clickButton: UIButton!
    
    @IBAction func clickButtonAction(_ sender: Any) {
        
//        if let name = nametextField.text {
//            if let address = addressTextField.text {
//                print("My name is \(name) and my address is \(address)")
//            }
//        }
        
        guard let name1 = nametextField.text, name1 != "" else{
            print("No Name to print")
            return
        }
        
        guard let address1 = addressTextField.text, address1 != "" else {
            print("No address to print")
            return
        }
        print("My name is \(name1) and my address is \(address1)")
        
        
        
        sampleTextField.text = ""
        totalTime = 5
        startTimer()
    }
    
    var countdownTimer: Timer!
    var totalTime = 5
    
    
    
    @IBOutlet weak var nametextField: UITextField!
    
    
    @IBOutlet weak var addressTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // Do any additional setup after loading the view.
        connect(query: "http://www.google.com")
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func connect(query:NSString) {

        
        
        let urlLink: URL = URL(string: "https://codewithchris.com/tutorial-how-to-use-ios-nsurlconnection-by-example/")!
       
        let urlrequest: URLRequest = URLRequest(url: urlLink)
        
        let connection: NSURLConnection? = NSURLConnection(request: urlrequest, delegate: self, startImmediately: true)
        connection?.start()
        
        
        //var connection: NSURLConnection = NSURLConnection(request: request, delegate: self, startImmediately: false)

        
    }
    
    
    func connection(didReceiveResponse: NSURLConnection!, didReceiveResponse response: URLResponse!) {
        print("didReceiveResponse")
    }
    
    func connection(connection: NSURLConnection!, didReceiveData conData: NSData!) {
        print(conData)
    }
    
    func connectionDidFinishLoading(connection: NSURLConnection!) {
        print("Finish")
    }

    
   
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

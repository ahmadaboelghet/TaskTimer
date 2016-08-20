//
//  TimerViewController.swift
//  TaskTimer
//
//  Created by Ahmad Aboelghet on 8/20/16.
//  Copyright © 2016 Ahmad Aboelghet. All rights reserved.
//

import UIKit

class TimerViewController: UIViewController  {
    
    var timer = NSTimer()

    var minutes:Int = 0
    var seconds :Int = 0
    var hours :Int = 0
    
    var stopwatchstring :String
    = ""
    
    
    var startstop : Bool = true
    var lapReset : Bool = false
    
    @IBOutlet weak var Startbutton: UIButton!
    @IBOutlet weak var LapButton: UIButton!
    @IBOutlet weak var TimeLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    TimeLabel.text = "00.00.00"

    }
   
    @IBAction func StartStop(sender: AnyObject) {
        if startstop == true{
            timer = NSTimer.scheduledTimerWithTimeInterval(0.01, target: self, selector: "updatestopwatch", userInfo: nil, repeats: true)
            startstop = false
            Startbutton.setImage(UIImage(named: "stop"), forState:UIControlState.Normal)
            
            LapButton.setImage(UIImage(named: "Lap"), forState: UIControlState.Normal)
            lapReset = true
            
        }else{
            timer.invalidate()
            startstop = true
            Startbutton.setImage(UIImage(named: "start"), forState: UIControlState.Normal)
            LapButton.setImage(UIImage(named: "Reset"), forState: UIControlState.Normal)
            lapReset = false
        }
    }
    @IBAction func LapReset(sender: AnyObject) {
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func updatestopwatch()
    {
        seconds += 1
        
        if (seconds == 60)
        {
            minutes += 1
            seconds = 0
        }
        if minutes == 60
        {
            minutes == 0
            hours += 1
        }
        let secondsstring = seconds > 9 ? "\(seconds)": "0\(seconds)"
        let minutesstring = minutes > 9 ? "\(minutes)": "0\(minutes)"
        let hoursstring = hours > 9 ? "\(hours)": "0\(hours)"
        
        stopwatchstring = "\(hoursstring):\(minutesstring):\(secondsstring)"
        TimeLabel.text = stopwatchstring

    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

//
//  AddViewController.swift
//  TaskTimer
//
//  Created by Ahmad Aboelghet on 8/20/16.
//  Copyright © 2016 Ahmad Aboelghet. All rights reserved.
//

import UIKit

class AddViewController: UIViewController {
    
    @IBOutlet weak var Textfield: UITextField!
    
    @IBOutlet weak var Textview: UITextView!
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
    }


    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func CalcButton(sender: AnyObject) {
        
        
        var userDefaults : NSUserDefaults = NSUserDefaults.standardUserDefaults()
        
        var Itemlist : NSMutableArray? = (userDefaults.objectForKey("itemList") as? NSMutableArray)!
        
        var dataset :NSMutableDictionary!
        
        
        
        dataset.setObject(Textfield.text!, forKey: "itemTitle")
        dataset.setObject(Textview.text!, forKey: "itemNote")
        
        if ((Itemlist) != nil){
            
            var newMutableList : NSMutableArray = NSMutableArray()
            for dic : AnyObject in Itemlist!{
                
                newMutableList.addObject(dic as! NSMutableArray)
            }
            userDefaults.removeObjectForKey("itemlist")
            newMutableList.addObject(dataset)
            userDefaults.setObject(newMutableList, forKey: "itemlist")
            
        }else{
            userDefaults.removeObjectForKey("itemlist")
            Itemlist = NSMutableArray()
            Itemlist!.addObject(dataset)
            userDefaults.setObject(Itemlist, forKey: "itemlist")
            
        }
        userDefaults.synchronize()
        self.navigationController?.popToRootViewControllerAnimated(true)
        
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

//
//  DetailViewController.swift
//  TaskTimer
//
//  Created by Ahmad Aboelghet on 8/20/16.
//  Copyright © 2016 Ahmad Aboelghet. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var Textfield: UITextField!
    
    @IBOutlet weak var NotesTitle: UITextView!
    
    var todoData : NSDictionary = NSDictionary()
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        
        
    }
    @IBAction func Delete(sender: AnyObject) {
        var userDefaults : NSUserDefaults = NSUserDefaults.standardUserDefaults()
        
        var itemListArray :NSMutableArray = userDefaults.objectForKey("itemList")as! NSMutableArray
        var mutableItemList : NSMutableArray = NSMutableArray()
        for dict: AnyObject in itemListArray{
            mutableItemList.addObject(dict as! NSDictionary)
        }
        mutableItemList.removeObject(todoData)
        userDefaults.removeObjectForKey("itemList")
        userDefaults.setObject(mutableItemList, forKey: "itemList")
        userDefaults.synchronize()
        self.navigationController?.popToRootViewControllerAnimated(true)
    }


    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        Textfield.userInteractionEnabled = false
        NotesTitle.userInteractionEnabled = false
        Textfield.text = todoData.objectForKey("itemTitle") as! String
        NotesTitle.text = todoData.objectForKey("itemNotes")as! String
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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

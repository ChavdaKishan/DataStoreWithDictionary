//
//  SecondViewController.swift
//  DataStoreWithDictionary
//
//  Created by iFlame on 9/13/17.
//  Copyright © 2017 iflame. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController
{
    
    @IBOutlet weak var FName: UITextField!
    @IBOutlet weak var SName: UITextField!
    @IBOutlet weak var Email: UITextField!
    @IBOutlet weak var Password: UITextField!
    @IBOutlet weak var Phone: UITextField!
    @IBOutlet weak var City: UITextField!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        var dataset = UserDefaults.standard.value(forKey: "abc") as! Dictionary<String,String>
        
        FName.text = dataset["FName"]
        SName.text = dataset["SName"]
        Email.text = dataset["Email"]
        Password.text = dataset["Password"]
        Phone.text = dataset["Phone"]
        City.text = dataset["City"]
    }
    
    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    /*
    // MARK: - Navigation
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
}

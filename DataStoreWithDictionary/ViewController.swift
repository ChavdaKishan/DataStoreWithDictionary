//
//  ViewController.swift
//  DataStoreWithDictionary
//
//  Created by iFlame on 9/13/17.
//  Copyright © 2017 iflame. All rights reserved.
//

import UIKit

class ViewController: UIViewController
{
    
    @IBOutlet weak var FNameTxt: UITextField!
    @IBOutlet weak var SNameTxt: UITextField!
    @IBOutlet weak var EmailTxt: UITextField!
    @IBOutlet weak var PasswordTxt: UITextField!
    @IBOutlet weak var PhoneTxt: UITextField!
    @IBOutlet weak var CityTxt: UITextField!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction func SubmitClick(_ sender: Any)
    {
        if FNameTxt.text == "" || SNameTxt.text == "" || EmailTxt.text == "" || PasswordTxt.text == "" || PhoneTxt.text == "" || CityTxt.text == ""
        {
            let alertValidation = UIAlertController(title: "Bio-Data", message: "Please enter all the fields", preferredStyle: UIAlertControllerStyle.alert)
            let alertActionOK = UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: { action in
                alertValidation.dismiss(animated: true, completion: nil)
            })
            alertValidation.addAction(alertActionOK)
            self.present(alertValidation, animated: true, completion: nil)
            return
        }
        
        var datainfo = Dictionary<String,String>()
        
        datainfo["FName"] = FNameTxt.text
        datainfo["SName"] = SNameTxt.text
        datainfo["Email"] = EmailTxt.text
        datainfo["Password"] = PasswordTxt.text
        datainfo["Phone"] = PhoneTxt.text
        datainfo["City"] = CityTxt.text
        
        UserDefaults.standard.set(datainfo, forKey: "datainfo")
        
        performSegue(withIdentifier: "Go", sender: self)
    }
    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

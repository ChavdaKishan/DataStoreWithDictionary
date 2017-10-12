//
//  ViewController.swift
//  DataStoreWithDictionary
//
//  Created by iFlame on 9/13/17.
//  Copyright © 2017 iflame. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITextFieldDelegate
{
    
    // MARK: - outlet
    @IBOutlet weak var FNameTxt: UITextField!
    @IBOutlet weak var SNameTxt: UITextField!
    @IBOutlet weak var EmailTxt: UITextField!
    @IBOutlet weak var PasswordTxt: UITextField!
    @IBOutlet weak var PhoneTxt: UITextField!
    @IBOutlet weak var CityTxt: UITextField!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        // MARK: - Delegate
        FNameTxt.delegate = self
        SNameTxt.delegate = self
        EmailTxt.delegate = self
        PasswordTxt.delegate = self
        PhoneTxt.delegate = self
        CityTxt.delegate = self
    }
    
    @IBAction func SubmitClick(_ sender: Any)
    {
        if FNameTxt.text == "" || SNameTxt.text == "" || EmailTxt.text == "" || PasswordTxt.text == "" || PhoneTxt.text == "" || CityTxt.text == ""
        {
            AlertValidation(Title: "Student Info", Message: "Please Enter All Field")
        }
        
        
        //MARK: - Email ID
        if Email(emailstring: EmailTxt.text! as NSString) == false
        {
            AlertValidation(Title: "Email", Message: "Enter Valid Email")
        }
        
        
        //MARK: - Password
        let passwd : NSString = PasswordTxt.text! as NSString
        if passwd.length < 8 || passwd.length > 20
        {
            AlertValidation(Title: "Password", Message: "Enter 8 To 20 Character")
        }
        
        
        // MARK: - Dictionary
        var datainfo = Dictionary<String,String>()
        
        datainfo["FName"] = FNameTxt.text
        datainfo["SName"] = SNameTxt.text
        datainfo["Email"] = EmailTxt.text
        datainfo["Password"] = PasswordTxt.text
        datainfo["Phone"] = PhoneTxt.text
        datainfo["City"] = CityTxt.text
        
        UserDefaults.standard.set(datainfo, forKey: "abc")
        
        
        //MARK: - Segue
        performSegue(withIdentifier: "Go", sender: self)
    }
    
    
    //MARK: - Validation
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool
    {
        if textField == FNameTxt
        {
            if textField.text != ""
            {
                let maxLan = 30
                let name : NSString = FNameTxt.text! as NSString
                let fullname : NSString = name.replacingCharacters(in: range, with: string) as NSString
                
                return fullname.length <= maxLan
            }
            let Fnm = CharacterSet.uppercaseLetters
            let nm = CharacterSet(charactersIn: string)
            
            return Fnm.isSuperset(of: nm)
        }
        else if textField == SNameTxt
        {
            let maxLan = 30
            let name : NSString = SNameTxt.text! as NSString
            let fullname : NSString = name.replacingCharacters(in: range, with: string) as NSString
            
            return fullname.length <= maxLan
        }
        else if textField == PasswordTxt
        {
            let maxLan = 20
            let pass : NSString = PasswordTxt.text! as NSString
            let fullpass : NSString = pass.replacingCharacters(in: range, with: string) as NSString
            
            return fullpass.length <= maxLan
        }
        else if textField == PhoneTxt
        {
            let phoneno = CharacterSet.decimalDigits
            let mobile = CharacterSet(charactersIn: string)
            
            return phoneno.isSuperset(of: mobile)
        }
        else if textField == CityTxt
        {
            let maxLan = 20
            let city : NSString = CityTxt.text! as NSString
            let fullcity : NSString = city.replacingCharacters(in: range, with: string) as NSString
            
            return fullcity.length <= maxLan
        }
        else
        {
            return true
        }
    }
    
    
    //MARK: Function
    func AlertValidation(Title:String,Message:String)
    {
        let alertValidation = UIAlertController(title: Title, message: Message, preferredStyle: UIAlertControllerStyle.alert)
        let alertActionOK = UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: { action in
            alertValidation.dismiss(animated: true, completion: nil)
        })
        alertValidation.addAction(alertActionOK)
        self.present(alertValidation, animated: true, completion: nil)
    }
    
    func Email(emailstring:NSString) -> Bool
    {
        let EmailRegExp = "[A-Z0-9a-z./%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}"
        let EmailValid = emailstring.range(of: EmailRegExp, options: .regularExpression)
        let result = (EmailValid.length == 0) ? false : true
        
        return result
    }
    
    /*
     func textFieldShouldReturn(_ textField: UITextField) -> Bool{
     textField.resignFirstResponder()
     return true
     }
     */
    
    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

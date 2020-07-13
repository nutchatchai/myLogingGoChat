//
//  OTPViewController.swift
//  myAlamofile
//
//  Created by Nutchatchai on 13/7/2563 BE.
//  Copyright © 2563 Nutchatchai. All rights reserved.
//

import UIKit

class OTPViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var txtOPT1: UITextField!
    @IBOutlet weak var txtOPT2: UITextField!
    @IBOutlet weak var txtOPT3: UITextField!
    @IBOutlet weak var txtOPT4: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        txtOPT1.backgroundColor = UIColor.clear
               txtOPT2.backgroundColor = UIColor.clear
               txtOPT3.backgroundColor = UIColor.clear
               txtOPT4.backgroundColor = UIColor.clear
               
               addBottomBorderTo(textField: txtOPT1)
               addBottomBorderTo(textField: txtOPT2)
               addBottomBorderTo(textField: txtOPT3)
               addBottomBorderTo(textField: txtOPT4)
               
               txtOPT1.delegate = self
               txtOPT2.delegate = self
               txtOPT3.delegate = self
               txtOPT4.delegate = self
               
               txtOPT1.becomeFirstResponder()
    }
    func addBottomBorderTo(textField:UITextField) {
        let layer = CALayer()
        layer.backgroundColor = UIColor.gray.cgColor
        layer.frame = CGRect(x: 0.0, y: textField.frame.size.height - 2.0, width: textField.frame.size.width, height: 2.0)
        textField.layer.addSublayer(layer)
    }
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if ((textField.text?.count)! < 1 ) && (string.count > 0) {
            if textField == txtOPT1 {
                txtOPT2.becomeFirstResponder()
            }
            
            if textField == txtOPT2 {
                txtOPT3.becomeFirstResponder()
            }
            
            if textField == txtOPT3 {
                txtOPT4.becomeFirstResponder()
            }
            
            if textField == txtOPT4 {
                txtOPT4.resignFirstResponder()
            }
            
            textField.text = string
            return false
        } else if ((textField.text?.count)! >= 1) && (string.count == 0) {
            if textField == txtOPT2 {
                txtOPT1.becomeFirstResponder()
            }
            if textField == txtOPT3 {
                txtOPT2.becomeFirstResponder()
            }
            if textField == txtOPT4 {
                txtOPT3.becomeFirstResponder()
            }
            if textField == txtOPT1 {
                txtOPT1.resignFirstResponder()
            }
            
            textField.text = ""
            return false
        } else if (textField.text?.count)! >= 1 {
            textField.text = string
            return false
        }
        
        return true
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

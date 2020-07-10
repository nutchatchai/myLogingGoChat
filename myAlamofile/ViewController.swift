//
//  ViewController.swift
//  myAlamofile
//
//  Created by Nutchatchai on 1/7/2563 BE.
//  Copyright © 2563 Nutchatchai. All rights reserved.
//

import UIKit
import AlamofireObjectMapper
import Alamofire
import ObjectMapper

class ViewController: UIViewController, UITextFieldDelegate {
    var CountryCode : [[String: Any]] = [[String: Any]]()
    var arrayList:Array<Forecast> = Array()
    
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var btnContinue: UIButton!
    @IBOutlet weak var tblView: UITableView!
    @IBOutlet weak var btnContinue2: UIButton!
    @IBOutlet weak var btnDrop2: UIButton!
    @IBOutlet weak var btnDrop: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        callService()
        tblView.separatorStyle = .none
        tblView.isHidden = true
        btnContinue.isEnabled = false
        tblView.dataSource = self
        self.textField.delegate = self
        tblView.reloadData()
        btnContinue2.isHidden = true
        btnContinue.isHidden = true
        
        
        
    }
    @IBAction func OnclickBtn2(_ sender: Any) {
        if tblView.isHidden{
            animate(toogle: true)
        }else{
            animate(toogle: false)
        }
    }
    
    @IBAction func OnclickBtn(_ sender: Any) {
        if tblView.isHidden{
            animate(toogle: true)
        }else{
            animate(toogle: false)
        }
        
    }
    func animate(toogle:Bool) {
        if toogle{
            UIView.animate(withDuration: 0.2){
                self.tblView.isHidden = false
            }
        }else{
            UIView.animate(withDuration: 0.2){
                self.tblView.isHidden = true
            }
        }
    }
    
    @IBAction func textChang(_ sender: Any) {
        var num =  textField.text
        
        //print(num?.count)
        if num?.count ?? 0 > 0{
            btnContinue.isHidden = false
        }else{
            btnContinue.isHidden = true
        }
        func validate(_: String) -> Bool {
                let PHONE_REGEX = "^\\d{3}\\d{3}\\d{4}$"
                let phoneTest = NSPredicate(format: "SELF MATCHES %@", PHONE_REGEX)
                let result = phoneTest.evaluate(with: num)
                return result
            }
        let isPhoneNumber = validate(num ?? "")
        print(isPhoneNumber)
        if isPhoneNumber == true{
           // btnContinue.isHidden = false
            btnContinue.isHidden = true
            btnContinue2.isHidden = false
        }else{
            btnContinue2.isHidden = true
            btnContinue.isHidden = false
        }
    }
  
   func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
//    let allowedCharacters = CharacterSet.decimalDigits
//    let characterSet = CharacterSet(charactersIn: string)
//    return allowedCharacters.isSuperset(of: characterSet)
    
    let num = textField.text
    if num?.count ?? 0 == 0{
    let aSet1 = NSCharacterSet(charactersIn:"0").inverted
    let compSepByCharInSet1 = string.components(separatedBy: aSet1)
    let numberFiltered1 = compSepByCharInSet1.joined(separator: "")
        return string == numberFiltered1
    }
    
    
    var fullString = textField.text ?? ""
    fullString.append(string)
    if range.length == 1 {
        textField.text = format(phoneNumber: fullString, shouldRemoveLastDigit: true)
    } else {
        textField.text = format(phoneNumber: fullString)
    }

    return false
    }
    
    
    
    func format(phoneNumber: String, shouldRemoveLastDigit: Bool = false) -> String {
        
        guard !phoneNumber.isEmpty else {
            return ""
            
        }
        guard let regex = try? NSRegularExpression(pattern: "[\\s-\\(\\)]", options: .caseInsensitive) else { return""
            
        }
        let r = NSString(string: phoneNumber).range(of: phoneNumber)
        var number = regex.stringByReplacingMatches(in: phoneNumber, options: .init(rawValue: 0), range: r, withTemplate: "")

        if number.count > 10 {
            let tenthDigitIndex = number.index(number.startIndex, offsetBy: 10)
            number = String(number[number.startIndex..<tenthDigitIndex])
        }

        if shouldRemoveLastDigit {
            let end = number.index(number.startIndex, offsetBy: number.count-1)
            number = String(number[number.startIndex..<end])
        }

        if number.count < 7 {
            let end = number.index(number.startIndex, offsetBy: number.count)
            let range = number.startIndex..<end
            number = number.replacingOccurrences(of: "(\\d{3})(\\d+)", with: "$1-$2", options: .regularExpression, range: range)

        } else {
            let end = number.index(number.startIndex, offsetBy: number.count)
            let range = number.startIndex..<end
            number = number.replacingOccurrences(of: "(\\d{3})(\\d{3})(\\d+)", with: "$1-$2-$3", options: .regularExpression, range: range)
        }
        
        if number.count == 12{
            btnContinue2.isHidden = false
            btnContinue.isHidden = true
        }else{
            btnContinue2.isHidden = true
            btnContinue.isHidden = false
        }
        return number
    }
    func callService(){
        let headers = ["Accept": "application/json","Device-Id":"12345","Platform":"android"]
        let URL = "https://gochat-web.secure-restapi.com/api/v1/country-code"
        
        Alamofire.request(URL,method: .get,headers: headers).responseJSON { response in

                  if(response.response?.statusCode == 200){
                           if let json = response.result.value as AnyObject? {
                            let arrayResponse = json["data"] as! NSArray
                            let arrayObject = Mapper<Forecast>().mapArray(JSONArray: arrayResponse as! [[String : Any]]);
                            self.onResponseSuccess(forecast: arrayObject)
            
                           }
                       }

        }
//
//        Alamofire.request(URL,method: .get,headers: headers
//         ).responseObject { (response:DataResponse<WeatherResponse>) in
//
//            let weatherResponse = response.result.value
//            print(weatherResponse?.success as Any)
//
//            if let threeDayForecast = weatherResponse?.data {
//                for forecast in threeDayForecast {
//                    if(forecast.calling_code != nil){
                       
                        
//                        print(forecast.calling_code as Any)
                        
                       // self.onResponseSuccess(forecast:)
                       // print(forecast.calling_code as Any)
                        
//                        self.CountryCode = forecast.calling_code



//                        if let responseValue = response.result.value as! [String:Any]?{
//                            if let responseCountry = responseValue["Forecast"] as! [[String:Any]]?{
//                                self.CountryCode = responseCountry
//                                self.tblView?.reloadData()
//                            }
//                        }
//                    }
//
//                }
//            }
//        }
        

    }
    func onResponseSuccess(forecast : Array<Forecast>) {
        
        self.arrayList = forecast
        self.tblView.reloadData()
        
    }

    


}
extension ViewController:UITableViewDelegate,UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = arrayList[indexPath.row].calling_code
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        arrayList.count
    }
   func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    
    let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
    cell.textLabel?.text = arrayList[indexPath.row].calling_code
    btnDrop.setTitle(cell.textLabel?.text, for: .normal)
    animate(toogle: false)

  }
    
   
}

//
//  LoginInteractor.swift
//  myAlamofile
//
//  Created by Nutchatchai on 10/7/2563 BE.
//  Copyright © 2563 Nutchatchai. All rights reserved.
//

import Foundation
import Alamofire
import ObjectMapper

class LoginInteractor:PresenterToInteractorLoginProtocol{
    var presenter: InteractorToPresenterLoginProtocol?
    
    func fetchData() {
        
        Alamofire.request(URL,method: .get,headers: headers).responseJSON { response in

                  if(response.response?.statusCode == 200){
                           if let json = response.result.value as AnyObject? {
                            let arrayResponse = json["data"] as! NSArray
                            let arrayObject = Mapper<CountryCode>().mapArray(JSONArray: arrayResponse as! [[String : Any]]);
                            //self.onResponseSuccess(forecast: arrayObject)
                            self.presenter?.dataFetchSuccess(countryCodeList:arrayObject)
                           }
                  }else{
                    self.presenter?.dataFetchFailed()
            }

        }

    }
    
   
    
    
    

    
    
    
}

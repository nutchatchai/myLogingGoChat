//
//  LoginPresenter.swift
//  myAlamofile
//
//  Created by Nutchatchai on 10/7/2563 BE.
//  Copyright © 2563 Nutchatchai. All rights reserved.
//

import Foundation


class LoginPresenter: ViewToPresenterLoginProtocol {
    var view: PresenterToViewLoginProtocol?
    var interactor: PresenterToInteractorLoginProtocol?
    var router: PresenterToRouterLoginProtocol?
    
    func startFetchingData(){
        interactor?.fetchData()
    }
}
extension LoginPresenter:InteractorToPresenterLoginProtocol{
    func dataFetchSuccess(countryCodeList: Array<CountryCode>) {
        view?.onLoginResponseSuccess(countryCodeModelArraylist: countryCodeList)
    }
    
    func dataFetchFailed() {
        view?.onLoginResponseFailed(error: "Some Error message from api response")
        }
    }
    
   
    
    


//
//  LoginProtocol.swift
//  myAlamofile
//
//  Created by Nutchatchai on 10/7/2563 BE.
//  Copyright © 2563 Nutchatchai. All rights reserved.
//

import Foundation

protocol ViewToPresenterLoginProtocol:class {
    var view: PresenterToViewLoginProtocol?{get set}
    var interactor: PresenterToInteractorLoginProtocol?{get set}
    var router: PresenterToRouterLoginProtocol?{get set}
    func startFetchingData()
    
    
}
protocol PresenterToViewLoginProtocol:class {
    
    func onLoginResponseSuccess(countryCodeModelArraylist:Array<CountryCode>)
    func onLoginResponseFailed(error:String)
    
}
protocol PresenterToRouterLoginProtocol:class {
    
    static func createDataModule() -> ViewController
    
}
protocol PresenterToInteractorLoginProtocol:class {
    
    var presenter:InteractorToPresenterLoginProtocol? {get set}
    func fetchData()
    
    
}

protocol InteractorToPresenterLoginProtocol:class {
    func dataFetchSuccess(countryCodeList:Array<CountryCode>)
    func dataFetchFailed()
}

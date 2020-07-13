//
//  LoginRouter.swift
//  myAlamofile
//
//  Created by Nutchatchai on 10/7/2563 BE.
//  Copyright © 2563 Nutchatchai. All rights reserved.
//

import Foundation
import UIKit

class LoginRouter: PresenterToRouterLoginProtocol{
    static func createDataModule() -> ViewController {
         let view = LoginRouter.mainstoryboard.instantiateViewController(withIdentifier: "ViewController") as! ViewController

               let presenter: ViewToPresenterLoginProtocol & InteractorToPresenterLoginProtocol = LoginPresenter()
               let interactor: PresenterToInteractorLoginProtocol = LoginInteractor()
               let router:PresenterToRouterLoginProtocol = LoginRouter()

               view.dataPresenter = presenter
               presenter.view = view 
               presenter.router = router
               presenter.interactor = interactor
               interactor.presenter = presenter

               return view
    }
    

    static var mainstoryboard: UIStoryboard{
        return UIStoryboard(name:"Main",bundle: Bundle.main)
    }

}


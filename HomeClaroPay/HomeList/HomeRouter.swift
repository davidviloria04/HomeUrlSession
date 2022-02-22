//
//  HomeRouter.swift
//  HomeClaroPay
//
//  Created by David Viloria Ortega on 21/02/22.
//

import Foundation
import UIKit


class HomeRouter: HomeRouterProtocol{
    class func build() -> UIViewController {
        let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
        let view = storyboard.instantiateViewController(withIdentifier: "HomeViewController") as! HomeViewController
        let interactor = HomeInteractor()
        let router = HomeRouter()
        let presenter = HomePresenter(interactor: interactor, router: router)

        view.presenter = presenter
        presenter.router = router
        presenter.view = view
        presenter.interactor = interactor
        return view
    }
}

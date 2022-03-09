//
//  HomePresenter.swift
//  HomeClaroPay
//
//  Created by David Viloria Ortega on 21/02/22.
//

import Foundation
import UIKit

class HomePresenter  {
    
    weak var view: HomeViewControllerProtocol?
    var interactor: HomeInteractorProtocol?
    var router: HomeRouterProtocol?
    
    init(interactor: HomeInteractor, router: HomeRouter) {
        self.interactor = interactor
        self.router = router
    }
    
    static func buildPresenter(view: HomeViewControllerProtocol){
        let interactor = HomeInteractor()
        let router = HomeRouter()
        let presenter = HomePresenter(interactor: interactor, router: router)
        
        view.presenter = presenter
        presenter.router = router
        presenter.view = view
        presenter.interactor = interactor
    }
}

extension HomePresenter: HomePresenterProtocol {
    func createQuickAccessWidget() -> UIViewController {
        return WidgetQuickAccessWireFrame.createWidgetQuickAccessModule()
    }
    
    func createGeneralWidget() -> UIViewController {
        return WidgetGeneralWireFrame.createWidgetGeneralModule()
    }
    func createBannerWidget() -> UIViewController {
        return WidgetBannerWireFrame.createWidgetBannerModule()
    }
    
    func getdata() -> [Widget]?{
        return interactor?.getWidgets()
    }
    
    func getHomeData() {
        interactor?.fetchHomeData(){ data, error in
            if let err = error {
                print(">>>>> \(err)")
                self.interactor?.saveData(items: nil)
                self.view?.error(error: err.localizedDescription)
                return
            }
            if let dataDto = data, let homeResponse = dataDto as? HomeResponse {
                print(">>>>> Succes")
                self.interactor?.saveData(items: homeResponse.data)
                self.view?.succes()
                return
            }else{
                print(">>>>>Error en el casting de HomeResponse")
                self.view?.error(error: "Error en el casting de HomeResponse")
            }
        }
    }
}

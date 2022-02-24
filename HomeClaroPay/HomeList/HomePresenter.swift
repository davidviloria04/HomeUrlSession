//
//  HomePresenter.swift
//  HomeClaroPay
//
//  Created by David Viloria Ortega on 21/02/22.
//

import Foundation


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
    func getdata() -> [Widget]?{
        return interactor?.getWidgets()
    }
    
    func getHomeData() {
        interactor?.fetchHomeData(){ data, error in
            if let err = error {
                print(">>>>> \(err)")
                self.view?.error(error: err.localizedDescription)
                return
            }
            if data != nil {
                print(">>>>> Succes")
                self.view?.succes()
                return
            }
        }
    }
}

//
//  WidgetBannerPresenter.swift
//  HomeClaroPay
//
//  Created by David Viloria Ortega on 8/03/22.
//  
//

import Foundation

class WidgetBannerPresenter  {
    
    // MARK: Properties
    weak var view: WidgetBannerViewProtocol?
    var interactor: WidgetBannerInteractorProtocol?
    var wireFrame: WidgetBannerWireFrameProtocol?
    
    init(view: WidgetBannerView, interactor: WidgetBannerInteractor, wireframe: WidgetBannerWireFrame) {
        self.view = view
        self.interactor = interactor
        self.wireFrame = wireframe
    }
    
}

extension WidgetBannerPresenter: WidgetBannerPresenterProtocol {
    // TODO: implement presenter methods
    func getWidgetBannerData() {
        interactor?.fetchWidgetsBanner(){ data, error in
            if let err = error {
                print(">>>>> \(err)")
                self.view?.error(error: err.localizedDescription)
                return
            }
            if let data = data {
                print(">>>>> Succes \(data)")
                self.view?.succes()
            }
        }
    }
    func getData() -> [WidgetBanner]? {
        interactor?.getWidgetsBanner()
    }
}

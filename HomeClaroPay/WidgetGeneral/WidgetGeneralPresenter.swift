//
//  WidgetGeneralPresenter.swift
//  HomeClaroPay
//
//  Created by David Viloria Ortega on 24/02/22.
//  
//

import Foundation
import UIKit

class WidgetGeneralPresenter  {
    
    // MARK: Properties
    weak var view: WidgetGeneralViewProtocol?
    var interactor: WidgetGeneralInteractorProtocol?
    var router: WidgetGeneralWireFrameProtocol?
    
    init(view: WidgetGeneralView, interactor: WidgetGeneralInteractor, router: WidgetGeneralWireFrame) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }
}

extension WidgetGeneralPresenter: WidgetGeneralPresenterProtocol {
    func getData() -> [WidgetGeneral]? {
        interactor?.getWidgets()
    }
    
    func getWidgetGeneralData() {
        interactor?.fetchWidgetsGeneral(){ data, error in
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

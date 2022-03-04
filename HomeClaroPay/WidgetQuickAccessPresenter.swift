//
//  WidgetQuickAccessPresenter.swift
//  HomeClaroPay
//
//  Created by David Viloria Ortega on 3/03/22.
//  
//

import Foundation
import UIKit

class WidgetQuickAccessPresenter  {
    
    // MARK: Properties
    weak var view: WidgetQuickAccessViewProtocol?
    var interactor: WidgetQuickAccessInteractorProtocol?
    var wireFrame: WidgetQuickAccessWireFrameProtocol?
    
    init(view: WidgetQuickAccessView, interactor: WidgetQuickAccessInteractor, wireframe: WidgetQuickAccessWireFrame) {
        self.view = view
        self.interactor = interactor
        self.wireFrame = wireframe
    }
    
}

extension WidgetQuickAccessPresenter: WidgetQuickAccessPresenterProtocol {
    
    func widgetQuickAccessData() {
        interactor?.fetchWidgetsQuickAccess(){ data, error in
            if let err = error {
                print(">>>>> \(err)")
                self.view?.error(error: err.localizedDescription)
                return
            }
            if let data = data {
                print(">>>>> Succes \(data)")
                self.view?.succes()
                return
            }
            
        }
    }
    
    func getData() -> [WidgetQuickAccess]? {
        interactor?.getWidgetsQA()
    }
    
    // TODO: implement presenter methods
    func viewDidLoad() {
    }
}

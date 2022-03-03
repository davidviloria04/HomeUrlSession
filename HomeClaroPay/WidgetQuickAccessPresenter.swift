//
//  WidgetQuickAccessPresenter.swift
//  HomeClaroPay
//
//  Created by David Viloria Ortega on 3/03/22.
//  
//

import Foundation

class WidgetQuickAccessPresenter  {
    
    // MARK: Properties
    weak var view: WidgetQuickAccessViewProtocol?
    var interactor: WidgetQuickAccessInteractorInputProtocol?
    var wireFrame: WidgetQuickAccessWireFrameProtocol?
    
}

extension WidgetQuickAccessPresenter: WidgetQuickAccessPresenterProtocol {
    // TODO: implement presenter methods
    func viewDidLoad() {
    }
}

extension WidgetQuickAccessPresenter: WidgetQuickAccessInteractorOutputProtocol {
    // TODO: implement interactor output methods
}

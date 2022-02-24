//
//  WidgetQuickAcccesPresenter.swift
//  HomeClaroPay
//
//  Created by David Viloria Ortega on 23/02/22.
//  
//

import Foundation

class WidgetQuickAcccesPresenter  {
    
    // MARK: Properties
    weak var view: WidgetQuickAcccesViewProtocol?
    var interactor: WidgetQuickAcccesInteractorInputProtocol?
    var wireFrame: WidgetQuickAcccesWireFrameProtocol?
    
}

extension WidgetQuickAcccesPresenter: WidgetQuickAcccesPresenterProtocol {
    // TODO: implement presenter methods
    func viewDidLoad() {
    }
}

extension WidgetQuickAcccesPresenter: WidgetQuickAcccesInteractorOutputProtocol {
    // TODO: implement interactor output methods
}

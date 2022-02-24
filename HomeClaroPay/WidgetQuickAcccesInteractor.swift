//
//  WidgetQuickAcccesInteractor.swift
//  HomeClaroPay
//
//  Created by David Viloria Ortega on 23/02/22.
//  
//

import Foundation

class WidgetQuickAcccesInteractor: WidgetQuickAcccesInteractorInputProtocol {

    // MARK: Properties
    weak var presenter: WidgetQuickAcccesInteractorOutputProtocol?
    var localDatamanager: WidgetQuickAcccesLocalDataManagerInputProtocol?
    var remoteDatamanager: WidgetQuickAcccesRemoteDataManagerInputProtocol?

}

extension WidgetQuickAcccesInteractor: WidgetQuickAcccesRemoteDataManagerOutputProtocol {
    // TODO: Implement use case methods
}

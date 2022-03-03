//
//  WidgetQuickAccessInteractor.swift
//  HomeClaroPay
//
//  Created by David Viloria Ortega on 3/03/22.
//  
//

import Foundation

class WidgetQuickAccessInteractor: WidgetQuickAccessInteractorInputProtocol {

    // MARK: Properties
    weak var presenter: WidgetQuickAccessInteractorOutputProtocol?
    var localDatamanager: WidgetQuickAccessLocalDataManagerInputProtocol?
    var remoteDatamanager: WidgetQuickAccessRemoteDataManagerInputProtocol?

}

extension WidgetQuickAccessInteractor: WidgetQuickAccessRemoteDataManagerOutputProtocol {
    // TODO: Implement use case methods
}

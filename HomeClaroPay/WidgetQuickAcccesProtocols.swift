//
//  WidgetQuickAcccesProtocols.swift
//  HomeClaroPay
//
//  Created by David Viloria Ortega on 23/02/22.
//  
//

import Foundation
import UIKit

protocol WidgetQuickAcccesViewProtocol: AnyObject {
    // PRESENTER -> VIEW
    var presenter: WidgetQuickAcccesPresenterProtocol? { get set }
}

protocol WidgetQuickAcccesWireFrameProtocol: AnyObject {
    // PRESENTER -> WIREFRAME
    static func createWidgetQuickAcccesModule() -> UIViewController
}

protocol WidgetQuickAcccesPresenterProtocol: AnyObject {
    // VIEW -> PRESENTER
    var view: WidgetQuickAcccesViewProtocol? { get set }
    var interactor: WidgetQuickAcccesInteractorInputProtocol? { get set }
    var wireFrame: WidgetQuickAcccesWireFrameProtocol? { get set }
    
    func viewDidLoad()
}

protocol WidgetQuickAcccesInteractorOutputProtocol: AnyObject {
// INTERACTOR -> PRESENTER
}

protocol WidgetQuickAcccesInteractorInputProtocol: AnyObject {
    // PRESENTER -> INTERACTOR
    var presenter: WidgetQuickAcccesInteractorOutputProtocol? { get set }
    var localDatamanager: WidgetQuickAcccesLocalDataManagerInputProtocol? { get set }
    var remoteDatamanager: WidgetQuickAcccesRemoteDataManagerInputProtocol? { get set }
}

protocol WidgetQuickAcccesDataManagerInputProtocol: AnyObject {
    // INTERACTOR -> DATAMANAGER
}

protocol WidgetQuickAcccesRemoteDataManagerInputProtocol: AnyObject {
    // INTERACTOR -> REMOTEDATAMANAGER
    var remoteRequestHandler: WidgetQuickAcccesRemoteDataManagerOutputProtocol? { get set }
}

protocol WidgetQuickAcccesRemoteDataManagerOutputProtocol: AnyObject {
    // REMOTEDATAMANAGER -> INTERACTOR
}

protocol WidgetQuickAcccesLocalDataManagerInputProtocol: AnyObject {
    // INTERACTOR -> LOCALDATAMANAGER
}

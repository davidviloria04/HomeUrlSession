//
//  WidgetQuickAcccesWireFrame.swift
//  HomeClaroPay
//
//  Created by David Viloria Ortega on 23/02/22.
//  
//

import Foundation
import UIKit

class WidgetQuickAcccesWireFrame: WidgetQuickAcccesWireFrameProtocol {

    class func createWidgetQuickAcccesModule() -> UIViewController {
        let navController = mainStoryboard.instantiateViewController(withIdentifier: "WidgetQuickAcccesView")
        if let view = navController.children.first as? WidgetQuickAcccesView {
            let presenter: WidgetQuickAcccesPresenterProtocol & WidgetQuickAcccesInteractorOutputProtocol = WidgetQuickAcccesPresenter()
            let interactor: WidgetQuickAcccesInteractorInputProtocol & WidgetQuickAcccesRemoteDataManagerOutputProtocol = WidgetQuickAcccesInteractor()
            let localDataManager: WidgetQuickAcccesLocalDataManagerInputProtocol = WidgetQuickAcccesLocalDataManager()
            let remoteDataManager: WidgetQuickAcccesRemoteDataManagerInputProtocol = WidgetQuickAcccesRemoteDataManager()
            let wireFrame: WidgetQuickAcccesWireFrameProtocol = WidgetQuickAcccesWireFrame()
            
            view.presenter = presenter
            presenter.view = view
            presenter.wireFrame = wireFrame
            presenter.interactor = interactor
            interactor.presenter = presenter
            interactor.localDatamanager = localDataManager
            interactor.remoteDatamanager = remoteDataManager
            remoteDataManager.remoteRequestHandler = interactor
            
            return navController
        }
        return UIViewController()
    }
    
    static var mainStoryboard: UIStoryboard {
        return UIStoryboard(name: "WidgetQuickAcccesView", bundle: Bundle.main)
    }
    
}

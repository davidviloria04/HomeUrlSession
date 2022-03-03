//
//  WidgetQuickAccessWireFrame.swift
//  HomeClaroPay
//
//  Created by David Viloria Ortega on 3/03/22.
//  
//

import Foundation
import UIKit

class WidgetQuickAccessWireFrame: WidgetQuickAccessWireFrameProtocol {

    class func createWidgetQuickAccessModule() -> UIViewController {
        let navController = mainStoryboard.instantiateViewController(withIdentifier: "WidgetQuickAccessView")
        if let view = navController.children.first as? WidgetQuickAccessView {
            let presenter: WidgetQuickAccessPresenterProtocol & WidgetQuickAccessInteractorOutputProtocol = WidgetQuickAccessPresenter()
            let interactor: WidgetQuickAccessInteractorInputProtocol & WidgetQuickAccessRemoteDataManagerOutputProtocol = WidgetQuickAccessInteractor()
            let localDataManager: WidgetQuickAccessLocalDataManagerInputProtocol = WidgetQuickAccessLocalDataManager()
            let remoteDataManager: WidgetQuickAccessRemoteDataManagerInputProtocol = WidgetQuickAccessRemoteDataManager()
            let wireFrame: WidgetQuickAccessWireFrameProtocol = WidgetQuickAccessWireFrame()
            
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
        return UIStoryboard(name: "WidgetQuickAccessView", bundle: Bundle.main)
    }
    
}

//
//  WidgetBannerRouter.swift
//  HomeClaroPay
//
//  Created by David Viloria Ortega on 23/02/22.
//  
//

import Foundation
import UIKit

class WidgetBannerRouter: PresenterToRouterWidgetBannerProtocol {
    
    // MARK: Static methods
    static func createModule() -> UIViewController {
        
        let viewController = WidgetBannerViewController()
        let presenter: ViewToPresenterWidgetBannerProtocol & InteractorToPresenterWidgetBannerProtocol = WidgetBannerPresenter()
        
        viewController.presenter = presenter
        viewController.presenter?.router = WidgetBannerRouter()
        viewController.presenter?.view = viewController
        viewController.presenter?.interactor = WidgetBannerInteractor()
        viewController.presenter?.interactor?.presenter = presenter
        
        return viewController
    }
    
}

//
//  WidgetGeneralWireFrame.swift
//  HomeClaroPay
//
//  Created by David Viloria Ortega on 24/02/22.
//  
//

import Foundation
import UIKit

class WidgetGeneralWireFrame: WidgetGeneralWireFrameProtocol {
    static func createWidgetGeneralModule() -> UIViewController {
        let view = WidgetGeneralView(nibName: nil, bundle: nil)
        let interactor = WidgetGeneralInteractor()
        let router = WidgetGeneralWireFrame()
        let presenter = WidgetGeneralPresenter(view: view, interactor: interactor, router: router)

        view.presenter = presenter
        presenter.router = router
        presenter.view = view
        presenter.interactor = interactor
        return view
    }
}

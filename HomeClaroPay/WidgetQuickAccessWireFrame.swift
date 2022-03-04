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
    static func createWidgetQuickAccessModule() -> UIViewController {
        let view = WidgetQuickAccessView(nibName: nil, bundle: nil)
        let interactor = WidgetQuickAccessInteractor()
        let wireframe = WidgetQuickAccessWireFrame()
        let presenter = WidgetQuickAccessPresenter(view: view, interactor: interactor, wireframe: wireframe)

        view.presenter = presenter
        presenter.wireFrame = wireframe
        presenter.view = view
        presenter.interactor = interactor
        return view
    }
}

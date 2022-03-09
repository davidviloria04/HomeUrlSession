//
//  WidgetBannerWireFrame.swift
//  HomeClaroPay
//
//  Created by David Viloria Ortega on 8/03/22.
//  
//

import Foundation
import UIKit

class WidgetBannerWireFrame: WidgetBannerWireFrameProtocol {

    class func createWidgetBannerModule() -> UIViewController {
        let view = WidgetBannerView(nibName: nil, bundle: nil)
        let interactor = WidgetBannerInteractor()
        let wireframe = WidgetBannerWireFrame()
        let presenter = WidgetBannerPresenter(view: view, interactor: interactor, wireframe: wireframe)

        view.presenter = presenter
        presenter.wireFrame = wireframe
        presenter.view = view
        presenter.interactor = interactor
        return view
    }
    
}

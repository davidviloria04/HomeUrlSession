//
//  WidgetBannerProtocols.swift
//  HomeClaroPay
//
//  Created by David Viloria Ortega on 8/03/22.
//  
//

import Foundation
import UIKit

protocol WidgetBannerViewProtocol: AnyObject {
    // PRESENTER -> VIEW
    var presenter: WidgetBannerPresenterProtocol? { get set }
    
    func succes()
    func error(error: String)
}

protocol WidgetBannerWireFrameProtocol: AnyObject {
    // PRESENTER -> WIREFRAME
    static func createWidgetBannerModule() -> UIViewController
}

protocol WidgetBannerPresenterProtocol: AnyObject {
    // VIEW -> PRESENTER
    var view: WidgetBannerViewProtocol? { get set }
    var interactor: WidgetBannerInteractorProtocol? { get set }
    var wireFrame: WidgetBannerWireFrameProtocol? { get set }
    
    func getWidgetBannerData() -> Void
    func getData() -> [WidgetBanner]?
    
}

protocol WidgetBannerInteractorProtocol: AnyObject {
    // PRESENTER -> INTERACTOR
    var presenter: WidgetBannerInteractorProtocol? { get set }
    
    func fetchWidgetsBanner(callBack: @escaping(_ data: Any?,_ error: Error?) -> Void) -> Void
    func getWidgetsBanner() -> [WidgetBanner]?
}

//
//  WidgetGeneralProtocols.swift
//  HomeClaroPay
//
//  Created by David Viloria Ortega on 24/02/22.
//  
//

import Foundation
import UIKit

protocol WidgetGeneralViewProtocol: AnyObject {
    // PRESENTER -> VIEW
    var presenter: WidgetGeneralPresenterProtocol? { get set }
    
    func succes() -> Void
    func error(error: String) -> Void
}

protocol WidgetGeneralWireFrameProtocol: AnyObject {
    // PRESENTER -> WIREFRAME
    static func createWidgetGeneralModule() -> UIViewController
}

protocol WidgetGeneralPresenterProtocol: AnyObject {
    // VIEW -> PRESENTER
    var view: WidgetGeneralViewProtocol? { get set }
    var interactor: WidgetGeneralInteractorProtocol? { get set }
    var router: WidgetGeneralWireFrameProtocol? { get set }
    
    func getWidgetGeneralData() -> Void
    func getData() -> [WidgetGeneral]?
}

protocol WidgetGeneralInteractorProtocol: AnyObject {
    // PRESENTER -> INTERACTOR
    func fetchWidgetsGeneral(callBack: @escaping (_ data: Any?, _ error: Error?) -> Void) -> Void
    func getWidgets() -> [WidgetGeneral]?
}

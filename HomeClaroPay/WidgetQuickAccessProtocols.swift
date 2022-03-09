//
//  WidgetQuickAccessProtocols.swift
//  HomeClaroPay
//
//  Created by David Viloria Ortega on 3/03/22.
//  
//

import Foundation
import UIKit

protocol WidgetQuickAccessViewProtocol: AnyObject {
    // PRESENTER -> VIEW
    var presenter: WidgetQuickAccessPresenterProtocol? { get set }
    
    func succes() -> Void
    func error(error: String) -> Void
}

protocol WidgetQuickAccessWireFrameProtocol: AnyObject {
    // PRESENTER -> WIREFRAME
    static func createWidgetQuickAccessModule() -> UIViewController
}

protocol WidgetQuickAccessPresenterProtocol: AnyObject {
    // VIEW -> PRESENTER
    var view: WidgetQuickAccessViewProtocol? { get set }
    var interactor: WidgetQuickAccessInteractorProtocol? { get set }
    var wireFrame: WidgetQuickAccessWireFrameProtocol? { get set }
    
    func getWidgetQuickAccessData() -> Void
    func getData() -> [WidgetQuickAccess]?
}

protocol WidgetQuickAccessInteractorProtocol: AnyObject {
    var presenter: WidgetQuickAccessInteractorProtocol? { get set }
    
    func fetchWidgetsQuickAccess(callBack: @escaping (_ data: Any?, _ error: Error?) -> Void) -> Void
    func getWidgetsQA() -> [WidgetQuickAccess]?
}

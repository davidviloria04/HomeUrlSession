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
    var interactor: WidgetQuickAccessInteractorInputProtocol? { get set }
    var wireFrame: WidgetQuickAccessWireFrameProtocol? { get set }
    
    func viewDidLoad()
}

protocol WidgetQuickAccessInteractorOutputProtocol: AnyObject {
// INTERACTOR -> PRESENTER
}

protocol WidgetQuickAccessInteractorInputProtocol: AnyObject {
    // PRESENTER -> INTERACTOR
    var presenter: WidgetQuickAccessInteractorOutputProtocol? { get set }
}

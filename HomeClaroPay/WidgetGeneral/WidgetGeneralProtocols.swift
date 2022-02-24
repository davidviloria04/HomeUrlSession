//
//  WidgetGeneralProtocols.swift
//  HomeClaroPay
//
//  Created by David Viloria Ortega on 22/02/22.
//

//import Foundation
//
//protocol WidgetGeneralViewControllerProtocol: AnyObject {
//    // Presenter -> View
//    var presenter: WidgetGeneralPresenterProtocol? { get set }
//    
//    func succes() -> Void
//    func error(error: String) -> Void
//    
//}
//protocol WidgetGeneralRouterProtocol: AnyObject{
//    //Presenter -> Router
//    //static func build() -> UIViewController
//}
//
//protocol WidgetGeneralPresenterProtocol: AnyObject{
//    //View ---->> Presenter
//    var view: WidgetGeneralViewControllerProtocol? { get set }
//    var router: WidgetGeneralRouterProtocol? { get set }
//    var interactor: WidgetGeneralInteractorProtocol? {get set}
//    
//    func getHomeData() -> Void
//    func getdata() -> [Widget]?
//}
//
//
//protocol WidgetGeneralInteractorProtocol: AnyObject {
//    func fetchHomeData(callBack: @escaping (_ data: Any?, _ error: Error?) -> Void) -> Void
//    func getWidgets() -> [Widget]?
//}
//

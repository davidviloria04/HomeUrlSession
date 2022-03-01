//
//  HomeProtocols.swift
//  HomeClaroPay
//
//  Created by David Viloria Ortega on 21/02/22.
//

import Foundation
import UIKit


protocol HomeViewControllerProtocol: AnyObject {
    // Presenter -> View
    var presenter: HomePresenterProtocol? { get set }
    
    func succes() -> Void
    func error(error: String) -> Void
    
}
protocol HomeRouterProtocol: AnyObject{
    //Presenter -> Router
    static func build() -> UIViewController
}

protocol HomePresenterProtocol: AnyObject{
    //View ---->> Presenter
    var view: HomeViewControllerProtocol? { get set }
    var router: HomeRouterProtocol? { get set }
    var interactor: HomeInteractorProtocol? {get set}
    
    func getHomeData() -> Void
    func getdata() -> [Widget]?
    func createGeneralWidget() -> UIViewController

}


protocol HomeInteractorProtocol: AnyObject {
    func fetchHomeData(callBack: @escaping (_ data: Any?, _ error: Error?) -> Void) -> Void
    func getWidgets() -> [Widget]?
    func saveData(items: [Widget]?)
}

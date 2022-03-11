//
//  WidgetQuickAccessInteractor.swift
//  HomeClaroPay
//
//  Created by David Viloria Ortega on 3/03/22.
//  
//

import Foundation

class WidgetQuickAccessInteractor: WidgetQuickAccessInteractorProtocol {

    // MARK: Properties
    weak var presenter: WidgetQuickAccessInteractorProtocol?
    var data: [WidgetQuickAccess]?

    func fetchWidgetsQuickAccess(callBack: @escaping (_ data: Any?, _ error: Error?) -> Void) -> Void{
        NetworkManager.request(url: "http://localhost:3000/ClaroPay-WS/service?category=HOME", method: "GET", type: WidgetQuickAccessResponse.self) { data, error in
            callBack(data, error)
        }
    }
    
    func getWidgetsQA() -> [WidgetQuickAccess]? {
        return data
    }
}

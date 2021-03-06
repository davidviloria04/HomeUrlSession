//
//  WidgetGeneralInteractor.swift
//  HomeClaroPay
//
//  Created by David Viloria Ortega on 24/02/22.
//  
//

import Foundation

class WidgetGeneralInteractor: WidgetGeneralInteractorProtocol {
    
    // MARK: Properties
    weak var presenter: WidgetGeneralInteractorProtocol?
    var data: [WidgetGeneral]?
    
    func getWidgets() -> [WidgetGeneral]? {
        return data
    }
    
    func fetchWidgetsGeneral(callBack: @escaping (_ data: Any?, _ error: Error?) -> Void) -> Void{
        NetworkManager.request(url: "http://localhost:3000/ClaroPay-WS/widget?id=WIDGET_GENERAL", method: "GET", type: WidgetGeneralResponse.self) { data, error in
            callBack(data, error)
        }
    }
}

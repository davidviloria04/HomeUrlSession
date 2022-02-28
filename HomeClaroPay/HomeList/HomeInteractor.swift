//
//  HomeInteractor.swift
//  HomeClaroPay
//
//  Created by David Viloria Ortega on 21/02/22.
//

import Foundation

class HomeInteractor: HomeInteractorProtocol{

    var presenter: HomePresenterProtocol?
    var data: [Widget]?
    
    func getWidgets() -> [Widget]? {
        return data
    }
    
    func fetchHomeData(callBack: @escaping (_ data: Any?, _ error: Error?) -> Void) -> Void{
        NetworkManager.request(url: "http://localhost:3000/ClaroPay-WS/home", method: "GET", type: Widget.self) { data, error in
            callBack(data, error)
        }
    }
}



//
//  WidgetBannerInteractor.swift
//  HomeClaroPay
//
//  Created by David Viloria Ortega on 8/03/22.
//  
//

import Foundation

class WidgetBannerInteractor: WidgetBannerInteractorProtocol {

    // MARK: Properties
    weak var presenter: WidgetBannerInteractorProtocol?
    var data: [WidgetBanner]?
    
    func fetchWidgetsBanner(callBack: @escaping (_ data: Any?,_ error: Error?) -> Void) {
        NetworkManager.request(url: "http://192.168.0.12:3000/ClaroPay-WS/widget?id=WIDGET_BANNER", method: "GET", type: BannerResponse.self) { data, error in
            callBack(data, error)
        }
    }
    
    func getWidgetsBanner() -> [WidgetBanner]? {
        return data
    }
}

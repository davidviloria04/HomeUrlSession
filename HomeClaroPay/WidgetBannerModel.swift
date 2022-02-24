//
//  WidgetBannerModel.swift
//  HomeClaroPay
//
//  Created by David Viloria Ortega on 23/02/22.
//

import Foundation



struct BannerResponse: Codable{
    var responseCode: String
    var responseMessage: String?
    var responseSubject: String?
    var data: [WidgetBanner]?
}

struct WidgetBanner: Codable {
    var type: String?
    var icon: String?
    var promoIcon: String?
    var backgroundColor: String?
}



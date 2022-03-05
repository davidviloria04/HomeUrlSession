//
//  WidgetGeneralModel.swift
//  HomeClaroPay
//
//  Created by David Viloria Ortega on 25/02/22.
//

import Foundation


struct WidgetGeneralResponse: Codable{
    var responseCode: String
    var responseMessage: String?
    var responseSubject: String?
    var data: [WidgetGeneral]?
}

struct WidgetGeneral: Codable{
    var type: String?
    var icon: String?
    var promoIcon: String?
    var backgroundColor: String?
}

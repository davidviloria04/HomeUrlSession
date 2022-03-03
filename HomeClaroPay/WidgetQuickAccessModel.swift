//
//  WidgetQuickAccessModel.swift
//  HomeClaroPay
//
//  Created by David Viloria Ortega on 3/03/22.
//

import Foundation


struct WidgetQuickAccessResponse{
    var responseCode: String
    var responseMessage: String?
    var responseSubject: String?
    var data: [WidgetQuickAccess]?
}

struct WidgetQuickAccess{
    var type: String
    var icon: String
    var promoIcon: String
    var backgroundColor: String
}

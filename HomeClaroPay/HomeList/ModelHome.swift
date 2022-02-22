//
//  ModelHome.swift
//  HomeClaroPay
//
//  Created by David Viloria Ortega on 21/02/22.
//

import Foundation

struct Widget: Codable{
    var type: String?
    var order: Int?
    var header: Header?
    var btnConfig: BtnConfig?
    var columns: Int?
}

struct BtnConfig: Codable{
    var title: String?
    var textColor: String?
    var visibility: Bool?
}

struct Header: Codable{
    var title: String?
    var textColor: String?
    var visibility: Bool?
}

struct HomeResponse: Codable{
    var responseCode: String
    var responseMessage: String?
    var responseSubject: String?
    var data: [Widget]?
}

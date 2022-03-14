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

protocol URLQueryParameterStringConvertible {
    var queryParameters: String {get}
}

extension Dictionary : URLQueryParameterStringConvertible {
    /**
     This computed property returns a query parameters string from the given NSDictionary. For
     example, if the input is @{@"day":@"Tuesday", @"month":@"January"}, the output
     string will be @"day=Tuesday&month=January".
     @return The computed parameters string.
    */
    var queryParameters: String {
        var parts: [String] = []
        for (key, value) in self {
            let part = String(format: "%@=%@",
                String(describing: key).addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!,
                String(describing: value).addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!)
            parts.append(part as String)
        }
        return parts.joined(separator: "&")
    }
    
}

extension URL {
    /**
     Creates a new URL by adding the given query parameters.
     @param parametersDictionary The query parameter dictionary to add.
     @return A new URL.
    */
    func appendingQueryParameters(_ parametersDictionary : Dictionary<String, String>) -> URL {
        let URLString : String = String(format: "%@?%@", self.absoluteString, parametersDictionary.queryParameters)
        return URL(string: URLString)!
    }
}

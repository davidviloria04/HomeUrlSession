//
//  NetworkManager.swift
//  HomeClaroPay
//
//  Created by David Viloria Ortega on 21/02/22.
//

import Foundation

class NetworkManager{
    
    public static var http_Ok_200: Int = 200
    public static var http_Ok_299: Int = 299
    public static var http_error_401: Int = 401
    public static var http_error_404: Int = 404
    public static var http_error_500: Int = 500
    
    static func request<T: Decodable>(url: String, method: String,type: T.Type, callBack: @escaping (_ data: T?, _ error: Error?) -> Void){
        guard let url = URL(string: url) else{
            print(">>>>> No se pudo conectar")
            let err = NSError(domain: "", code: 400, userInfo: [NSLocalizedDescriptionKey: "No se encuentra la Url"])
            callBack(nil, err)
            return
        }
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let err = error{
                print(">>>>> ¡Ha ocurrido un error en la tarea! \(String(describing: error?.localizedDescription))")
                callBack(nil, err)
                return
            }
            guard let response = response as? HTTPURLResponse else {
                print(">>>>> Error con la respuesta")
                let err = NSError(domain: "", code: 406, userInfo: [NSLocalizedDescriptionKey: "La respuesa no conforma el protocolo http"])
                callBack(nil, err)
                return
            }
            
            switch response.statusCode{
            case NetworkManager.http_Ok_200...NetworkManager.http_Ok_299:
                guard let data = data else {
                    print(">>>>> Error en la respuesta ")
                    callBack(nil, NSError(domain: "", code: response.statusCode, userInfo: [NSLocalizedDescriptionKey: "Respuesta vacia"]))
                    return
                }
                do{
                    print(">>>>> Data: \(String(describing: String(data: data, encoding: .utf8)))")
                    let result = try JSONDecoder().decode(T.self, from: data)
                    callBack(result, nil)
                    return
                }catch {
                    print("El error es \(error.localizedDescription)")
                    callBack(nil, NSError(domain: "", code: response.statusCode, userInfo: [NSLocalizedDescriptionKey: "\(error)"]))
                    return
                }
            case NetworkManager.http_error_401:
                print(">>>>> Eror 401")
                callBack(nil, NSError(domain: "", code: response.statusCode, userInfo: [NSLocalizedDescriptionKey: "Error 401"]))
                return
                
            case NetworkManager.http_error_404:
                print(">>>>> Not Found 404")
                callBack(nil, NSError(domain: "", code: response.statusCode, userInfo: [NSLocalizedDescriptionKey: "Erroe 404"]))
                return
                
            case NetworkManager.http_error_500:
                print(">>>>> Internal Server Error 500")
                callBack(nil, NSError(domain: "", code: response.statusCode, userInfo: [NSLocalizedDescriptionKey: "Erroe 500"]))
                return
                
            default:
                print(">>>>> Error http")
                callBack(nil, NSError(domain: "", code: response.statusCode, userInfo: [NSLocalizedDescriptionKey: "Error en el servicio"]))
                return
            }
        }
        task.resume()
    }
}

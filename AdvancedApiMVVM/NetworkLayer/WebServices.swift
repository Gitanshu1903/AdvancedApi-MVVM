//
//  WebServices.swift
//  AdvancedApiMVVM
//
//  Created by ERASOFT on 19/05/22.
//

import Foundation

class WebServices {
    
    func requestGetURL(enterURL: String,
                       success: @escaping (JSONDecoder, Data) -> Void,
                       failure: @escaping (Error) -> Void) {
        
        let urlRequest = URLRequest(url: URL(string: enterURL)!)
        let session = URLSession.shared
        let task = session.dataTask(with: urlRequest) { data, response, error in
            
            let decoder = JSONDecoder()
            do {
                success(decoder, data!)
            } catch {
                failure(error)
            }
        }
        task.resume()
    }
}

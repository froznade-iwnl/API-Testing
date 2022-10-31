//
//  DataSecond.swift
//  API_Testing
//
//  Created by CTSS Students on 31/10/22.
//

import Foundation
import SwiftUI

struct dataNews {
    var name: String
}

class DataCollector: ObservableObject {
    
    func getData(completion: @escaping (URLResponse?, Error?) -> Void) {
        
        let session = URLSession.shared
        let url = URL(string: "https://api.nhs.uk/mental-health/social-care-and-your-rights")!
        var urlRequest = URLRequest(url: url)
        
        urlRequest.httpMethod = "GET"
        
        urlRequest.setValue("521de92e6ac34d72ac71a4b4eda29be7", forHTTPHeaderField: "subscription-key")
        
        let task = session.dataTask(with: urlRequest) { data, response, error in
            completion(response, error)
            print(data)
        }
        
        task.resume()
    }
    
}


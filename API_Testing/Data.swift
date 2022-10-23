//
//  Data.swift
//  API_Testing
//
//  Created by CTSS Students on 23/10/22.
//

import Foundation
import SwiftUI

struct mentalHealthNews: Codable {
    var title: String
    var url: String
    var source: String
}

class NewsManager: ObservableObject {
    
    @Published var news: mentalHealthNews?
    
    func getNews() {
        let url = URL(string: "https://mental-health-info-api.p.rapidapi.com/news")!
        var request = URLRequest(url: url)
        let session = URLSession.shared
        
        news = nil
        
        request.httpMethod = "GET"
//        request.addValue("mental-health-info-api.p.rapidapi.com", forHTTPHeaderField: "X-RapidAPI-Host")
//        request.addValue("key-here", forHTTPHeaderField: "X-RapidAPI-Key")
        
        let headers = [
            "X-RapidAPI-Key": "key-here", //change to KEY
            "X-RapidAPI-Host": "mental-health-info-api.p.rapidapi.com"
        ]
        
        request.allHTTPHeaderFields = headers

        session.dataTask(with: request) { data, response, error in
            if let data = data {
                let decoder = JSONDecoder()
                DispatchQueue.main.async {
                    self.news = try? decoder.decode(mentalHealthNews.self, from: data)
                }
            }
        }.resume()
    }
}

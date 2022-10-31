//Created by Raditya

import Foundation
import SwiftUI

struct healthNews: Codable, Identifiable, Hashable {
    
    let id = UUID()
    var title: String
    var url: String
    var source: String
    
}


class NewsCollector: ObservableObject {
    
    @Published var newsData : [healthNews] = []
    
    func getData() {
        
        let url = URL(string: "https://mental-health-info-api.p.rapidapi.com/news/dna")!
        let session = URLSession.shared
        var urlRequest = URLRequest(url: url)
        
        urlRequest.setValue("4356d1995cmshcb3a848e79b4040p1adfa3jsn866463cb3957", forHTTPHeaderField: "X-RapidAPI-Key")
        urlRequest.setValue("mental-health-info-api.p.rapidapi.com", forHTTPHeaderField: "X-RapidAPI-Host")
        
        session.dataTask(with: urlRequest) { data, response, error in
            if let data = data {
                let decoder = JSONDecoder()
                DispatchQueue.main.async {
                    self.newsData = try! decoder.decode([healthNews].self, from: data)
                    self.newsData = Array(Set(self.newsData))
                }
            }
        }.resume()
        
    }
    
}

//
//  ContentView.swift
//  API_Testing
//
//  Created by CTSS Students on 23/10/22.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var mentalHealthNews = NewsManager()
    
    var body: some View {
        VStack {
            if let news = mentalHealthNews.news {
                Text(news.title)
                    .padding()
            } else {
                ProgressView()
                    .progressViewStyle(.circular)
            }
        }
        .onAppear {
            mentalHealthNews.getNews()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

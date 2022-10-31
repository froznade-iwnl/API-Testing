//
//  ContentView.swift
//  API_Testing
//
//  Created by CTSS Students on 23/10/22.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var datas = NewsCollector()
    @Environment(\.openURL) private var openURL
    
    var body: some View {
        
        ZStack {
            
            Color.green
                .ignoresSafeArea(.all)
            
            NavigationView {
                
    //            HStack {
    //                Text("Mental Health News")
    //                    .font(.title)
    //                    .bold()
    //
    //                Spacer()
    //
    //            }
                
                List {
                    ForEach(datas.newsData) { data in
                        VStack(alignment: .leading){
                            Text(data.title)
                                .font(.body)
                                .lineLimit(5)
                            
                            HStack {
                                Text(data.source)
                                    .font(.caption)
                                    .foregroundColor(.gray)
                                    .italic()
                                .padding(.top, 2)
                                
                                Spacer()
                                
                                Text("Read more")
                                    .font(.caption)
                                    .foregroundColor(.blue)
                                    .underline()
                                
                            }
                            
                        }.onTapGesture {
                            openURL(URL(string: data.url)!)
                        }
                        
                    }
                }
                .navigationTitle("Mental Health News")
                .environmentObject(datas)
                .onAppear {
    //                data.getData() { response, error in
    //                    print(response)
    //                }
                    datas.getData()
                }
                
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

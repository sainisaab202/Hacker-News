//
//  ContentView.swift
//  Hacker News
//
//  Created by GurPreet SaiNi on 2024-03-26.
//

import SwiftUI

struct ContentView: View {
    
    //setting this variable as @Observed i.e. our listner and we are subscribing to the changes
    @ObservedObject var networkManager = NetworkManager()
    
    var body: some View {
        //for navigation view
        NavigationStack{
            //for table view
            List(networkManager.posts) { post in
                NavigationLink(destination: DetailView(url: post.url)) {
                    HStack {
                        Text(String(post.points))
                        Text(post.title)
                            .padding(.horizontal)
                    }
                }
            }
            .navigationTitle("H@cker New$")
        }
        .onAppear(perform: {
            networkManager.fetchData()
        })
    }
}

#Preview {
    ContentView()
}

//let posts = [
//    Post(id:"1", title: "Hello"),
//    Post(id:"2", title: "Bonjour"),
//    Post(id:"3", title: "Hola")
//]

//
//  DetailView.swift
//  Hacker News
//
//  Created by GurPreet SaiNi on 2024-03-27.
//

import SwiftUI
import WebKit

struct DetailView: View {
    
    let url: String?
    
    var body: some View {
        WebView(urlString: url)
        
        //for title
            .navigationTitle("current news")
            .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    DetailView(url: "https://www.google.com")
}


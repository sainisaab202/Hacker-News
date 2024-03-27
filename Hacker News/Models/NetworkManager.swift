//
//  NetworkManager.swift
//  Hacker News
//
//  Created by GurPreet SaiNi on 2024-03-26.
//

import Foundation

//obbservable so that if underlying content changes it can notify
class NetworkManager: ObservableObject{
    
    //marking this as @Published so that we know, if this property changes we would like to notify
    @Published var posts = [Post]()
    
    func fetchData(){
        if let url = URL(string: "https://hn.algolia.com/api/v1/search?tags=front_page"){
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { data, response, error in
                if error == nil{
                    //we have some data
                    let decorder = JSONDecoder()
                    if let safeData = data{
                        do{
                            let result = try decorder.decode(Results.self, from: safeData)
                            
                            DispatchQueue.main.async{
                                self.posts = result.hits
                            }
                        }catch {
                            print(error)
                        }
                        
                    }
                }
            }
            task.resume()
        }
    }
}

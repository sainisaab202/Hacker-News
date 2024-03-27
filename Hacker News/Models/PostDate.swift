//
//  PostDate.swift
//  Hacker News
//
//  Created by GurPreet SaiNi on 2024-03-27.
//

import Foundation

struct Results: Decodable{
    let hits: [Post]
}

struct Post: Decodable, Identifiable {
    var id: String {objectID}
    let objectID: String
    let points: Int
    let title: String
    let url: String?
}

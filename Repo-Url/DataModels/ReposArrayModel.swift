//
//  RepoArrayModel.swift
//  Repo-Url
//
//  Created by Ioana Gadinceanu on 5/29/20.
//  Copyright © 2020 Ioana Gadinceanu. All rights reserved.
//

import Foundation

struct Repo: Codable {
     
     let user: String
     let link: String
     let stars: Int
     let watchers:Int
     let forks: Int
     let description: String
   
     enum CodingKeys: String, CodingKey{
        case user = "name"
        case link = "url"
        case stars = "stargazers_count"
        case watchers = "watchers_count"
        case forks
        case description
     }
}

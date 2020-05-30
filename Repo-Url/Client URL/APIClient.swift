
//
//  APICline.swift
//  Repo-Url
//
//  Created by Ioana Gadinceanu on 5/29/20.
//  Copyright © 2020 Ioana Gadinceanu. All rights reserved.
//

import Foundation
import Alamofire

class APIClient {
   
   enum ReposError: Error {
      case dataNotAvailable
   }
   
   func loadRepos(completion: @escaping (Result<[Repo], Error>) -> Void) {
      AF.request("https://api.github.com/orgs/octokit/repos?q=iOS+sort:stars").responseDecodable(of: Array<Repo>.self) { (response) in
         
         //  print(response.value)
         guard let repos = response.value else {
            completion(.failure(ReposError.dataNotAvailable))
            return
         }
         completion(.success(repos))
      }
   }
}



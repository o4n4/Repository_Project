//
//  ViewController.swift
//  Repo-Url
//
//  Created by Ioana Gadinceanu on 5/28/20.
//  Copyright © 2020 Ioana Gadinceanu. All rights reserved.
//

import UIKit

class RepoTableViewController: UITableViewController {
   
   var repos: [Repo] = []
   var api = APIClient()
   var ascending = false
   
   override func viewDidLoad() {
      super.viewDidLoad()
      
      api.loadRepos(completion: { (result: Result<[Repo], Error>) in
         switch result {
         case .success(let repositories):
            
            self.repos = repositories
            self.tableView.reloadData()
            
         case .failure(let error):
            print("\(error)")
         }
      })
      navigationController?.navigationBar.prefersLargeTitles = true
   }
   
   
   @IBAction func sortAction(_ sender: UIBarButtonItem) {
      sortRepositories()
      tableView.reloadData()
   }
   
   
   func sortRepositories() {
      repos.sort(by: {
         if ascending {
            return $0.stars <  $1.stars
         } else {
            return $0.stars >  $1.stars
         }
      })
      ascending.toggle()
   }
}


//MARK: Extension
extension RepoTableViewController {
   override func numberOfSections(in tableView: UITableView) -> Int {
      return 1
   }
   
   
   override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      return repos.count
   }
   
   
   override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      let cell = tableView.dequeueReusableCell(withIdentifier: "repoCell", for: indexPath) as! RepoViewCell
      cell.userRepoLabel.text = repos[indexPath.row].user
      cell.descriptionRepoLabel.text = repos[indexPath.row].description
      return cell
   }
   
   
   
   override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
      
      let controller =  UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "DetailViewController") as! DetailViewController
      controller.repo = repos[indexPath.row]
      present(controller, animated: true, completion: nil)
   }
   
}




//
//  DetailViewController.swift
//  Repo-Url
//
//  Created by Ioana Gadinceanu on 5/29/20.
//  Copyright © 2020 Ioana Gadinceanu. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
   
   var repo:Repo!
   
   @IBOutlet weak var userLabel: UILabel!
   @IBOutlet weak var forkLabel: UILabel!
   @IBOutlet weak var watchersLabel: UILabel!
   @IBOutlet weak var linkLabel: UILabel!
   @IBOutlet weak var starsLabel: UILabel!
   
   
   override func viewDidLoad() {
      super.viewDidLoad()
      view.backgroundColor = .white
      
      userLabel.text = repo.user
      linkLabel.text = repo.link
      forkLabel.text = String(repo.forks)
      watchersLabel.text = String(repo.watchers)
      starsLabel.text = String(repo.stars)
   }
   
   @IBAction func dismiss() {
      dismiss(animated: true, completion: nil)
   }
}

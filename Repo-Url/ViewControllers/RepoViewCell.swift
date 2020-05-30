//
//  RepoViewCell.swift
//  Repo-Url
//
//  Created by Ioana Gadinceanu on 5/30/20.
//  Copyright © 2020 Ioana Gadinceanu. All rights reserved.
//

import UIKit

class RepoViewCell: UITableViewCell {
   
   @IBOutlet weak var userRepoLabel: UILabel!
   @IBOutlet weak var descriptionRepoLabel: UILabel!
   
   override func awakeFromNib() {
      super.awakeFromNib()
   }
   
   override func setSelected(_ selected: Bool, animated: Bool) {
      super.setSelected(selected, animated: animated)
   }
}

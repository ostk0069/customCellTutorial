//
//  StationTableViewCell.swift
//  CustomCellTutorial
//
//  Created by Takuma Osada on 2019/02/17.
//  Copyright © 2019 Takuma Osada. All rights reserved.
//

import UIKit

class StationTableViewCell: UITableViewCell {

    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var prefecture: UILabel!
  
    override func awakeFromNib() {
          super.awakeFromNib()
    }
  
    func setCell(station: Station) {
      self.name.text = station.name as String
      self.prefecture.text = station.prefecture as String
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}

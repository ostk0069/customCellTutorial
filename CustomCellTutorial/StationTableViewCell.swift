//
//  StationTableViewCell.swift
//  CustomCellTutorial
//
//  Created by Takuma Osada on 2019/02/17.
//  Copyright © 2019 Takuma Osada. All rights reserved.
//

import UIKit
import Instantiate
import InstantiateStandard

class StationTableViewCell: UITableViewCell {

    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var prefecture: UILabel!
  
    override func awakeFromNib() {
          super.awakeFromNib()
    }
  
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}

extension StationTableViewCell: Reusable & NibType {
  typealias Dependency = Station
  
  func inject(_ dependency: Dependency) {
    let station = dependency
    name.text = station.name
    prefecture.text = station.prefecture
  }
}

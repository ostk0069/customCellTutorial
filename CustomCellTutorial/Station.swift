//
//  Station.swift
//  CustomCellTutorial
//
//  Created by Takuma Osada on 2019/02/17.
//  Copyright © 2019 Takuma Osada. All rights reserved.
//

import Foundation

class Station : NSObject {
  var name: String
  var prefecture: String

  init(name: String, prefecture: String){
    self.name = name as String
    self.prefecture = prefecture as String
  }
}

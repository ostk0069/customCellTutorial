//
//  Station.swift
//  CustomCellTutorial
//
//  Created by Takuma Osada on 2019/02/17.
//  Copyright © 2019 Takuma Osada. All rights reserved.
//

import Foundation

class StationSet : NSObject {
  var code: String
  var name: String
  var prefecture: String
  
  init(code: String, name: String, prefecture: String){
    self.code = code
    self.name = name
    self.prefecture = prefecture
    }
}

struct Data: Decodable {
  var ResultSet: ResultSet
}

public struct ResultSet: Decodable {
  var Point: [Point]
}

public struct Point: Decodable {
  public let Station: Station
  public let Prefecture: Prefecture
}

public struct Station: Decodable {
  public let code: String
  public let name: String
  public let yomi: String

  public enum CodingKeys: String, CodingKey {
    case code
    case name = "Name"
    case yomi =  "Yomi"
  }
}

public struct Prefecture: Decodable  {
  public let name: String

  public enum CodingKeys: String, CodingKey {
    case name = "Name"
  }
}

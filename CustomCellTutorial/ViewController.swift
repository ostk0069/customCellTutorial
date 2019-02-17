//
//  ViewController.swift
//  CustomCellTutorial
//
//  Created by Takuma Osada on 2019/02/17.
//  Copyright © 2019 Takuma Osada. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

  @IBOutlet weak var stationList: UITableView!
  var stations:[StationSet] = [StationSet]()
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    stationList.dataSource = self
    stationList.delegate = self
    stationList.register(UINib(nibName: "StationTableViewCell", bundle: nil), forCellReuseIdentifier: "StationTableViewCell")
    self.setupStationSets()
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  func setupStationSets() {
    //stations = [StationSet(name: "飯田橋", prefecture: "東京都新宿区"), StationSet(name: "九段下", prefecture: "東京都千代田区"), StationSet(name: "御茶ノ水", prefecture: "東京都文京区") ];
    let url = URL(string: "http://api.ekispert.jp/v1/json/station?key=[駅すぱあとのKEY]")!
    Alamofire.request(url, method: .get).responseJSON { response in
      switch response.result {
      case .success:
        do {
          let resultSetInfo = try JSONDecoder().decode(Data.self, from: response.data!)

          let stations = resultSetInfo.ResultSet.Point.map({ (Point) -> StationSet in
            let name = Point.Station.name
            let code = Point.Station.code
            let prefecture = Point.Prefecture.name
            let stationArray = StationSet(code: code, name: name, prefecture: prefecture)
            return stationArray
          })

          self.stations = stations
          DispatchQueue.main.async {
            self.stationList.reloadData()
          }
             } catch {
          print(error)
        }
      case .failure(let error):
        print(error)
      }
    }
  }
  
  func numberOfSectionsInTableView(tableView: UITableView) -> Int {
    return 1
  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return self.stations.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "StationTableViewCell", for: indexPath ) as! StationTableViewCell
    
    cell.setCell(station: self.stations[indexPath.row])
    
    return cell
  }
}


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
    var stations:[Station] = [Station]()

    override func viewDidLoad() {
        super.viewDidLoad()
        stationList.dataSource = self
        stationList.delegate = self
        stationList.register(UINib(nibName: "StationTableViewCell", bundle: nil), forCellReuseIdentifier: "StationTableViewCell")
        self.setupStations()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    func setupStations() {
        stations = [Station(name: "飯田橋", prefecture: "東京都新宿区"), Station(name: "九段下", prefecture: "東京都千代田区"), Station(name: "御茶ノ水", prefecture: "東京都文京区") ];
    }

    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return stations.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "StationTableViewCell", for: indexPath ) as! StationTableViewCell
        cell.setCell(station: stations[indexPath.row])
        
        return cell
    }
}


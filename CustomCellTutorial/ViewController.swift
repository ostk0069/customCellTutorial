//
//  ViewController.swift
//  CustomCellTutorial
//
//  Created by Takuma Osada on 2019/02/17.
//  Copyright © 2019 Takuma Osada. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var stationList: UITableView!
    var stations:[Station] = [Station]()

    override func viewDidLoad() {
        super.viewDidLoad()
        stationList.dataSource = self
        stationList.delegate = self
        stationList.registerNib(type: StationTableViewCell.self)
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
        let cell = StationTableViewCell.dequeue(from: stationList, for: indexPath, with: stations[indexPath.row])
        return cell
    }
}


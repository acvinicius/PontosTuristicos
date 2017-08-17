//
//  PoiTableViewController.swift
//  PontosTuristicos
//
//  Created by Vinicius Araujo Castro on 08/08/17.
//  Copyright © 2017 Vinicius Araujo Castro. All rights reserved.
//

import UIKit

class PoiTableViewController : UITableViewController {
    
    var dataSource : [InfoPoi] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadJson()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    func loadJson() {
        if let jsonURL = Bundle.main.url(forResource: "poi", withExtension: "json") {
            let data: Data = try! Data(contentsOf: jsonURL)
            let json = try! JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions()) as! [[String: Any]]
            for item in json {
                let name = item["name"] as! String
                let address = item["address"] as! String
                let latitude = item["latitude"] as! Double
                let longitude = item["longitude"] as! Double
                let poi = InfoPoi(name: name, address: address, latitude: latitude, longitude: longitude)
                dataSource.append(poi)
            }
        }
        tableView.reloadData()
    }
    

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let poi = dataSource[indexPath.row]
        cell.textLabel?.text = poi.name
        cell.detailTextLabel?.text = poi.address
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender:Any?) {
        if segue.identifier! == "show" {
            let vc = segue.destination as! PoiMapViewController
            vc.poi = dataSource[tableView.indexPathForSelectedRow!.row]
        }
    }

}

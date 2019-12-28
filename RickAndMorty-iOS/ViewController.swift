//
//  ViewController.swift
//  RickAndMorty-iOS
//
//  Created by Tosh  on 12/29/19.
//  Copyright © 2019 Tosh . All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return id.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell")
        cell?.textLabel?.text = name[indexPath.row]
        
        return cell!
    }
    
    
    var id  = [String]()
    var name = [String]()
    var status = [String]()
    var gender = [String]()
    var species = [String]()

    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
        fetchData()
        
    }

    func fetchData(){
         let url = "https://rickandmortyapi.com/api/character/"
        
       Alamofire.request(url, method: .get).responseJSON { (response) in
            switch response.result{
            case .success:
                
                let result = try? JSON(data: response.data!)
                let resultArray = result!["results"]
                
                self.id.removeAll()
                self.name.removeAll()
                self.status.removeAll()
                self.gender.removeAll()
                self.species.removeAll()
                
                for i in resultArray.arrayValue {
                    let id = i["id"].stringValue
                    self.id.append(id)
                    
                    let name = i["name"].stringValue
                    self.name.append(name)
                    
                    let status = i["status"].stringValue
                    self.status.append(status)
                    
                    let gender = i["gender"].stringValue
                    self.gender.append(gender)
                    
                    let species = i["species"].stringValue
                    self.species.append(species)
                }
                self.tableView.reloadData()
                break
            case .failure:
                print(response.error!)
                break
            }
        }
    }

}


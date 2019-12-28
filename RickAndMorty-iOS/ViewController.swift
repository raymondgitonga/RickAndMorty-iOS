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

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let url = "https://rickandmortyapi.com/api/character/"
        
        
        Alamofire.request(url, method: .get).responseJSON { (response) in
            switch response.result{
            case .success:
                print(response.result)
                
                let result = try? JSON(data: response.data!)
                print(result)
                break
            case .failure:
                print(response.error!)
                break
            }
        }
    }


}


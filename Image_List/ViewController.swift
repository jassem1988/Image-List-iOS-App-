//
//  ViewController.swift
//  Image_List
//
//  Created by Jassem Al-Buloushi on 4/3/19.
//  Copyright © 2019 Jassem Al-Buloushi. All rights reserved.
//

import UIKit

class ViewController: UITableViewController  {
    
    //Properties
    var pictures = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let fm = FileManager.default
        let path = Bundle.main.resourcePath!
        let items = try! fm.contentsOfDirectory(atPath: path)
        
        
        for item in items {
            
            if item.hasPrefix("nssl") {
                //This is a picture to load!!
                pictures.append(item)
                
            }
        }
        
        print(pictures)
        
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pictures.count
    }


}


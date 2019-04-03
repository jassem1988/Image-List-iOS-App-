//
//  ViewController.swift
//  Image_List
//
//  Created by Jassem Al-Buloushi on 4/3/19.
//  Copyright © 2019 Jassem Al-Buloushi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let fm = FileManager.default
        let path = Bundle.main.resourcePath!
        let items = try! fm.contentsOfDirectory(atPath: path)
        
        
        for item in items {
            
            if item.hasPrefix("nssl") {
                //This is a picture to load!!
                
            }
        }
        
    }


}


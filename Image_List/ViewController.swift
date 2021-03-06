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
        
        title = "Storm Viewer"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(recommendTapped))
        
        performSelector(inBackground: #selector(loadImages), with: nil)
    }
    
    @objc func loadImages() {
        let fm = FileManager.default
        let path = Bundle.main.resourcePath!
        let items = try! fm.contentsOfDirectory(atPath: path)
        
        
        for item in items {
            
            if item.hasPrefix("nssl") {
                //This is a picture to load!!
                pictures.append(item)
                pictures.sort()
            }
        }
        
        print(pictures)
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pictures.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Picture", for: indexPath)
        
        cell.textLabel?.text = pictures[indexPath.row]
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let vc = storyboard?.instantiateViewController(withIdentifier: "Detail") as? DetailViewController {
            vc.selectedImage = pictures[indexPath.row]
            vc.numberOfPicture = indexPath.row + 1
            vc.totalPictures = pictures.count
            navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    @objc func recommendTapped() {
        let textToShare = "This is an amazing app!!!"
        let url = URL(string: "https://www.google.com")!
        
        let vc = UIActivityViewController(activityItems: [textToShare, url], applicationActivities: [])
        vc.popoverPresentationController?.barButtonItem = navigationItem.rightBarButtonItem
        present(vc, animated: true)
    }
    

}


//
//  ViewController.swift
//  Project1v2
//
//  Created by Romeno Wenogk Fernando on 04/06/2020.
//  Copyright © 2020 Romeno Wenogk Fernando. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    var pictures = [String]();
    override func viewDidLoad() {
        super.viewDidLoad();
        title = "Storm Viewer"
        navigationController?.navigationBar.prefersLargeTitles = true;
        let fm = FileManager.default;
        let path = Bundle.main.resourcePath!
        let items = try! fm.contentsOfDirectory(atPath: path)
        
        for item in items where item.hasPrefix("nssl") {
            pictures.append(item)
        }
        pictures = pictures.sorted()
        
        print(pictures)
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pictures.count;
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Picture", for: indexPath)
        cell.textLabel?.text = pictures[indexPath.row]
        return cell;
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let vc = storyboard?.instantiateViewController(identifier: "Detail") as? DetailViewController {
            vc.selectedImage = pictures[indexPath.row]
            vc.imageCount = pictures.count
            vc.imageIndex = indexPath.row
            navigationController?.pushViewController(vc, animated: true)
        }
    }


}


//
//  PhotoTableViewController.swift
//  Photos
//
//  Created by Valerio Ferrucci on 24/07/14.
//  Copyright (c) 2014 Tabasoft. All rights reserved.
//

import UIKit

class PhotoTableViewController: UITableViewController {
 
    let myarray = ["palloni", "panorama", "tramonto"]
    
    override func viewDidLoad() {
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "LabelCell")
    }
    
    // REMARK:
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return myarray.count
    }
    
    // REMARK:
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        var image : UIImage? = nil
        
        switch indexPath.row {
            
        case 0:
            image = UIImage(named: "palloni")
        case 1:
            image = UIImage(named: "panorama")
        default:
            image = UIImage(named: "tramonto")
        }
        
        let app = UIApplication.shared.delegate as! AppDelegate
        app.selectedPhoto = indexPath.row
        
        let photoVC = UIStoryboard(name:"Main", bundle:nil).instantiateViewController(withIdentifier: "photovc") as! PhotoViewController
        photoVC.image = image
        self.showDetailViewController(photoVC, sender: self)
    }
    
    // REMARK:
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "LabelCell", for: indexPath)
        cell.accessoryType = UITableViewCellAccessoryType.disclosureIndicator
        cell.textLabel?.text = myarray[indexPath.row]

        return cell
    }
    
}

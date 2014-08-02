//
//  PhotoTableViewController.swift
//  Photos
//
//  Created by Valerio Ferrucci on 24/07/14.
//  Copyright (c) 2014 Tabasoft. All rights reserved.
//

import UIKit

class PhotoTableViewController: UITableViewController, UITableViewDelegate {

    override func tableView(tableView: UITableView!, didSelectRowAtIndexPath indexPath: NSIndexPath!) {
        
            var image : UIImage? = nil
            
            switch indexPath.row {
                
            case 0:
                image = UIImage(named: "palloni")
            case 1:
                image = UIImage(named: "panorama")
            default:
                image = UIImage(named: "tramonto")
            }
        
        let app = UIApplication.sharedApplication().delegate as AppDelegate
        app.selectedPhoto = indexPath.row
        
        let photoVC = UIStoryboard(name:"Main", bundle:nil).instantiateViewControllerWithIdentifier("photovc") as PhotoViewController
        photoVC.image = image
        self.showDetailViewController(photoVC, sender: self)
    }
}
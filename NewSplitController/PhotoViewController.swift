//
//  ViewController.swift
//  Photos
//
//  Created by Valerio Ferrucci on 23/07/14.
//  Copyright (c) 2014 Tabasoft. All rights reserved.
//

import UIKit

class PhotoViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView! = nil
    
    var image : UIImage? = nil {
        willSet(newImage) {
        }
        didSet {
            updateImageView()
        }
    }
    
    private func updateImageView() {
        if let _image = image {
            if let _imageView = imageView {
                _imageView.image = _image
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        updateImageView()
    }


}


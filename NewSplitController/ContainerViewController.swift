//
//  ContainerViewController.swift
//  NewSplitController
//
//  Created by Valerio Ferrucci on 01/08/14.
//  Copyright (c) 2014 Valerio Ferrucci. All rights reserved.
//

import UIKit

class ContainerViewController : UIViewController {
    
    var customTraitCollection : UITraitCollection? = nil {
        
        didSet {
            forceNewTrait()
        }
    }
    
    private func forceNewTrait() {
        self.setOverrideTraitCollection(customTraitCollection, forChildViewController:viewController)
    }
    
    var viewController : UISplitViewController? = nil {

        didSet {
            
            oldValue?.willMoveToParentViewController(nil)
            oldValue?.view.removeFromSuperview()
            oldValue?.removeFromParentViewController()
            self.setOverrideTraitCollection(nil, forChildViewController:oldValue)
        
            if viewController != nil {
                self.addChildViewController(viewController)
                let view = viewController!.view
                self.view.addSubview(view)
                viewController?.didMoveToParentViewController(self)
                forceNewTrait()
            }
        }
    }
    
    override func viewWillTransitionToSize(size: CGSize, withTransitionCoordinator coordinator: UIViewControllerTransitionCoordinator!) {
        
        if size.width > 320 {
            customTraitCollection = UITraitCollection(horizontalSizeClass:.Regular)
        } else {
            customTraitCollection = nil;
        }
    
        super.viewWillTransitionToSize(size, withTransitionCoordinator: coordinator);
    }
    
}
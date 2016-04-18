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
        if let _viewController = viewController {
            self.setOverrideTraitCollection(customTraitCollection, forChildViewController:_viewController)
        }
    }
    
    var viewController : UISplitViewController? = nil {

        didSet {
            
            if let _oldValue = oldValue {
                _oldValue.willMoveToParentViewController(nil)
                _oldValue.view.removeFromSuperview()
                _oldValue.removeFromParentViewController()
                self.setOverrideTraitCollection(nil, forChildViewController:_oldValue)
            
            }
            if let _viewController = viewController {
                self.addChildViewController(_viewController)
                let view = _viewController.view
                self.view.addSubview(view)
                _viewController.didMoveToParentViewController(self)
                forceNewTrait()
            }
        }
    }
    
    override func viewWillTransitionToSize(size: CGSize, withTransitionCoordinator coordinator: UIViewControllerTransitionCoordinator) {
        
        if size.width > 320 {
            customTraitCollection = UITraitCollection(horizontalSizeClass:.Regular)
        } else {
            customTraitCollection = nil;
        }
    
        super.viewWillTransitionToSize(size, withTransitionCoordinator: coordinator);
    }
    
}
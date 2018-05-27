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
                _oldValue.willMove(toParentViewController: nil)
                _oldValue.view.removeFromSuperview()
                _oldValue.removeFromParentViewController()
                self.setOverrideTraitCollection(nil, forChildViewController:_oldValue)
            
            }
            if let _viewController = viewController {
                self.addChildViewController(_viewController)
                let view = _viewController.view
                self.view.addSubview(view!)
                _viewController.didMove(toParentViewController: self)
                forceNewTrait()
            }
        }
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        if size.width > 320 {
            customTraitCollection = UITraitCollection(horizontalSizeClass:.regular)
        } else {
            customTraitCollection = nil;
        }
        
        super.viewWillTransition(to: size, with: coordinator);
        
    }

}

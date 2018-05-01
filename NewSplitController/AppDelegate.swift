//
//  AppDelegate.swift
//  NewSplitController
//
//  Created by Valerio Ferrucci on 01/08/14.
//  Copyright (c) 2014 Valerio Ferrucci. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate, UISplitViewControllerDelegate {
                            
    var window: UIWindow?

    //MARK: - UISplit Delegate
    
    var selectedPhoto : Int? = nil

    /* When the split expands, it sets its current (and only) vc as the new primary. If you want to set another vc ad the primary, return it from this method */
    func primaryViewControllerForExpandingSplitViewController(splitViewController: UISplitViewController) -> UIViewController? {
        
        return nil
    }
    
    /* When the split collapses it uses its current primary vc as the new single vc. If you want it to set a different vc as the new vc, return it from this method */
    func primaryViewControllerForCollapsingSplitViewController(splitViewController: UISplitViewController) -> UIViewController? {
        
        return nil
    }
    
    /* This is called just before the split is collapsing. If this method return false, the split calls the primary's method "collapseSecondaryViewController:forSplitViewController" to give it a chance to do something with the secondary VC (who is disappearing). i.e. the NavigationController uses collapseSecondaryViewController:forSplitViewController to push the secondary as the new primary.
    
    If return true the split does nothing and the primary will be the single vc */
    func splitViewController(splitViewController: UISplitViewController, collapseSecondaryViewController secondaryViewController: UIViewController, ontoPrimaryViewController primaryViewController: UIViewController) -> Bool {
        
        // if no photo selected, leave the primary as the main vc
        return selectedPhoto == nil
    }
    
    /* When the split expands and this method return nil the split calls the primary VC method "separateSecondaryViewControllerForSplitViewController" to obtain the new secondary (the NavigationController reutrn the last vc popped from the stack as the new secondary), otherwise it uses this VC as the new secondary */
    func splitViewController(splitViewController: UISplitViewController, separateSecondaryViewControllerFromPrimaryViewController primaryViewController: UIViewController) -> UIViewController? {
        
        if selectedPhoto != nil {
            return nil
        } else {
            // if no photo selected, push an empty secondary
            return PhotoViewController()    // uno vuoto
        }
    }

    //MARK: - App Delegate
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        self.window = UIWindow(frame: UIScreen.main.bounds)
        self.window!.backgroundColor = UIColor.white
        self.window!.makeKeyAndVisible()

        let splitVC = UIStoryboard(name:"Main", bundle:nil).instantiateViewController(withIdentifier: "splitVC") as! UISplitViewController
        splitVC.delegate = self
        // never hide the master
        splitVC.preferredDisplayMode = .allVisible;
        
        let containerController = ContainerViewController()
        containerController.viewController = splitVC

        self.window!.rootViewController = containerController;

        return true
    }

}


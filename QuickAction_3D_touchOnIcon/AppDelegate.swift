//
//  AppDelegate.swift
//  QuickAction_3D_touchOnIcon
//
//  Created by MacBook Pro on 8/14/19.
//  Copyright © 2019 MacBook Pro. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var vcsArray = [UIViewController]()


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let prvi = storyboard.instantiateViewController(withIdentifier: "prviVC") as! prviVC
        let drugi = storyboard.instantiateViewController(withIdentifier: "drugiVC") as! drugiVC
        let treci = storyboard.instantiateViewController(withIdentifier: "treciVC") as! treciVC
        
        vcsArray = [prvi, drugi, treci]
        
        
        return true
    }

    enum ShortcutType : String {
        case mountains = "mountains"
        case space = "space"
        case ocean = "ocean"
    }
    
    func application(_ application: UIApplication, performActionFor shortcutItem: UIApplicationShortcutItem, completionHandler: @escaping (Bool) -> Void) {
        
        let navVC = window?.rootViewController as! UINavigationController
        navVC.setViewControllers(vcsArray, animated: false)
        
        //com.jonnyb.Shortcut.mountains
        if let type = shortcutItem.type.components(separatedBy: ".").last {
            switch type {
            
            case ShortcutType.space.rawValue:
                //print("this is space.")
                navVC.popToViewController(vcsArray[1], animated: true)
                completionHandler(true)
            case ShortcutType.ocean.rawValue:
                //print("Love the beach.")
                navVC.popToViewController(vcsArray[2], animated: true)
                completionHandler(true)
            default:
            //print("these are the mountains")
                navVC.popToRootViewController(animated: true)
                completionHandler(true)
            }
        }
        completionHandler(false)
        
    }


}


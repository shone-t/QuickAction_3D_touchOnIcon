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


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        let oceanShortcut = UIMutableApplicationShortcutItem(type: "\(String(describing: Bundle.main.bundleIdentifier)).ocean", localizedTitle: "Ocean", localizedSubtitle: "subtitle 3", icon: UIApplicationShortcutIcon.init(templateImageName: "OceanShort"), userInfo: nil)
        let spaceShortcut = UIMutableApplicationShortcutItem(type: "\(String(describing: Bundle.main.bundleIdentifier)).space", localizedTitle: "Space", localizedSubtitle: "subtitle 2", icon: UIApplicationShortcutIcon.init(templateImageName: "SpaceShort"), userInfo: nil)
        let mountainShortcut = UIMutableApplicationShortcutItem(type: "\(String(describing: Bundle.main.bundleIdentifier)).mountain", localizedTitle: "Mountain", localizedSubtitle: "subtitle 1", icon: UIApplicationShortcutIcon.init(templateImageName: "MountainShort"), userInfo: nil)
        application.shortcutItems = [mountainShortcut, spaceShortcut, oceanShortcut]
        return true
        
    }

    enum ShortcutType : String {
        case mountains = "mountains"
        case space = "space"
        case ocean = "ocean"
    }
 
    func application(_ application: UIApplication, performActionFor shortcutItem: UIApplicationShortcutItem, completionHandler: @escaping (Bool) -> Void) {
        if let type = shortcutItem.type.components(separatedBy: ".").last {
            
            let navVc = window?.rootViewController as! UITabBarController
            
            switch type {
            case ShortcutType.space.rawValue:
                navVc.selectedIndex = 1
                completionHandler(true)
            case ShortcutType.ocean.rawValue:
                navVc.selectedIndex = 2
                completionHandler(true)
            default:
                navVc.selectedIndex = 0
                completionHandler(true)
            }
            completionHandler(false)
            
        }
    }

}


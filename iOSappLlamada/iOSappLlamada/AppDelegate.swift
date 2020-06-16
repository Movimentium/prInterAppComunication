//
//  AppDelegate.swift
//  iOSappLlamada
//
//  Created by Miguel on 16/06/2020.
//  Copyright © 2020 Miguel Gallego Martín. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {



    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }

    func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any] = [:]) -> Bool {
        
        // Si tenemos el SceneDelegate, llamará allí y no aquí
        
        print("\(self.classForCoder) \(#function)")
        print(app)
        print(url.baseURL ?? "No baseURL")
        print(url.query ?? "No query string privided")

        var params: [String:String] = [:]
        if let queryStr = url.query {
            let queryItems = queryStr.components(separatedBy: "&")
            for item in queryItems {
                let pair = item.components(separatedBy: "=")
                if pair.count == 2 {
                    params[pair[0]] = pair[1]
                }
            }
            if let msg = params[K.paramStrMsg] {
                let notif = Notification(name: Notification.Name(rawValue: K.notifNewMsg), object: msg, userInfo: nil)
                NotificationCenter.default.post(notif)
            }
        }
        
        
        return true
    }
}


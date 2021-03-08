//
//  AppDelegate.swift
//  SwiftUIFirebase
//
//  Created by Alfredo Luco on 08-03-21.
//

import Foundation
import UIKit
import Firebase
import FBSDKLoginKit

class AppDelegate: NSObject, UIApplicationDelegate {
    
    //MARK: - Did Finish Launch with options
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        
        //Firebase
        
        FirebaseApp.configure()
        
        //Fonts
        for i in UIFont.familyNames {
            for j in UIFont.fontNames(forFamilyName: i) {
                print(j)
            }
        }
        
        //Facebook
        
        ApplicationDelegate.shared.application(
                    application,
                    didFinishLaunchingWithOptions: launchOptions
                )

        
        return true
    }
    
    //MARK: - Facebook
    
    func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any] = [:]) -> Bool {
        ApplicationDelegate.shared.application(
                    app,
                    open: url,
                    sourceApplication: options[UIApplication.OpenURLOptionsKey.sourceApplication] as? String,
                    annotation: options[UIApplication.OpenURLOptionsKey.annotation]
                )
    }
}

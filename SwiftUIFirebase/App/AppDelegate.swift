//
//  AppDelegate.swift
//  SwiftUIFirebase
//
//  Created by Alfredo Luco on 08-03-21.
//

import Foundation
import UIKit
import Firebase

class AppDelegate: NSObject, UIApplicationDelegate {
    
    //MARK: - Did Finish Launch with options
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        
        //Firebase
        
        FirebaseApp.configure()
        
        for i in UIFont.familyNames {
            for j in UIFont.fontNames(forFamilyName: i) {
                print(j)
            }
        }
        
        
        return true
    }
    
}

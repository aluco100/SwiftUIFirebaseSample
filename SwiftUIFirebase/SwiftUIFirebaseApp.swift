//
//  SwiftUIFirebaseApp.swift
//  SwiftUIFirebase
//
//  Created by Alfredo Luco on 08-03-21.
//

import SwiftUI

@main
struct SwiftUIFirebaseApp: App {
    
    //App delegate
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    
    var body: some Scene {
        WindowGroup {
            LoginView()
        }
    }
}

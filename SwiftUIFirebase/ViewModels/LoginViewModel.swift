//
//  LoginViewModel.swift
//  SwiftUIFirebase
//
//  Created by Alfredo Luco on 08-03-21.
//

import Foundation
import SwiftUI
import FirebaseAuth

class LoginViewModel: ObservableObject {
    
    //MARK: - Variables
    
    @Published private(set) var session: Session?
    @Published private(set) var error: Error?
    @Published var showingAlert: Bool = false
    
    public var alertTitle: String {
        if error != nil {
            return "Oups!"
        }
        return "Welcome \(session?.displayName ?? "guest")"
    }
    
    public var alertMessage: String {
        if error != nil {
            return error?.localizedDescription ?? ""
        }
        return ""
    }
    
    //MARK: - Login Anonymously
    
    //MARK: - Login Annonymously
    
    public func loginAnnonymously() {
        Auth.auth().signInAnonymously { (auth, error) in
            guard error == nil else {
                print(error!)
                self.showingAlert = true
                self.error = error!
                return
            }
            guard let user = auth?.user else {
                self.error = NSError(domain: "Test", code: 400, userInfo: [NSLocalizedDescriptionKey: "No user found"])
                self.showingAlert = true
                return
            }
            self.showingAlert = true
            self.session = Session(user)
        }
    }
    
    //MARK: - Check User
    
    public func checkUser() {
        guard let currentUser = Auth.auth().currentUser else {
            self.error = NSError(domain: "Test", code: 400, userInfo: [NSLocalizedDescriptionKey: "No user found"])
            return
        }
        self.showingAlert = true
        session = Session(currentUser)
    }
    
    
}

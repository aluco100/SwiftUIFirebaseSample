//
//  LoginViewModel.swift
//  SwiftUIFirebase
//
//  Created by Alfredo Luco on 08-03-21.
//

import Foundation
import SwiftUI
import FirebaseAuth
import FBSDKLoginKit

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
    
    lazy var loginManager: LoginManager = {
        let manager = LoginManager()
        return manager
    }()
    
    //MARK: - Login with Facebook
    
    public func loginWithFacebook() {
        loginManager.logIn(permissions: [.email,.publicProfile], viewController: nil) { (result) in
            switch result {
            case .cancelled:
                print("user cancelled login")
                break
            case .failed(let error):
                self.error = error
                self.showingAlert = true
                break
            case .success(granted: _, declined: _, token: let token):
                let credential = FacebookAuthProvider.credential(withAccessToken: token.tokenString)
                Auth.auth().signIn(with: credential) { (result, error) in
                    guard error == nil else {
                        self.error = error
                        self.showingAlert = true
                        return
                    }
                    guard let user = result?.user else {
                        self.error = NSError(domain: "Test", code: 400, userInfo: [NSLocalizedDescriptionKey: "No user found"])
                        self.showingAlert = true
                        return
                    }
                    self.showingAlert = true
                    self.session = Session(user)
                }
                break
            }
        }
    }
    
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

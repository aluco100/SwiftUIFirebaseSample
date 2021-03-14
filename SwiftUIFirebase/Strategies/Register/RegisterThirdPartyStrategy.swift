//
//  RegisterThirdPartyStrategy.swift
//  SwiftUIFirebase
//
//  Created by Alfredo Luco on 11-03-21.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

class RegisterThirdPartyStrategy: RegisterStrategyProtocol {
    
    //MARK: - Register
    
    func register(_ registration: Registration, _ completion: @escaping RegisterStrategyCompletion, _ failure: @escaping RegisterStrategyFailure) {
        guard let user = Auth.auth().currentUser else {
            failure(NSError(domain: "Test", code: 400, userInfo: [NSLocalizedDescriptionKey: "User not found"]))
            return
        }
        var json = registration.toJSON()
        json["uid"] = user.uid
        let db = Firestore.firestore()
        db.collection("users").document(user.uid).setData(json, merge: true) { (error) in
            guard error == nil else {
                failure(error!)
                return
            }
            completion()
        }
    }
    
}

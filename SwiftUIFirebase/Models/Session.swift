//
//  Session.swift
//  SwiftUIFirebase
//
//  Created by Alfredo Luco on 08-03-21.
//

import Foundation
import FirebaseAuth

struct Session {
    var uid: String
    var email: String?
    var displayName: String?
    
    init(_ user: User) {
        uid = user.uid
        email = user.email
        displayName = user.displayName
    }
    
}

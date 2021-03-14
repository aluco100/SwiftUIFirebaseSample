//
//  Registration.swift
//  SwiftUIFirebase
//
//  Created by Alfredo Luco on 10-03-21.
//

import Foundation
import FirebaseFirestore


struct Registration {
    var name: String?
    var email: String?
    var password: String?
    var birthdate: Timestamp?
    private var withPassword: Bool
    
    //MARK: - Init
    
    init(_ password: Bool) {
        withPassword = password
    }
    
    //MARK: - Validate
    
    func validate() -> Bool {
        if withPassword {
            return password != nil && !password!.isEmpty && birthdate != nil && email != nil && !email!.isEmpty && email!.validEmail() && name != nil && !name!.isEmpty
        }else {
            return birthdate != nil && email != nil && !email!.isEmpty && email!.validEmail() && name != nil && !name!.isEmpty
        }
    }
    
    //MARK: - Error Messages
    
    func errorMessages() -> [String] {
        
        var messages: [String] = []
        
        if withPassword {
            if password == nil||(password?.isEmpty ?? false) {
                messages.append("Debes indicar una contraseña")
            }
        }
        
        if birthdate == nil {
            messages.append("Debes indicar una fecha de cumpleaños")
        }
        
        if email == nil||(email?.isEmpty ?? false) {
            messages.append("Debes indicar un email")
        }
        
        if email?.validEmail() ?? false {
            messages.append("Debes indicar un email válido")
        }
        
        if name == nil||(name?.isEmpty ?? false) {
            messages.append("Debes indicar un nombre")
        }
        
        return messages
    }
    
    //MARK: - To JSON
    
    func toJSON() -> [String : Any] {
        return [
            "name" : self.name ?? "",
            "email" : self.email ?? "",
            "birthdate" : self.birthdate ?? Timestamp(date: Date()),
        ]
    }
}

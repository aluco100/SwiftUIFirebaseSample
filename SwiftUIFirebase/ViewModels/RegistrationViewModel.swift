//
//  RegistrationViewModel.swift
//  SwiftUIFirebase
//
//  Created by Alfredo Luco on 11-03-21.
//

import Foundation
import FirebaseFirestore

class RegistrationViewModel: ObservableObject {
    
    //MARK: - Variables
    
    @Published var errorMessage: String?
    @Published var registered: Bool = false
    @Published private(set) var registration: Registration?
    private var strategy: RegisterStrategyProtocol
    
    @Published var name: String = ""
    @Published var email: String = ""
    @Published var birthdate: Date = Date()
    @Published var password: String = ""
    @Published var loading: Bool = false
    
    //MARK: - Init
    
    init(_ withPassword: Bool) {
        registration = Registration(withPassword)
        let context = RegisterStrategyContext()
        strategy = context.strategy(withPassword)
    }
    
    //MARK: - Validate Registration
    
    public func validateRegistration() -> Bool {
        self.registration?.name = name
        self.registration?.email = email
        self.registration?.birthdate = Timestamp(date: birthdate)
        self.registration?.password = password
        if !(registration?.validate() ?? false) {
            self.errorMessage = registration?.errorMessages().first ?? ""
        }
        return registration?.validate() ?? false
    }
    
    //MARK: - Register
    
    public func register() {
        self.loading = true
        guard registration != nil else { return }
        strategy.register(registration!) {
            self.loading = false
            self.registered = true
            self.errorMessage = nil
        } _: { (error) in
            self.loading = false
            self.errorMessage = error.localizedDescription
        }

    }
    
}

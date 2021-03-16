//
//  RegistrationView.swift
//  SwiftUIFirebase
//
//  Created by Alfredo Luco on 12-03-21.
//

import SwiftUI

struct RegistrationView: View {
    
    @ObservedObject var registerViewModel: RegistrationViewModel
    var withPassword: Bool
    
    init(withPassword: Bool) {
        registerViewModel = RegistrationViewModel(withPassword)
        self.withPassword = withPassword
    }
    
    var body: some View {
        NavigationView {
            VStack {
//                FormTextField(value: self.$registerViewModel.name, placeHolder: "Name")
//                    .frame(height: 75.0)
//                FormTextField(value: self.$registerViewModel.email, placeHolder: "Email")
//                    .frame(height: 75.0)
//                DatePicker("Birthdate", selection: self.$registerViewModel.birthdate, displayedComponents: .date)
//                    .frame(height: 50.0)
//                    .padding()
//                if self.withPassword {
//                    PasswordFormTextField(value: self.$registerViewModel.password, placeHolder: "Password")
//                        .frame(height: 75.0)
//                }
                Form {
                    Section(header: Text("Personal Data")) {
                        TextField("Name", text: self.$registerViewModel.name)
                        TextField("Email", text: self.$registerViewModel.email)
                            .keyboardType(.emailAddress)
                        DatePicker("Birthdate", selection: self.$registerViewModel.birthdate, displayedComponents: .date)
                        if self.withPassword {
                            SecureField("Password", text: self.$registerViewModel.password)
                        }
                    }
                }
                Spacer()
                if self.registerViewModel.errorMessage != nil {
                    Text(self.registerViewModel.errorMessage!)
                        .foregroundColor(.red)
                        .font(.custom(Constants.regularFont, size: 14.0))
                }
                Spacer()
                if self.$registerViewModel.loading.wrappedValue && !self.registerViewModel.registered {
                    ProgressView()
                }
                FormButton(title: "Register", action: {
                    if self.registerViewModel.validateRegistration() {
                        self.registerViewModel.register()
                    }
                }, enabled: {
                    true
//                    self.registerViewModel.validateRegistration()
                }).frame(height: 50.0)
                .padding(.bottom, 32.0)
            }
            
            .navigationBarTitle(
                Text("Register")
            )
        }
        
    }
}

struct RegistrationView_Previews: PreviewProvider {
    static var previews: some View {
        RegistrationView(withPassword: true)
    }
}

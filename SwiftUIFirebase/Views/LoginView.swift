//
//  LoginView.swift
//  SwiftUIFirebase
//
//  Created by Alfredo Luco on 08-03-21.
//

import SwiftUI
import AuthenticationServices

struct LoginView: View {
    
    @ObservedObject var loginViewModel: LoginViewModel
    @State var loading: Bool = false
    @State var email: String = ""
    @State var password: String = ""
    @State var presentRegister: Bool = false
    @State private var registrationWithPassword: Bool = true
    
    init() {
        UITableView.appearance().backgroundColor = .clear
        loginViewModel = LoginViewModel()
        loginViewModel.checkUser()
    }
    
    var body: some View {
        VStack {
            Spacer()
                .frame(height: 64.0)
            FormTextField(value: $email, placeHolder: "Email")
                .keyboardType(.emailAddress)
                .frame(height: 80.0)
            PasswordFormTextField(value: $password, placeHolder: "Password")
                .frame(height: 80.0)
            FormButton(title: "Login", action: {
                self.loading.toggle()
                self.loginViewModel.loginWithEmail(self.email, self.password)
            }, enabled: {
                return !self.email.isEmpty && !self.password.isEmpty
            }).frame(height: 80)
            HStack {
                Spacer()
                Button("Register", action: {
                    self.presentRegister.toggle()
                })
                .fullScreenCover(isPresented: self.$presentRegister, content: {
                    RegistrationView(withPassword: self.registrationWithPassword)
                })
                .font(.custom(Constants.boldFont, size: 16.0))
            }.frame(height: 40.0)
            .padding(.horizontal)
            Spacer()
            if loading {
                ProgressView()
            }
            SignInWithAppleButton(.signIn) { (request) in
                request.nonce = self.loginViewModel.nonce.sha256()
                request.requestedScopes = [.email,.fullName]
            } onCompletion: { result in
                self.loading.toggle()
                self.loginViewModel.loginWithApple(result)
            }.signInWithAppleButtonStyle(.black)
            .cornerRadius(8.0)
            .padding()
            .frame(height: 90.0)

            FBButton(action: {
                self.loading.toggle()
                self.loginViewModel.loginWithFacebook()
            }).frame(height: 60, alignment: .center)
            AnnonymousButton(action: {
                self.loading.toggle()
                self.loginViewModel.loginAnnonymously()
            })
            .frame( height: 85, alignment: .center)
        }
        .alert(isPresented: self.$loginViewModel.showingAlert, content: {
            Alert(title: Text(self.loginViewModel.alertTitle), message: Text(self.loginViewModel.alertMessage), dismissButton: Alert.Button.default(Text("OK"),action: {
                //TODO: Screen de sesion
                self.loading = false
//                self.registrationWithPassword = false
//                self.presentRegister = true
            }))
        })
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}

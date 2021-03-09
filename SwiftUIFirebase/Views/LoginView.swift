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
    
    init() {
        loginViewModel = LoginViewModel()
        loginViewModel.checkUser()
    }
    
    var body: some View {
        VStack {
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
                self.loading = false
            }))
        })
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}

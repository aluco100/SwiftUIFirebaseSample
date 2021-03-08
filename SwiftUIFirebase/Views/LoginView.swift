//
//  LoginView.swift
//  SwiftUIFirebase
//
//  Created by Alfredo Luco on 08-03-21.
//

import SwiftUI

struct LoginView: View {
    
    @ObservedObject var loginViewModel: LoginViewModel
    
    init() {
        loginViewModel = LoginViewModel()
        loginViewModel.checkUser()
    }
    
    var body: some View {
        VStack {
            Spacer()
            AnnonymousButton(action: {
                self.loginViewModel.loginAnnonymously()
            })
            .frame( height: 90, alignment: .center)
        }
        .alert(isPresented: self.$loginViewModel.showingAlert, content: {
            Alert(title: Text(self.loginViewModel.alertTitle), message: Text(self.loginViewModel.alertMessage), dismissButton: Alert.Button.default(Text("OK")))
        })
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}

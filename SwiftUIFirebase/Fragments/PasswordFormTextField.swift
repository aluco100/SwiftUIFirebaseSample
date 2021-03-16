//
//  PasswordFormTextField.swift
//  SwiftUIFirebase
//
//  Created by Alfredo Luco on 09-03-21.
//

import SwiftUI

struct PasswordFormTextField: View {
    @Binding var value: String
    var placeHolder: String
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 8.0)
                .stroke(Color.black,lineWidth: /*@START_MENU_TOKEN@*/1.0/*@END_MENU_TOKEN@*/)
                .foregroundColor(.white)
            SecureField(placeHolder, text: $value)
                .padding(5)
                .font(Font.custom(Constants.regularFont, size: 18.0))
        }
        .padding()
        
    }
}

struct PasswordFormTextField_Previews: PreviewProvider {
    static var previews: some View {
        PasswordFormTextField(value: .constant(""), placeHolder: "Password")
    }
}

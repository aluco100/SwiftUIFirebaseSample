//
//  FormTextField.swift
//  SwiftUIFirebase
//
//  Created by Alfredo Luco on 09-03-21.
//

import SwiftUI

struct FormTextField: View {
    
    @Binding var value: String
    var placeHolder: String
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 8.0)
                .stroke(Color.black,lineWidth: /*@START_MENU_TOKEN@*/1.0/*@END_MENU_TOKEN@*/)
                .foregroundColor(.white)
            TextField(placeHolder, text: $value)
                .padding(5)
                .font(Font.custom(Constants.regularFont, size: 18.0))
        }
        .padding()
        
    }
}

struct FormTextField_Previews: PreviewProvider {
    static var previews: some View {
        FormTextField(value: .constant(""), placeHolder: "Test").frame(height: 80.0)
    }
}

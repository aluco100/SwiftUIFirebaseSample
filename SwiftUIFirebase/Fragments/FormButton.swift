//
//  FormButton.swift
//  SwiftUIFirebase
//
//  Created by Alfredo Luco on 09-03-21.
//

import SwiftUI

struct FormButton: View {
    
    var title: String = ""
    var action: (() -> Void)?
    
    var body: some View {
        GeometryReader(content: { geometry in
            Button(title, action: {
                self.action?()
            })
            .frame(width: geometry.size.width, height: 50.0)
            .background(Color.blue)
            .foregroundColor(.white)
            .font(.custom(Constants.regularFont, size: 18.0))
            .cornerRadius(8.0)
        }).padding()
       
    }
}

struct FormButton_Previews: PreviewProvider {
    static var previews: some View {
        FormButton(title: "Test", action: nil)
    }
}

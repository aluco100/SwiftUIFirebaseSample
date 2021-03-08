//
//  AnnonymousButton.swift
//  SwiftUIFirebase
//
//  Created by Alfredo Luco on 08-03-21.
//

import SwiftUI

struct AnnonymousButton: View {
    
    var action: (() -> Void)?
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 8.0).stroke(Color.black,lineWidth: /*@START_MENU_TOKEN@*/1.0/*@END_MENU_TOKEN@*/)
              
            Button(action: {
                self.action?()
            }, label: {
                Text("Sign In Annonymously")
                    .font(.custom(Constants.regularFont, size: 17.0))
                    .foregroundColor(.black)
            })
        }
        .padding()
        .foregroundColor(.clear)
    }
}

struct AnnonymousButton_Previews: PreviewProvider {
    static var previews: some View {
        AnnonymousButton().frame( height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
    }
}

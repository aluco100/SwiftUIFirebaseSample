//
//  FBButton.swift
//  SwiftUIFirebase
//
//  Created by Alfredo Luco on 08-03-21.
//

import SwiftUI

struct FBButton: View {
    
    var action: (() -> Void)?
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 8.0)
                .stroke(Color.blue,lineWidth: /*@START_MENU_TOKEN@*/1.0/*@END_MENU_TOKEN@*/)
            HStack {
                Image("fb")
                    .resizable()
                    .frame(width: 50, height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    
                    .onTapGesture {
                    self.action?()
                }
                Button(action: {
                    self.action?()
                }, label: {
                    Text("Login With Facebook")
                        .font(.custom(Constants.boldFont, size: 17.0))
                })
            }.padding(2)
                
        }.padding()
    }
}

struct FBButton_Previews: PreviewProvider {
    static var previews: some View {
        FBButton()
            .frame(height: 50.0)
    }
}

//
//  LoginSheet.swift
//  firebaseLearning
//
//  Created by Dev on 01/08/25.
//

import SwiftUI

struct LoginSheet: View {
    
    @StateObject var vm: AuthService = AuthService()
    var body: some View {
        NavigationStack{
            VStack(spacing:20){
                Text("Sign UP")
                    .font(.system(size: 20,weight: .bold))
                    .frame(maxWidth: .infinity)
                
                TextFeildView(fieldFor: "Email", data: $vm.email)
                
                TextFeildView(fieldFor: "Password", data: $vm.password)
                
                Button {
                    
                } label: {
                    Text("Login")
                        .font(.system(size: 20,weight: .bold))
                        .padding()
                        .foregroundStyle(Color.white)
                        .background(Color.green)
                        .clipShape(RoundedRectangle(cornerRadius: 20))
                }
                }

                    
                
                
                googleAndXView {
                    print("onGoogle")
                } onXTap: {
                    print("onX")
                }
            }.padding()
        }
        
    }


#Preview {
    LoginSheet()
}

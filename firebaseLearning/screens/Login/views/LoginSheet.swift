//
//  LoginSheet.swift
//  firebaseLearning
//
//  Created by Dev on 01/08/25.
//

import SwiftUI

struct LoginSheet: View {
    
    @EnvironmentObject var Authvm: AuthService
    var onSuccessLogin: () -> Void
    
    var body: some View {
        NavigationStack{
            VStack(spacing:20){
                Text("Sign UP")
                    .font(.system(size: 20,weight: .bold))
                    .frame(maxWidth: .infinity)
                
                TextFeildView(fieldFor: "Email", data: $Authvm.email)
                
                TextFeildView(fieldFor: "Password", data: $Authvm.password)
                
                Button {
                    Task{
                        await Authvm.login(email: Authvm.email, password: Authvm.password)
                    }
                } label: {
                    if Authvm.loader{
                        ProgressView()
                            .frame(width: 140, height: 60)
                            .tint(.white)
                            .background(Color.green)
                            .clipShape(RoundedRectangle(cornerRadius: 20))
                    }else{
                        Text("Login")
                            .font(.system(size: 20,weight: .bold))
                            .frame(width: 140, height: 60)
                            .foregroundStyle(Color.white)
                            .background(Color.green)
                            .clipShape(RoundedRectangle(cornerRadius: 20))
                    }
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


//#Preview {
//    LoginSheet()
//}

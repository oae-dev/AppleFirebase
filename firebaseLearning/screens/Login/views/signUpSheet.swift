//
//  signUpSheet.swift
//  firebaseLearning
//
//  Created by Dev on 01/08/25.
//

import SwiftUI

struct signUpSheet: View {
    @State var isChecked:Bool = false
    @EnvironmentObject var Authvm: AuthService
    var onSuccessSignUp: () -> Void
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        VStack(alignment:.leading, spacing:20){
            Text("Sign UP")
                .font(.system(size: 20,weight: .bold))
                .frame(maxWidth: .infinity)
            
            TextFeildView(fieldFor: "Email", data: $Authvm.email)
            
            TextFeildView(fieldFor: "Password", data: $Authvm.password)
            
            TextFeildView(fieldFor: "Password", data: $Authvm.confirmPassword)
            
            HStack{
                Button(action: {
                    isChecked.toggle()
                }) {
                    Image(systemName: isChecked ? "checkmark.square.fill" : "square")
                        .font(.title)
                        .foregroundColor(isChecked ? .blue : .gray)
                }
                .buttonStyle(PlainButtonStyle())
                
                Text("I accept you polices and terms")
            }
            
            Button {
                print("SignUp")
                Task {
                    await Authvm.signUP(email: Authvm.email, password: Authvm.password)
                    if Authvm.isLoggedIn{
                        dismiss()
                        onSuccessSignUp()
                    }
                }
                
            } label: {
                Text("Sign Up")
                    .font(.system(size: 20,weight: .bold))
                    .padding()
                    .foregroundStyle(Color.white)
                    .background(Color.green)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
            }.frame(maxWidth: .infinity)

            googleAndXView {
                print("onGoogle")
            } onXTap: {
                print("onX")
            }.frame(maxWidth: .infinity)
        }.padding()
    }
}

//#Preview {
//    signUpSheet()
//}

//
//  signUpSheet.swift
//  firebaseLearning
//
//  Created by Dev on 01/08/25.
//

import SwiftUI

struct signUpSheet: View {
    @State var isChecked:Bool = false
    @StateObject var vm: AuthService
    var onSuccessLogin: () -> Void
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        VStack(alignment:.leading, spacing:20){
            Text("Sign UP")
                .font(.system(size: 20,weight: .bold))
                .frame(maxWidth: .infinity)
            
            TextFeildView(fieldFor: "Email", data: $vm.email)
            
            TextFeildView(fieldFor: "Password", data: $vm.password)
            
            TextFeildView(fieldFor: "Password", data: $vm.confirmPassword)
            
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
                    await vm.signUP(email: vm.email, password: vm.password)
                    if vm.isLoggedIn{
                        dismiss()
                        onSuccessLogin()
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

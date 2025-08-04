//
//  dashboardScreen.swift
//  firebaseLearning
//
//  Created by Dev on 01/08/25.
//

import SwiftUI

struct LoginScreen: View {
    @EnvironmentObject var Authvm: AuthService
    @State var showSignUpSheet: Bool = false
    @State var showLoginSheet: Bool = false
    @State private var sheetHeight: CGFloat = 550
    @State private var navigateToHome: Bool = false
    
    var body: some View {
        NavigationStack{
            ZStack {
                Image("bg")
                    .resizable()
                    .opacity(0.9)
                    .ignoresSafeArea()
                
                VStack(spacing: 30){
                    if showSignUpSheet{
                        VStack {
                            Text("Hello.")
                            Text("Create Your Account")
                        }.font(.system(size: 30,weight: .bold))
                    }
                    
                    Spacer()
                    
                    Text("Sign UP")
                        .font(.system(size: 30, weight: .bold))
                        .onTapGesture {
                            print("openSignUp Page")
                            showSignUpSheet = true
                        }
                    
                    VStack(spacing:14){
                        HStack{
                            Image("fb")
                                .resizable()
                                .renderingMode(.template)
                                .foregroundColor(.white)
                                .frame(width: 30,height: 30)
                            
                            Text("Continue With Facebook")
                                .font(.system(size: 20, weight: .medium))
                            
                        }.padding()
                            .frame(maxWidth: .infinity)
                            .background(Color.accentColor)
                            .clipShape(RoundedRectangle(cornerRadius: 15))
                            .onTapGesture {
                                print("Login fb")
                            }
                        
                        Text("I`ll use Email or PhoneNumber")
                            .padding()
                            .frame(maxWidth: .infinity)
                            .overlay(
                                RoundedRectangle(cornerRadius: 15)
                                    .stroke(Color.white, lineWidth: 2)
                            )
                            .onTapGesture {
                                print("press email")
                            }
                        
                    }.padding()
                    
                    googleAndXView {
                        print("onGoogle")
                    } onXTap: {
                        print("onX")
                    }
                    
                    HStack{
                        Text("Already have a account?")
                        Button("Login here", action: {
                            print("login")
                            showLoginSheet = true
                        }).foregroundStyle(Color.blue)
                    }
                    
                    .navigationDestination(isPresented: $navigateToHome) {
                        HomeScreen()
                    }
                }.padding(.horizontal, 20)
                    .foregroundStyle(Color.white)
                
                    .sheet(isPresented: $showSignUpSheet, onDismiss: {
                        print("sheetCancel")
                    }){
                        signUpSheet(onSuccessSignUp: {
                            showSignUpSheet = false
                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                                navigateToHome = true
                            }
                        })
                        .presentationDetents([.height(sheetHeight)])
                    }
                
                    .sheet(isPresented: $showLoginSheet, onDismiss: {
                        print("sheetCancel")
                    }){
                        LoginSheet(onSuccessLogin: {
                            showLoginSheet = false
                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.3 , execute: {
                                navigateToHome = true
                            })
                        })
                        .presentationDetents([.height(sheetHeight)])
                    }
            }
        }
        
    }
}

#Preview {
    LoginScreen()
}

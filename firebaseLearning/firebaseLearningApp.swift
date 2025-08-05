//
//  firebaseLearningApp.swift
//  firebaseLearning
//
//  Created by Dev on 01/08/25.
//

import SwiftUI
import FirebaseCore

@main
struct firebaseLearningApp: App {
    
    @StateObject var Authvm:AuthService = AuthService()
    @State var splashIs: Bool = true
    @StateObject var onBoadingVm: OnBoadingViewModel = OnBoadingViewModel()
    
    init() {
           FirebaseApp.configure()  
       }
       var body: some Scene {
           WindowGroup {
               
               if splashIs {
                   Splash(splashIs: $splashIs)
               }else{
                   if Authvm.isLoggedIn{
                       HomeScreen()
                           .environmentObject(Authvm)
                   }else{
                       if onBoadingVm.NewUser{
                           if let screen = Screens(rawValue: onBoadingVm.onBoadingScreen){
                               OnBoardingScreen()
                                   .environmentObject(onBoadingVm)
                           }
                       }else{
                           LoginScreen()
                               .environmentObject(Authvm)
                       }
                   }
               }
           }
       }
   }

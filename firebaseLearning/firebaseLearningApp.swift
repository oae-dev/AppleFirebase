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
                       LoginScreen()
                           .environmentObject(Authvm)
                   }
               }
           }
       }
   }

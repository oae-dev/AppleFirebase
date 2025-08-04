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
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
       
       var body: some Scene {
           WindowGroup {
               LoginScreen()
           }
       }
   }

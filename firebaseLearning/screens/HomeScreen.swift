//
//  ContentView.swift
//  firebaseLearn
//
//  Created by Dev on 01/08/25.
//

import SwiftUI

struct HomeScreen: View {
    @StateObject var authService = AuthService()
    var body: some View {
            VStack {
                if authService.isLoggedIn {
                    Text("✅ User is logged in")
                } else {
                    Text("❌ User is not logged in")
                }
            }
            .onAppear {
                authService.checkUserStatus()
            }
        }
}

#Preview {
    HomeScreen()
}

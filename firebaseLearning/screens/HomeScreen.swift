//
//  ContentView.swift
//  firebaseLearn
//
//  Created by Dev on 01/08/25.
//

import SwiftUI

struct HomeScreen: View {
    @EnvironmentObject var Authvm: AuthService
    var body: some View {
            VStack {
                Button("logout") {
                    Authvm.logout()
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.3 , execute: {
                        Authvm.isLoggedIn = false
                    })
                }
            }.navigationTitle("")
            .onAppear {
                Authvm.checkUserStatus()
            }
        }
}

#Preview {
    HomeScreen()
}

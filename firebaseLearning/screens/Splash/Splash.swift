//
//  Splash.swift
//  firebaseLearning
//
//  Created by Dev on 04/08/25.
//

import SwiftUI

struct Splash: View {
    @Binding var splashIs: Bool
    var body: some View {
        VStack{
            Text("Splash")
                .font(.largeTitle)
        }.onAppear{
            DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
                withAnimation {
                    splashIs = false
                }
            }
            
        }
    }
}

#Preview {
    Splash(splashIs: .constant(false))
}

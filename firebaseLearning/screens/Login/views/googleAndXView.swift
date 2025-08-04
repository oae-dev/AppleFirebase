//
//  googleAndXView.swift
//  firebaseLearning
//
//  Created by Dev on 01/08/25.
//

import SwiftUI

struct googleAndXView: View {
    let onGoogleTap: () -> Void
    let onXTap: () -> Void
    
    var body: some View {
        HStack(spacing:50){
            Button(action: {
                onGoogleTap()
            }, label: {
                Image("google")
            })
            
            Button(action: {
                onXTap()
            }, label: {
                Image("x")
            })
        }
    }
}

#Preview {
    googleAndXView(onGoogleTap: {print("")}, onXTap: {print("")})
}

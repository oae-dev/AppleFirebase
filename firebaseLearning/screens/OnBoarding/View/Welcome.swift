//
//  Welcome.swift
//  firebaseLearning
//
//  Created by Dev on 04/08/25.
//

import SwiftUI

struct Welcome: View {
    @EnvironmentObject var onBoadingVm: OnBoadingViewModel
    
    var body: some View {
        VStack(spacing:30){
            VStack (spacing:10){
                Text("Welcome")
                    .font(.system(size: 50, weight: .bold))
                Text("to our App")
                    .font(.system(size: 50))
                Text("Quick Book")
                    .font(.system(size: 50, weight: .bold))
            }
            Spacer()
            NextButton()
            Spacer()
            
           Text("Skip")
                .font(.system(size: 20, weight: .medium))
                .onTapGesture {
                    onBoadingVm.onSkipClick()
                }
            
        }.frame(maxWidth: .infinity)
            .padding(20)
    }
}

#Preview {
    Welcome()
        .environmentObject(OnBoadingViewModel())
}

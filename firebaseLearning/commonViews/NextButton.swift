//
//  NextButton.swift
//  firebaseLearning
//
//  Created by Dev on 04/08/25.
//

import SwiftUI

struct NextButton: View {
    @EnvironmentObject var onBoadingVm: OnBoadingViewModel
    var body: some View {
        Image(systemName: "arrow.forward")
            .resizable()
            .frame(width: 35,height: 35,alignment: .center)
            .padding(25)
            .background(
                Circle()
                    .fill(.blue)
            )
            .padding(4)
            .overlay(
                Circle()
                    .trim(from: 0.0, to: onBoadingVm.loading)
                    .stroke(lineWidth: 3)
                    .rotationEffect(.degrees(-90))
            )
            .onTapGesture {
                onBoadingVm.onNextClick()
            }
    }
}

//#Preview {
//    NextButton(loading: 0.3)
//}

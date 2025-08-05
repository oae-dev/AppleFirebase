//
//  OnBoadingViewModel.swift
//  firebaseLearning
//
//  Created by Dev on 04/08/25.
//

import Foundation
import SwiftUI


enum Screens: Int {
    case welcome = 1
    case intro = 2
    case start = 3
}

class OnBoadingViewModel: ObservableObject {
    @AppStorage("NewUser") var NewUser: Bool = true
    @Published var onBoadingScreen: Int = 1
    @Published var loading: Double = 0.2
    let totalScreens = 3
    
    func onNextClick(){
        withAnimation {
            if onBoadingScreen == 3{
                NewUser = false
            }
            if onBoadingScreen < totalScreens {
                onBoadingScreen += 1
            }
            loading += 0.4
        }
    }
    
    func onSkipClick(){
        onBoadingScreen = totalScreens
        loading = 1
    }
    
}


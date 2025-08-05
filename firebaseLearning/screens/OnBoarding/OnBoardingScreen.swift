//
//  On.swift
//  firebaseLearning
//
//  Created by Dev on 04/08/25.
//

import SwiftUI

// Screens
/*
 1) Welcome
 2) Intro
 3) Start
 */



struct OnBoardingScreen: View {
    @EnvironmentObject var onBoadingVm: OnBoadingViewModel
    var body: some View {
        switch onBoadingVm.onBoadingScreen{
        case 1:
            Welcome()
        case 2:
            IntoView()
        case 3:
             Finish()
        default:
            Text("Invalid Screen")
        }
    }
}

//#Preview {
//    OnBoardingScreen(views: 1)
//}

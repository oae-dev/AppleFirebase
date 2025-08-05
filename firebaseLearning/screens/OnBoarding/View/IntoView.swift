//
//  IntoView.swift
//  firebaseLearning
//
//  Created by Dev on 04/08/25.
//

import SwiftUI

struct IntoView: View {
    @EnvironmentObject var onBoadingVm: OnBoadingViewModel
    
    var body: some View {
        VStack {
            Image("books")
                .resizable()
                .frame(height: 400)
            
            HStack {
                Text("Increase")
                    .font(.system(size: 35, weight: .bold))
                Text("Knowledge")
                    .font(.system(size: 35))
                
            }
            HStack {
                Text("With")
                    .font(.system(size: 35))
                Text("Quick Book")
                    .font(.system(size: 35, weight: .bold))
            }
            
            Divider()
            
            Text("Get bite size summeries, good sound, book catagories and get more knowledge in minutes")
                .foregroundStyle(.gray)
            Spacer()
            HStack{
                Text("skip")
                    .font(.system(size: 20, weight: .medium))
                    .onTapGesture {
                        onBoadingVm.onSkipClick()
                    }
                Spacer()
                NextButton()
            }
            
        }.frame(maxWidth: .infinity,alignment: .leading)
            .padding(20)
    }
}

#Preview {
    IntoView()
        .environmentObject(OnBoadingViewModel())
}

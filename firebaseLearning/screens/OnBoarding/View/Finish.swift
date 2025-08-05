//
//  Finish.swift
//  firebaseLearning
//
//  Created by Dev on 04/08/25.
//

import SwiftUI

struct Finish: View {
    var body: some View {
        VStack {
            Image("song")
                .resizable()
            HStack{
                Text("Stay")
                    .font(.system(size: 35))
                Text("Motivated")
                    .font(.system(size: 35, weight: .bold))
                Text("And")
                    .font(.system(size: 35))
            }
            HStack{
                Text("Achieve")
                    .font(.system(size: 35, weight: .bold))
                Text("Goals")
                    .font(.system(size: 35))
            }.padding(.bottom,20)
            Spacer()
            NextButton()
        }.frame(maxWidth: .infinity,alignment: .leading)
            .padding(20)
    }
}

#Preview {
    Finish()
        .environmentObject(OnBoadingViewModel())
}

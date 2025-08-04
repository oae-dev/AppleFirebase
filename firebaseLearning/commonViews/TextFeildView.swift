//
//  TextFeildView.swift
//  firebaseLearning
//
//  Created by Dev on 01/08/25.
//

import SwiftUI

struct TextFeildView: View {
    var fieldFor: String
    @Binding var data:String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8){
            Text(fieldFor)
            TextField("\(fieldFor)", text: $data)
                .padding()
                .background(LinearGradient(colors: [.blue.opacity(0.4), .red.opacity(0.2)], startPoint: .leading, endPoint: .trailing))
                .clipShape(RoundedRectangle(cornerRadius: 5))
        }
    }
}

//#Preview {
//    TextFeildView(fieldFor: "Email", data: Binding<String>)
//}

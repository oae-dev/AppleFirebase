//
//  AuthService.swift
//  firebaseLearning
//
//  Created by Dev on 01/08/25.
//

import Foundation
import FirebaseAuth

@MainActor
class AuthService: ObservableObject{
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var confirmPassword: String = ""
    @Published var isLoggedIn: Bool = false
    
    init() {
        checkUserStatus()
        }
    
    func checkUserStatus() {
            isLoggedIn = Auth.auth().currentUser != nil
        }
    
    func signUP(email:String, password:String) async{
        do{
            let authResult = try await Auth.auth().createUser(withEmail: email, password: password)
            print(authResult)
            print("SignUp Succesfully")
            await MainActor.run {
                            self.isLoggedIn = true
                        }
        }catch let error as NSError{
            print("Error: \(error)")
            await MainActor.run {
                            self.isLoggedIn = false
                        }
        }
        
        func Login(){
            
        }
        
        
    }
}

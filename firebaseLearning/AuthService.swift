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
    @Published var loader: Bool = true
    
    init() {
        checkUserStatus()
    }
    
    func checkUserStatus() {
        isLoggedIn = Auth.auth().currentUser != nil
    }
    
    func signUP(email:String, password:String) async{
        loader = true
        do{
            let authResult = try await Auth.auth().createUser(withEmail: email, password: password)
            print(authResult)
            print("SignUp Succesfully")
            loader = false
            await MainActor.run {
                self.isLoggedIn = true
            }
        }catch let error as NSError{
            print("Error: \(error)")
            loader = false
            await MainActor.run {
                self.isLoggedIn = false
            }
        }
    }
    
    func login(email: String, password: String) async {
        loader = true
        do {
            let authResult = try await Auth.auth().signIn(withEmail: email, password: password)
            print("ogin Successfully: \(authResult.user.email ?? "")")
            loader = false
            await MainActor.run {
                self.isLoggedIn = true
            }
        } catch let error as NSError {
            print("Login failed: \(error.localizedDescription)")
            loader = false
            await MainActor.run {
                self.isLoggedIn = false
            }
        }
    }

    
    func logout() {
        do {
            try Auth.auth().signOut()
            //                DispatchQueue.main.async {
            //                    self.isLoggedIn = false
            //                }
            print("Successfully logged out")
        } catch let signOutError as NSError {
            print("Error signing out: \(signOutError.localizedDescription)")
        }
    }
    
}


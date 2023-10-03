//
//  LoginViewModel.swift
//  CampusCart
//
//  Created by Sung Jae Ko on 10/2/23.
//

import Foundation
import Firebase
import FirebaseFirestoreSwift
@MainActor

class AuthViewModel: ObservableObject {
    @Published var userSession: FirebaseAuth.User?
    @Published var currentUser: User?

    
    
    func login(withEmail email: String, password: String) async throws {
        print("Sign in...")
    }
        
    func createUser(withEmail email: String, firstName: String, lastName: String, password: String, confirmPassword: String) async throws {
        do {
            let result = try await Auth.auth().createUser(withEmail: email, password: password)
            self.userSession = result.user
            let user = User(id: result.user.uid, firstName: firstName, lastName: lastName, email: email)
            let encodedUser = try Firestore.Encoder().encode(user)
            try await Firestore.firestore().collection("users").document(user.id).setData(encodedUser)
        } catch {
            print("DEBUG: Failed to create user with error  \(error.localizedDescription)")
        }
    }
    
    func signOut() {
        
    }
    
    func deleteAccount() {
        
    }
    
    func fetchUser() async {
        
    }
}

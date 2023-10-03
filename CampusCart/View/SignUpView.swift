//
//  SignUp.swift
//  CampusCart
//
//  Created by Sung Jae Ko on 10/1/23.
//

import SwiftUI
import Firebase

struct SignUpView: View {
    @State var firstName: String = ""
    @State var lastName: String = ""
    @State var email: String = ""
    @State var password: String = ""
    @State var showPassword: Bool = false
    @State var confirmPassword: String = ""
    @EnvironmentObject var viewModel: AuthViewModel
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color.gray
                    .opacity(0.12)
                    .ignoresSafeArea()
                VStack(alignment: .center, spacing: 15) {
                    Text("Logo")
                        .frame(maxWidth: .infinity, alignment: .center)
                    Text("Create Account")
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .font(.system(size: 35, weight: .heavy, design: .rounded))
                        .padding(.bottom, 50)
                    SignUpInputView(text: $firstName,
                                    title: "First Name",
                                    placeholder: "First Name")
                    .autocapitalization(.none)
                    .padding(14)
                    
                    .overlay{
                        RoundedRectangle(cornerRadius: 22)
                            .stroke(.gray.opacity(0.6),lineWidth:2)
                    }
                    .padding(.horizontal)
                    
                    SignUpInputView(text: $lastName,
                                    title: "Last Name",
                                    placeholder: "Last Name")
                    .autocapitalization(.none)

                    .padding(14)
                    .overlay{
                        RoundedRectangle(cornerRadius: 22)
                            .stroke(.gray.opacity(0.6),lineWidth:2)
                    }
                    .padding(.horizontal)
                    SignUpInputView(text: $email,
                                    title: "Email Address",
                                    placeholder: "Email Address")
                    .autocapitalization(.none)
                    .padding(14)
                    .overlay{
                        RoundedRectangle(cornerRadius: 22)
                            .stroke(.gray.opacity(0.6),lineWidth:2)
                    }
                    
                    .padding(.horizontal)
                    SignUpInputView(text: $password,
                                    title: "Password",
                                    placeholder: "Password",
                                    isSecureField: true)
                    .padding(14)
                    .overlay{
                        RoundedRectangle(cornerRadius: 22)
                            .stroke(.gray.opacity(0.6),lineWidth:2)
                    }
                    .padding(.horizontal)
                    SignUpInputView(text: $confirmPassword,
                                    title: "Confirm Password",
                                    placeholder: "Confirm Password",
                                    isSecureField: true)
                    .padding(14)
                    .overlay{
                        RoundedRectangle(cornerRadius: 22)
                            .stroke(.gray.opacity(0.6),lineWidth:2)
                    }
                    .padding(.horizontal)
                    // if password and confirmPassword do not match, throw an error.
                    
                    Button {
                        Task {
                            try await viewModel.createUser(withEmail: email, firstName: firstName, lastName: lastName, password: password, confirmPassword: confirmPassword)
                        }
                    } label: {
                        Text("Sign up")
                            .font(.title2)
                            .bold()
                            .foregroundColor(.white)
                    }
                    .frame(height:50)
                    .frame(maxWidth: 280)
                    .background(Color.green.opacity(0.6))
                    .cornerRadius(20)
                    
                    NavigationLink {
                        LoginView()
                            .navigationBarBackButtonHidden()
                    } label: {
                        HStack(spacing: 3) {
                            Text("Already have an account?")
                                .foregroundStyle(.black)
                            Text("Sign in")
                                .fontWeight(.bold)
                                .foregroundStyle(.green.opacity(0.8))
                        }
                        // .font(.system(size: 14))
                    }
                }
                .padding(.horizontal)
                .padding(.top, 12)
                //Spacer()
                
            }
        }
    }
    func register() {
        Auth.auth().createUser(withEmail: email, password: password) { result, error in
            if error != nil {
                print(error!.localizedDescription)
            }
        }
    }
}
struct SignUp_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}

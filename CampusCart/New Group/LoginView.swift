//
//  LoginScreen.swift
//  CampusCart
//
//  Created by Bryan Apodaca on 9/27/23.
//

import SwiftUI
import Firebase

struct LoginView: View {
    @State var email: String = ""
    @State var password: String = ""
    @State var showPassword: Bool = false
    @EnvironmentObject var viewModel: AuthViewModel
    let color = UIColor(red: 0.96, green: 0.54, blue: 0.10, alpha: 1.0)
    var body: some View {
        NavigationStack {
            ZStack {
                Color.gray
                    .opacity(0.12)
                    .ignoresSafeArea()
                

                VStack(alignment: .center, spacing: 15){
                    //                Image("CampusCart_Title")
                    //                    .resizable()
                    //                    .frame(width:350,height:250,alignment: .leading)
                    //                    .padding(.horizontal)
                    Text("Logo")
                    HStack {
                        Text("UniCart")
                            .font(.system(size:40, weight: .medium, design: .monospaced))
                            .foregroundStyle(.green.opacity(0.6))
                    }
                    .padding(25)
                 
                    .padding(.vertical, 32)
                    Text("Login")
                        .font(.system(size:30, weight: .medium, design: .rounded))
                    TextField("Email", text: $email,
                              prompt: Text("Email").foregroundColor(.gray.opacity(0.9)))
                    .frame(width: 320)
                    .padding(14)
                    .overlay{
                        RoundedRectangle(cornerRadius: 22)
                            .stroke(.gray.opacity(0.6), lineWidth: 2)
                    }
                    .padding(12)
                    HStack{
                     
                        if showPassword {
                            TextField("Password",text: $password,prompt: Text("Password").foregroundColor(.blue))
                        }
                        else{
                            SecureField("Password",text:$password,prompt: Text("Password").foregroundColor(.gray.opacity(0.9)))
                        }
                        
                        Button{
                            showPassword.toggle()
                        }label:{
                            Image(systemName: showPassword ? "eye.slash" : "eye")
                                .foregroundColor(.gray.opacity(0.9)
                                )
                        }
                       
                    }
                    .frame(width: 320)
                    .padding(14)
                    .overlay{
                        RoundedRectangle(cornerRadius: 22)
                            .stroke(.gray.opacity(0.6),lineWidth:2)
                    }
                    .padding(.horizontal)
                    
                    NavigationLink {
                        SignUpView()
                            .navigationBarBackButtonHidden()
                    } label: {
                        HStack(spacing: 3) {
                            Text("Don't have an account?")
                                .foregroundStyle(.black)
                            Text("Sign up")
                                .fontWeight(.bold)
                                .foregroundStyle(.green.opacity(0.8))
                        }
                     
                    }
                    
                    Button{
                        Task {
                            try await viewModel.login(withEmail: email, password: password)
                        }
                    }
                    
                label:{
                    Text("Login")
                        .font(.title2)
                        .bold()
                        .foregroundColor(.white)
                }
                .frame(height:50)
                .frame(maxWidth: 280)
                .background(Color.green.opacity(0.6))
                    //                .background(
                    //                    LinearGradient(colors: [.red,.blue],startPoint: .topLeading,endPoint: .bottomTrailing)
                    //                )
                .cornerRadius(20)
                .padding()
                Spacer()
                    
                    
                }
            }
        }
    }
    func login() {
        Auth.auth().signIn(withEmail: email, password: password) { result, error in
            if error != nil {
                
            }
        }
    }
}



struct LoginScreen_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}

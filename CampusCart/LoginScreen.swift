//
//  LoginScreen.swift
//  CampusCart
//
//  Created by Bryan Apodaca on 9/27/23.
//

import SwiftUI

struct LoginScreen: View {
    @State var userName: String = ""
    @State var password: String = ""
    @State var showPassword: Bool = false
    var body: some View {
        VStack(alignment: .leading, spacing: 15){
            Image("CampusCart_Title")
                .resizable()
                .frame(width:350,height:250,alignment: .leading)
                .padding(.horizontal)
            
            Spacer()
            TextField("Username", text: $userName,
                      prompt: Text("Username").foregroundColor(.green))
                .padding(10)
                .overlay{
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(.green, lineWidth: 2)
                }
                .padding(.horizontal)
            HStack{
                Group{
                    if showPassword {
                        TextField("Password",text: $password,prompt: Text("Password").foregroundColor(.blue))
                    }
                    else{
                        SecureField("Password",text:$password,prompt: Text("Password").foregroundColor(.blue))
                    }
                }
                .padding(10)
                .overlay{
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(.blue,lineWidth:2)
                }
                Button{
                    showPassword.toggle()
                }label:{
                    Image(systemName: showPassword ? "eye.slash" : "eye")
                        .foregroundColor(.red
                        )
                }
            }
            .padding(.horizontal)
            
            Spacer()
            
            Button{
                print("do login stuff")
            }label:{
                Text("Sign In")
                    .font(.title2)
                    .bold()
                    .foregroundColor(.white)
            }
            .frame(height:50)
            .frame(maxWidth: .infinity)
            .background(
                LinearGradient(colors: [.green,.blue],startPoint: .topLeading,endPoint: .bottomTrailing)
            )
            .cornerRadius(20)
            .padding()
            
        }
    }
}

struct LoginScreen_Previews: PreviewProvider {
    static var previews: some View {
        LoginScreen()
    }
}

//
//  ProfileView.swift
//  CampusCart
//
//  Created by Bryan Apodaca on 10/3/23.
//

import SwiftUI

struct ProfileView: View {
    @EnvironmentObject var viewModel: AuthViewModel
    var body: some View {
        VStack {
            ZStack {
                Rectangle()
                    .fill(LinearGradient(colors: [.green.opacity(0.8),.green.opacity(0.4)],startPoint: .topLeading,endPoint: .bottomTrailing))
                    .frame(height: 220, alignment: Alignment.top)
                
                
            }
            List {
                Section {
                    HStack {
                        Text(User.MOCK_USER.initials())
                            .font(.title)
                            .fontWeight(.semibold)
                            .foregroundColor(.white)
                            .frame(width: 72, height: 72)
                            .background(Color(.systemGray3))
                            .clipShape(Circle())
                        VStack {
                            HStack {
                                Text(User.MOCK_USER.firstName)
                                    .fontWeight(.semibold)
                                    .padding(.top, 4)
                                Text(User.MOCK_USER.lastName)
                                    .fontWeight(.semibold)
                                    .padding(.top, 4)
                                    .offset(x: -4)
                            }
                            Text(User.MOCK_USER.email)
                                .font(.footnote)
                                .foregroundColor(.gray)
                        }
                    }
                }
                Section("General") {
                    HStack{
                        SettingsRowView(imageName: "gear", title: "Version", tintColor: Color(.systemGray))
                        
                        Spacer()
                        Text("1.0.0")
                            .font(.subheadline)
                            .foregroundColor(.gray)
                    }
                }
                Section("Account") {
                    Button {
                        print("Sign out..")
                    } label: {
                        SettingsRowView(imageName: "arrow.left.circle.fill", title: "Sign Out", tintColor: .red)
                    }
                    Button {
                        print("Delete Account..")
                    } label: {
                        SettingsRowView(imageName: "xmark.circle.fill", title: "Delete Account", tintColor: .red)
                    }
                }
            }
            Spacer()
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}

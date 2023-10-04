//
//  HomeView.swift
//  CampusCart
//
//  Created by Sung Jae Ko on 10/2/23.
//

import SwiftUI

struct MainView: View {
    
    var body: some View {
        //Text("Current Home view")
        TabView{
            HomeView()
                .tabItem{
                    Label("Home",systemImage: "house.fill")
                }
            PostView()
                .tabItem{
                    Label("Post", systemImage: "square.and.pencil")
                }
            DMView()
                .tabItem{
                    Label("DMs",systemImage:"paperplane.fill")
                }
            ProfileView()
                .tabItem{
                    Label("Profile",systemImage:"person.fill")
                }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}

//
//  HomeView.swift
//  CampusCart
//
//  Created by Bryan Apodaca on 10/3/23.
//

import SwiftUI

struct HomeView: View {
    @State var search: String = ""
    var body: some View {
        VStack{
            Text("Home")
                .font(.title)
            
            TextField("Search", text: $search, prompt: Text("Search")
                .foregroundColor(.gray.opacity(0.9)))
            .frame(width: 320)
            .padding(14)
            .overlay{
                RoundedRectangle(cornerRadius: 22)
                    .stroke(.gray.opacity(0.6), lineWidth: 2)
            }
            
            Button(action: {
                print("Button pressed")
            }){
                HStack{
                    Spacer()
                    Text("Items").foregroundColor(.black)
                        .font(.title)
                    Spacer()
                }
                .frame(minWidth: 10,maxWidth: .infinity)
                .padding()
                .background(Color.green.opacity(0.6))
                .cornerRadius(40)
            }
            Button(action: {
                print("Button pressed")
            }){
                HStack{
                    Spacer()
                    Text("Housing").foregroundColor(.black)
                        .font(.title)
                    Spacer()
                }
                .frame(minWidth: 10,maxWidth: .infinity)
                .padding()
                .background(Color.green.opacity(0.6))
                .cornerRadius(40)
            }
            Button(action: {
                print("Button pressed")
            }){
                HStack{
                    Spacer()
                    Text("Jobs").foregroundColor(.black)
                        .font(.title)
                    Spacer()
                }
                .frame(minWidth: 10,maxWidth: .infinity)
                .padding()
                .background(Color.green.opacity(0.6))
                .cornerRadius(40)
            }
            Button(action: {
                print("Button pressed")
            }){
                HStack{
                    Spacer()
                    Text("Misc.").foregroundColor(.black)
                        .font(.title)
                    Spacer()
                }
                .frame(minWidth: 10,maxWidth: .infinity)
                .padding()
                .background(Color.green.opacity(0.6))
                .cornerRadius(40)
            }
            Spacer()
            
            
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

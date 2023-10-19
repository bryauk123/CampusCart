//
//  PostView.swift
//  CampusCart
//
//  Created by Bryan Apodaca on 10/3/23.
//

import SwiftUI
import PhotosUI
import Firebase

@MainActor
final class PhotoPickerViewModel: ObservableObject{
    
    @Published private(set) var selectedImage: UIImage? = nil
    @Published var imageSelection: PhotosPickerItem? = nil{
        didSet{
            setImage(from: imageSelection)
        }
    }
    private func setImage(from selection: PhotosPickerItem?){
        guard let selection else {return}
        
        Task{
            if let data = try? await selection.loadTransferable(type: Data.self){
                if let uiImage = UIImage(data: data){
                    selectedImage = uiImage
                    return
                }
            }
        }
    }
        
}



struct PostView: View {
    @Binding var listings: [Listing]
    let db = Firestore.firestore()
    
    @State var itemName: String = ""
    @State var description: String = ""
    @State var price: Int = 0
    @State var imageUploaded: Bool = true
    
    @StateObject private var viewModel = PhotoPickerViewModel()
    
    var body: some View {
        VStack{
            TextField("Title",text:$itemName).foregroundColor(.gray.opacity(0.9))
                .frame(width: 320)
                .padding(14)
                .overlay{
                    RoundedRectangle(cornerRadius: 22)
                        .stroke(.gray.opacity(0.6), lineWidth: 2)
                }
            if let image = viewModel.selectedImage{
                Image(uiImage: image)
                    .resizable()
                    .scaledToFill()
                    .frame(width:200,height:200)
                    .cornerRadius(10)
            }
                PhotosPicker(selection: $viewModel.imageSelection,matching:.images){
                    Text("Upload Image")
                        .foregroundColor(.red)
                }
            
            Text("Set Price")
            TextField("$$$",value: $price, format:.number).foregroundColor(.gray.opacity(0.9))
                .frame(width: 100)
                .padding(14)
                .overlay{
                    RoundedRectangle(cornerRadius: 22)
                        .stroke(.gray.opacity(0.6), lineWidth: 2)
                }
            TextField("Description",text:$description).foregroundColor(.gray.opacity(0.9))
                .frame(width: 320,height:150,alignment:.top)
                .padding(14)
                .overlay{
                    RoundedRectangle(cornerRadius: 22)
                        .stroke(.gray.opacity(0.6), lineWidth: 2)
                }
            
            Button("Submit"){
                let randomId = randomString(length: 10)
                let newData = Listing(id: randomId,title: itemName,description: description,price: price)
                let collectionReference = db.collection("listings")
                collectionReference.addDocument(data:[
                    "id": newData.id,
                    "title": newData.title,
                    "description": newData.description,
                    "price": newData.price])
                
                listings.insert(Listing(
                    id: newData.id,
                    title: newData.title,
                    description: newData.description,
                    price: newData.price), at: 0)
                //ItemsView(listModel: listModel)
            }
            
            Spacer()
        }
    }
    func randomString(length: Int) -> String {
        let characters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
        var randomString = ""
        
        for _ in 0..<length {
            let randomIndex = Int.random(in: 0..<characters.count)
            let character = characters[characters.index(characters.startIndex, offsetBy: randomIndex)]
            randomString.append(character)
        }
        
        return randomString
    }
}

struct PostView_Previews: PreviewProvider {
    @State static var listings: [Listing] = []
    static var previews: some View {
        PostView(listings: $listings)
    }
}

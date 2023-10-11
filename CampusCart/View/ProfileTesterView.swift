import SwiftUI

struct ProfileTesterView: View {
    var firstName: String
    var lastName: String
    var email: String
    @EnvironmentObject var viewModel: AuthViewModel
    var body: some View {
        NavigationView {
            VStack {
                ZStack {
                    
                    Rectangle()
                        .fill(LinearGradient(colors: [.blue.opacity(0.4),.purple
                            .opacity(0.4)],startPoint: .topLeading,endPoint: .bottomTrailing))
                        .frame(height: 250, alignment: Alignment.top)
                    
                    VStack {
                        Image(systemName: "person.crop.circle")
                            .resizable()
                            .frame(width: 100, height: 100)
                            .foregroundColor(.blue)
                            .padding(.bottom, 10)
                        
                        Text("\(firstName) \(lastName)")
                            .font(.title)
                        
                        Text(email)
                            .font(.subheadline)
                            .foregroundColor(.gray)
                    }
                }
                
                SettingsBoxView(text: User.MOCK_USER.email, boxName: "Email Address")
                SettingsBoxView(text: User.MOCK_USER.email, boxName: "Email Address")
                Spacer()
            }
        }
        .navigationTitle("Profile")
    }
}

struct ProfileTesterView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileTesterView(firstName: "John", lastName: "Doe", email: "john.doe@example.com")
    }
}

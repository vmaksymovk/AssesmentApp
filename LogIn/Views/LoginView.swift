import SwiftUI

struct LoginView: View {
    @Binding var username: String
    @Binding var password: String
    @Binding var isLoggedIn: Bool

    @State private var showAlert = false

    var body: some View {
        VStack {
            Image("sticker") // Замените на ваше изображение
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 100, height: 100)
                .padding(.bottom, 20)
            
            TextField("Login", text: $username)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            
            SecureField("Password", text: $password)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            
            Button(action: {
                if self.validateUser() {
                    UserDefaults.standard.set(true, forKey: "isLoggedIn")
                    isLoggedIn = true
                } else {
                    showAlert = true
                }
            }) {
                Text("Log in")
                    .frame(minWidth: 0, maxWidth: .infinity)
                    .padding()
                    .foregroundColor(.white)
                    .background(Color.blue)
                    .cornerRadius(8)
            }
            .padding()
        }
        .padding()
        .alert(isPresented: $showAlert) {
            Alert(title: Text("Error"), message: Text("Invalid username or password"), dismissButton: .default(Text("OK")))
        }
    }

    func validateUser() -> Bool {
        let user = User(username: "example@mail.com", password: "12345")
        return user.username == username && user.password == password
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView(username: .constant(""), password: .constant(""), isLoggedIn: .constant(false))
    }
}

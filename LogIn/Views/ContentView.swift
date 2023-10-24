import SwiftUI

struct ContentView: View {
    @State private var username = ""
    @State private var password = ""
    @State private var isLoggedIn = UserDefaults.standard.bool(forKey: "isLoggedIn")

    var body: some View {
        if isLoggedIn {
            MainView(isLoggedIn: $isLoggedIn)
        } else {
            LoginView(username: $username, password: $password, isLoggedIn: $isLoggedIn)
        }
    }
}






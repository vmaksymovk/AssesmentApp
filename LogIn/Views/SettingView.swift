import SwiftUI

struct SettingView: View {
    @Binding var isLoggedIn: Bool

    var body: some View {
        NavigationView {
            List {
                Section(header: Text("Account")) {
                    Text("Username: Vladyslav")
                    Text("Email: 234060@stud.usz.edu.pl")
                }

                Section {
                    Button(action: {
                        logout()
                    }) {
                        Text("Logout")
                            .foregroundColor(.red)
                    }
                }
            }
            .listStyle(GroupedListStyle())
            .navigationTitle("Settings")
        }
    }

    func logout() {
        UserDefaults.standard.set(false, forKey: "isLoggedIn")
        isLoggedIn = false
    }
}

struct Setting_Previews: PreviewProvider {
    static var previews: some View {
        SettingView(isLoggedIn: .constant(true))
    }
}

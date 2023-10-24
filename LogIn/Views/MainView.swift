
import SwiftUI

struct MainView: View {
    @Binding var isLoggedIn: Bool

    var body: some View {
        TabView {
            EvaluationView()
                .badge(2)
                .tabItem {
                    Label("Received", systemImage: "doc.text.magnifyingglass")
                }
            SettingView(isLoggedIn: $isLoggedIn)
                .tabItem {
                    Label("Account", systemImage: "person.crop.circle.fill")
                }
        }
    }
}


struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        SettingView(isLoggedIn: .constant(true))
    }
}

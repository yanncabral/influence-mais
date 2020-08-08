import SwiftUI

struct Tabbar: View {
    var body: some View {

        TabView {

            Page2()
                .tabItem {
                    Image(systemName: "photo")
                    Text("Profissionais")
            }


            Page3()
                .tabItem {
                    Image(systemName: "list.dash")
                    Text("Perfil")

            }
        }
    }
}


struct tabbar_Previews: PreviewProvider {
    static var previews: some View {
        Tabbar()
    }
}

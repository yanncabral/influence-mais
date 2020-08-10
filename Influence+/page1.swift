import SwiftUI

struct Page1: View {

    var body: some View {


        NavigationView {

            VStack() {

                VStack() {

                    VStack{
                        Image("inspiri-se")
//                            .font(.custom("Noto Sans", size: 62))
//                            .fontWeight(.bold)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                        Text("Encontre profissionais que te inspiram.")
                            .font(.custom("Noto Sans", size: 20))
                            .foregroundColor(Color.purple
                        )

                    }

                }

                NavigationLink(destination: Tabbar()){

                    Text("Entrar")
                        .foregroundColor(Color.white)
                        .font(.custom("Noto Sans", size: 24))
                        .multilineTextAlignment(.center)
                        .padding(4)
                        .frame(width: 270, height: 60)
                        .background(Color.purple)
                        .cornerRadius(10)

                }.padding(.vertical, 50.0)

            }
        }

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Page1()
    }
}

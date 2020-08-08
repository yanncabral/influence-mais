import SwiftUI

struct Page2 : View {

    var body : some View {



        VStack(spacing:60){

            Text("Você ainda não tem influências.")
                .font(.custom("Noto Sans", size:36))
                .bold()
                .multilineTextAlignment(.center)
                .foregroundColor(Color.black)
                .padding()


            VStack{

                NavigationLink(destination: SelectionView()){
                    Text("Montar")
                        .frame(width: 300, height: 40)
                        .font(.custom("Noto Sans", size: 24.0))
                        .cornerRadius(30)
                        .foregroundColor(.black)
                        .padding(10)
                        .overlay(
                            RoundedRectangle(cornerRadius: 15)
                                .stroke(Color.black, lineWidth: 1)
                    )
                }
            }
        }
    }


    struct Page2_Previews: PreviewProvider {
        static var previews: some View {
            Page2()

        }
    }
}

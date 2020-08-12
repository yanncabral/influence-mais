import SwiftUI

struct Page2 : View {
    
    let customPurple = Color(red: 87/255, green:84/255, blue:242/255, opacity: 1)
    
    var body : some View {
        
        
        
        VStack(spacing: 60){
            
            
            GeometryReader {
                geometry in
                ZStack(){
                    
                    Image("quadradinhos")
                        .resizable()
                        .offset(y:-geometry.size.height/3)
                        .opacity(0.2)
                        .aspectRatio(contentMode: .fill)

                
                    Text("Descubra novas influências profissionais.")
                        .font(.custom("Noto Sans", size:36))
                        .bold()
                        .multilineTextAlignment(.center)
                        .padding(.top, 100.0)
                }
                .frame(height:geometry.size.height/2)
            }
            
            
            VStack{
                
                NavigationLink(destination: SelectionView()){
                    Text("Começar teste")
                        .frame(width: 300, height: 40)
                        .font(.custom("Noto Sans", size: 24.0))
                        .cornerRadius(30)
                        .foregroundColor(self.customPurple)
                        .padding(10)
                        .overlay(
                            RoundedRectangle(cornerRadius: 15)
                                .stroke(self.customPurple, lineWidth: 1)
                            
                    )
                }.padding(20)
            }
            Spacer()
        }
    }
    
    
    struct Page2_Previews: PreviewProvider {
        static var previews: some View {
            Page2()
            
        }
    }
}


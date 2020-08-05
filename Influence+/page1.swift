//
//  ContentView.swift
//  Influence+
//
//  Created by Yann Cabral on 22/07/20.
//  Copyright © 2020 Yann Cabral. All rights reserved.
//

import SwiftUI

//struct ContentView: View {
//    @State private var email = ""
//    @State private var password = ""
//    @State private var themeTextField = Color.white
//
//    var body: some View {
//
//
//        NavigationView {
//            VStack() {
//            Spacer()
//
//            Image("influence")
//            .resizable()
//            .frame(width: 250, height: 250)
//            .clipShape(Circle())
//            .overlay(Circle().stroke(Color.white, lineWidth: 4))
//            .shadow(radius: 10)
//            .padding(.bottom, 50)
//
//            HStack {
//
//                Text("Bem-vindo!")
//                .font(.title)
//                .fontWeight(.bold)
//                    .foregroundColor(themeTextField)
//                    .padding([.top, .leading, .bottom], 27.5)
//                Spacer()
//
//            }
//
//            VStack(alignment: .leading, spacing: 15) {
//
//              TextField("Email", text: self.$email)
//                .padding()
//                .background(themeTextField)
//                .cornerRadius(5)
//                .shadow(radius: 10)
//
//              SecureField("Senha", text: self.$password)
//                .padding()
//                .background(themeTextField)
//                .cornerRadius(5)
//                .shadow(radius: 10)
//            }.padding([.leading, .trailing], 27.5)
//
//            Spacer()
//
//            Button(action: {}) {
//              Text("Entrar")
//                .font(.headline)
//                .foregroundColor(themeTextField)
//                .padding()
//                .frame(width: 300, height: 50)
//                .background(Color.green)
//                .cornerRadius(5)
//            }
//
//            Spacer()
//
//                NavigationLink (destination: cadastro()){
//                    Text("ou, cadastre-se")
//                .fontWeight(.bold)
//                        .foregroundColor(Color.white)
//                }
//
//            Spacer()
//
//          }.background(
//          LinearGradient(gradient: Gradient(colors: [.purple, .blue]), startPoint: .top, endPoint: .bottom)
//        .edgesIgnoringSafeArea(.all))
//        }
//    }
//
//}
//
//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//
//    }
//}



import SwiftUI
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            Page1()

        }
    }
   
    

struct Page1: View {
    var body: some View {
        
        NavigationView {
            
            ZStack(alignment: .bottomTrailing){

                Image("gradienteInfluenceMais")
                    .resizable()
                    .frame(width: 380, height: 800)
                    .offset(y:-60)

                
                NavigationLink(destination: Page7()){
                    Text("Entrar")
                        .font(Font.custom("Helvetica Neue", size: 18.0))
                        .foregroundColor(Color.black)
                        .multilineTextAlignment(.center)
                        .padding(4)
                        .frame(width: 250, height: 50)
                        .background(Color.purple)
                        .cornerRadius(10)
                        .offset(x: -60, y:-100)
                    
            }
        }
    }
}
    

//Page 2: Descubra
    struct Page7 : View {
    
        var body : some View {

            NavigationView{
                
                VStack(spacing:60){

                NavigationLink(destination: Page3()) {
                        Text("SOBRE VOCÊ")
//                        .bold()
                        .font(Font.custom("Helvetica Neue", size: 24.0))
                            .foregroundColor(Color.black)
                            .padding(20)
                        .frame(width: 300, height: 200)
                        .background(Color.purple)
                        .cornerRadius(30)
                }
                
                NavigationLink(destination: Page4()){
                        Text("MONTE SEU TIME")
//                        .bold()
                        .font(Font.custom("Helvetica Neue", size: 24.0))
                        .foregroundColor(Color.black)
                        .padding(20)
                        .frame(width: 300, height: 200)
                        .background(Color.purple)
                        .cornerRadius(30)
                }
                
            }.navigationBarTitle("Descubra", displayMode: .inline)
           
        }
}
   
        
        
//Page 3: Sobre você
    struct Page3 : View {
        
        var body : some View {
        
            VStack {
                 
                Text("Sobre Você").fontWeight(.heavy)
            } .navigationBarTitle("Sobre você", displayMode: .inline)
        }
        }
         
                
    
        
//Page 4: Fotos
    struct Page4 : View {
                     
        var body : some View {
                     
            VStack {
                              
                Text("Página não idealizada").fontWeight(.heavy)
            }
        }
    }
    }
}

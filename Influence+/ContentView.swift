//
//  ContentView.swift
//  Influence+
//
//  Created by Yann Cabral on 22/07/20.
//  Copyright © 2020 Yann Cabral. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var email = ""
    @State private var password = ""
    @State private var themeTextField = Color.white
      
    var body: some View {
        
    
        NavigationView {
            VStack() {
            Spacer()
            
            Image("influence")
            .resizable()
            .frame(width: 250, height: 250)
            .clipShape(Circle())
            .overlay(Circle().stroke(Color.white, lineWidth: 4))
            .shadow(radius: 10)
            .padding(.bottom, 50)
            
            HStack {
                
                Text("Bem-vindo!")
                .font(.title)
                .fontWeight(.bold)
                    .foregroundColor(themeTextField)
                    .padding([.top, .leading, .bottom], 27.5)
                Spacer()
                
            }
            
            VStack(alignment: .leading, spacing: 15) {
              
              TextField("Email", text: self.$email)
                .padding()
                .background(themeTextField)
                .cornerRadius(5)
                .shadow(radius: 10)
                            
              SecureField("Senha", text: self.$password)
                .padding()
                .background(themeTextField)
                .cornerRadius(5)
                .shadow(radius: 10)
            }.padding([.leading, .trailing], 27.5)
            
            Spacer()
            
            Button(action: {}) {
              Text("Entrar")
                .font(.headline)
                .foregroundColor(themeTextField)
                .padding()
                .frame(width: 300, height: 50)
                .background(Color.green)
                .cornerRadius(5)
            }
            
            Spacer()
            
                NavigationLink (destination: cadastro()){
                    Text("ou, cadastre-se")
                .fontWeight(.bold)
                        .foregroundColor(Color.white)
                }
            
            Spacer()
            
          }.background(
          LinearGradient(gradient: Gradient(colors: [.purple, .blue]), startPoint: .top, endPoint: .bottom)
        .edgesIgnoringSafeArea(.all))
        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
        
    }
}

//_______________________________


//struct cadastro : View {
//    
//    var body : some View{
//        
//        Text("Cadastro 2").fontWeight(.heavy)
//    }
//}
//
//
//struct page2 : View {
//    
//    var body : some View{
//        
//        Text("Hello From Page 2").fontWeight(.heavy).navigationBarTitle("Page 2", displayMode: .inline)
//    }
//}
//
//
//struct page3 : View {
//    
//    var body : some View{
//        
//        Text("Hello From Page 3").fontWeight(.heavy).navigationBarTitle("Page 3", displayMode: .inline)
//        }
//    }

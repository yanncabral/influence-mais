//
//  ContentView.swift
//  Influence+
//
//  Created by Yann Cabral on 22/07/20.
//  Copyright © 2020 Yann Cabral. All rights reserved.
//

import SwiftUI
        
struct MainSreen: View {

    var body: some View {


        NavigationView {
            VStack() {
                
            LinearGradient(
                
                gradient: Gradient(colors: [.purple, Color.pink]), startPoint: .top, endPoint: .bottom
            )
            .edgesIgnoringSafeArea(.all)
            
            NavigationLink(destination: tabbar()){
                
                Text("Entrar")
                    .font(Font.custom("Helvetica Neue", size: 18.0))
                    .foregroundColor(Color.black)
                    .multilineTextAlignment(.center)
                    .padding(4)
                    .frame(width: 250, height: 50)
                    .background(Color.pink)
                    .cornerRadius(10)
                
            }.padding(.vertical, 50.0)

          }
        }
    }

    
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainSreen()
    }
}
}


//
//  Page2.swift
//  Influence+
//
//  Created by Mariana Resende de Paiva on 05/08/20.
//  Copyright © 2020 Yann Cabral. All rights reserved.
//

import SwiftUI

struct Page2 : View {
    
    var body : some View {
        
        NavigationView{
            
            VStack(spacing:60){
                
                NavigationLink(destination: Page3()) {
                    Text("SOBRE VOCÊ")
                        //      .bold()
                        .font(Font.custom("Helvetica Neue", size: 24.0))
                        .foregroundColor(Color.black)
                        .padding(20)
                        .frame(width: 300, height: 200)
                        .background(Color.purple)
                        .cornerRadius(30)
                }
                
                NavigationLink(destination: Page4()){
                    Text("MONTE SEU TIME")
                        //      .bold()
                        .font(Font.custom("Helvetica Neue", size: 24.0))
                        .foregroundColor(Color.black)
                        .padding(20)
                        .frame(width: 300, height: 200)
                        .background(Color.purple)
                        .cornerRadius(30)
                }
                    
                .navigationBarTitle("Descubra", displayMode: .inline)
                
            }
        }
    }
        
        struct Page2_Previews: PreviewProvider {
            static var previews: some View {
                Page2()
            }
        }
}

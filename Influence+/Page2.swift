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
        
        
            
            VStack(spacing:60){

                Text("Você ainda não tem influências.")
                    //      .bold()
                    .font(Font.custom("Helvetica Neue", size: 24.0))
                    .foregroundColor(Color.black)
                    .tabItem{
                        VStack {
                            Text("First")
                        }
                }


                NavigationLink(destination: SelectionView()){
                    Text("Montar")
                        //      .bold()
                        .font(Font.custom("Helvetica Neue", size: 24.0))
                        .foregroundColor(Color.black)
                        .padding(20)
                        .frame(width: 300, height: 50)
                        .background(Color.purple)
                        .cornerRadius(10)



//                .navigationBarTitle("Descubra", displayMode: .inline)
}
}
}

struct Page2_Previews: PreviewProvider {
    static var previews: some View {
        Page2()
        
    }
}
}

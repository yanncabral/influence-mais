//
//  tabbar.swift
//  Influence+
//
//  Created by Mariana Resende de Paiva on 07/08/20.
//  Copyright © 2020 Yann Cabral. All rights reserved.
//

import SwiftUI

struct tabbar: View {
    var body: some View {
          TabView{
                 Page2()
                     .tabItem{
                         Text("Fotos")
                        .bold()
                 }
            
                Page3()
                    .tabItem{
                        Text("Perfil")
                        .bold()
            }
             }
    }
}

struct tabbar_Previews: PreviewProvider {
    static var previews: some View {
        tabbar()
    }
}

//
//  SwiftUIView.swift
//  Influence+
//
//  Created by Mariana Resende de Paiva on 24/07/20.
//  Copyright © 2020 Yann Cabral. All rights reserved.
//

import SwiftUI

struct cadastro : View {
    
    var body : some View{
        
        Text("Cadastro 2").fontWeight(.heavy)
    }
}


struct page2 : View {
    
    var body : some View{
        
        Text("Hello From Page 2").fontWeight(.heavy).navigationBarTitle("Page 2", displayMode: .inline)
    }
}


struct page3 : View {
    
    var body : some View{
        
        Text("Hello From Page 3").fontWeight(.heavy).navigationBarTitle("Page 3", displayMode: .inline)
        }
    }

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        cadastro()
    }
}



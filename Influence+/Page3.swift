//
//  Page3.swift
//  Influence+
//
//  Created by Mariana Resende de Paiva on 05/08/20.
//  Copyright © 2020 Yann Cabral. All rights reserved.
//

import SwiftUI

struct Page3: View {

    @State var selection = 0

    var body: some View {



        HStack{

            Picker(selection: $selection, label: Text("")){
                Text("Gênero").tag(0)

                Text("Etnia").tag(1)

                Text("Área").tag(2)

                }

            }


        .pickerStyle(SegmentedPickerStyle()).position(.init(x: 180, y: 150))

//            .navigationBarTitle("SOBRE VOCÊ")
    }

struct Page3_Previews: PreviewProvider {
    static var previews: some View {
        Page3()
    }
}

}

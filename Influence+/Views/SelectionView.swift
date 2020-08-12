//
//  selection_view.swift
//  Influence+
//
//  Created by Yann Cabral on 07/08/20.
//  Copyright © 2020 Yann Cabral. All rights reserved.
//

import SwiftUI

struct SelectionView: View {
    @ObservedObject var obs = RemoteData()
    
    var body: some View {
        
        VStack {
            
            if self.obs.data.count != 10 {
                
            ProgressBar(
                currentStep: self.obs.count,
                progressMax: 7)
                .padding()
            
            Text("Escolha o profissional que você mais se identifica.")
                .font(Font.custom("Noto Sans", size: 18.0))
                .fontWeight(.black)
                .foregroundColor(.primary)
                .lineLimit(3)
                .padding(.horizontal)
//                .padding(.bottom, 30.0)
            
                CardGrid(obs: self.obs)
            
            Button(action: {
                self.obs.getFaces(clicked_id: nil)
                
            })
            {
                HStack{
                    Spacer()
                    Text("PULAR")
                        .font(Font.custom("Noto Sans", size: 18.0))
                        .foregroundColor(Color.white)
                        .multilineTextAlignment(.center)
                        .padding(.vertical, 10)
                    Spacer()
                }
                
                }
            .background(Color.black)
            .cornerRadius(10)
            .padding(.horizontal)
            Spacer()
            }
            else {
//                Text("Seu Mapa")
//                .bold()
//                    .font(.title)
//                    .fontWeight(.black)
//                .foregroundColor(.primary)
//                .lineLimit(3)
//                    .padding([.top, .horizontal])
                CardGrid(obs: self.obs)
                .navigationBarTitle("Seu Mapa")
            }
            
        }
    }
}

struct selection_view_Previews: PreviewProvider {
    static var previews: some View {
        SelectionView()
    }
}

//
//  CardView.swift
//  Influence+
//
//  Created by Yann Cabral on 10/08/20.
//  Copyright © 2020 Yann Cabral. All rights reserved.
//

import SwiftUI
import SDWebImageSwiftUI

struct CardView: View {
    var onClick: (Int?) -> Void
    var item: PersonModel
    var clickable: Bool = true
    
    var body: some View {
        
        Button(action: {
            self.onClick(self.item.id)
        }){
            VStack {
                
                if (self.clickable)
                {
                    AnimatedImage(url: URL(string: self.item.image))
                        .resizable()
                        .placeholder(content: {
                            Text("carregando foto...")
                        })
                } else {
                    AnimatedImage(url: URL(string: self.item.image))
                        .resizable()
                        .placeholder(content: {
                            Text("carregando foto...")
                        })
                        .frame(minHeight: 240)
                }
                
                
                VStack(alignment: .leading) {
                    Text(item.name)
                        .foregroundColor(.primary)
                    
                    Text(item.occupation.uppercased())
                        .font(.caption)
                        .foregroundColor(.secondary)
                }
                //                .layoutPriority(100)
                
                Spacer()
                
            }
            .background(Color.white)
            .cornerRadius(15)
            .shadow(color: Color.black.opacity(0.3), radius: 7, x: 0, y: 2)
        }.disabled(!self.clickable)
    }
}

struct CardGrid : View {
    @ObservedObject var obs: RemoteData
    
    func select(){
        obs.getFaces(clicked_id: nil)
    }
    
    var body: some View {
        
        ZStack (alignment: .center){
            
            VStack (spacing: 10){
                
                if self.obs.data.count == 0 {
                    Spacer()
                    Text("procurando...")
                    Spacer()
                } else if self.obs.data.count == 4 {
                    VStack (spacing: 10){
                        //                        Spacer()
                        ForEach( 0..<self.obs.data.count/2, id: \.self) { index in
                            HStack {
                                CardView(onClick: self.obs.getFaces, item: self.obs.data[index * 2])
                                CardView(onClick: self.obs.getFaces, item: self.obs.data[index * 2 + 1])
                            }
                            .animation(.default)
                            .padding(.horizontal)
                        }
                        //                       Spacer()
                    }
                    //                    .padding()
                    
                }  else {
                    ScrollView {
                        VStack(spacing: 10){
                            ForEach( 0..<self.obs.data.count/2, id: \.self) { index in
                                HStack {
                                    CardView(onClick: self.obs.getFaces, item: self.obs.data[index * 2], clickable: false)
                                    CardView(onClick: self.obs.getFaces, item: self.obs.data[index * 2 + 1], clickable: false)
                                }
                                .animation(.default)
                            }
                        }
                        .padding()
                        Button(action: {
                            //                            self.obs.getFaces(clicked_id: nil)
                            
                        })
                        {
                            HStack{
                                Spacer()
                                Text("COMPARTILHAR")
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
                    }
                }
            }
            //        .padding()
            //            .animation(.default)
        }
    }
}


struct CardGrid_Previews: PreviewProvider {
    static var previews: some View {
        SelectionView()
    }
}

//
//  selection_view.swift
//  Influence+
//
//  Created by Yann Cabral on 07/08/20.
//  Copyright © 2020 Yann Cabral. All rights reserved.
//

import SwiftUI
import Alamofire
import SwiftyJSON
import SDWebImageSwiftUI

struct CardView: View {
    var onClick: (Int?) -> Void
    var item: DataModel
    
    var body: some View {
        
        Button(action: {
            self.onClick(self.item.id)
        }){
            VStack {
                ZStack (alignment: .center){
                    Text("carregando foto...")
                    
                    AnimatedImage(url: URL(string: item.image))
                        .resizable()
                    
                }
                
                
                VStack(alignment: .leading) {
                    Text(item.name)
                        .foregroundColor(.primary)
                    
                    Text(item.occupation.uppercased())
                        .font(.caption)
                        .foregroundColor(.secondary)
                }
                .layoutPriority(100)
                
                
                Spacer()
                
            }
            .background(Color.white)
            .cornerRadius(15)
            .shadow(color: Color.black.opacity(0.3), radius: 7, x: 0, y: 2)
            //        .padding()
            
        }
    }
}

struct CardGrid : View {
    @ObservedObject var obs: Observer
    
    func select(){
        obs.getFaces(clicked_id: nil)
    }
    
    var body: some View {
        
        ZStack (alignment: .center){

            VStack {
                
                if self.obs.data.count == 0 {
                        Spacer()
                        Text("procurando...")
                        Spacer()
                } else {
                    ForEach( 0..<self.obs.data.count/2, id: \.self) { index in
                        HStack {
                            CardView(onClick: self.obs.getFaces, item: self.obs.data[index * 2])
                            CardView(onClick: self.obs.getFaces, item: self.obs.data[index * 2 + 1])
                        }
                        .padding(.top)
                        .animation(.default)
                        
                    }
                }
            }
            .padding()
            .animation(.default)
        }
    }
}

struct SelectionView: View {
    var obs = Observer()
    var body: some View {
        
        VStack {
            
            Spacer()
            
            Text("Escolha o profissional que mais te inspira ou com o qual você mais se identifica.")
                .font(Font.custom("Noto Sans", size: 18.0))
                .fontWeight(.black)
                .foregroundColor(.primary)
                .lineLimit(3)
                .padding(.horizontal)
                .padding(.bottom, 30.0)
            
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
            
        }.navigationBarTitle("Monte seu mapa")
    }
}

struct DataModel : Identifiable {
    var id: Int
    var name: String
    var occupation: String
    var image: String
}

class Observer : ObservableObject{
    
    @Published var data = [DataModel]()
    var ids = [Int]()
    
    init() {
        getFaces(clicked_id: nil)
        //        getFaces()
    }
    
    func getFaces(clicked_id: Int?)
    {
        self.data.removeAll()
        if (clicked_id != nil) {
            ids.append(clicked_id!)
        }
                AF.request("https://influence-plus.herokuapp.com/",
//        AF.request("http://127.0.0.1:8000/",
                   method: .post,
                   parameters: ["ids": self.ids],
                   encoding: JSONEncoding.default)
            
            .responseJSON  { response in
                switch response.result {
                case .success(let value):
                    
                    //print("A resposta: ", value)
                    
                    let json = JSON(value)
                    
                    for item in json["result"].arrayValue {
                        self.data.append(
                            DataModel(
                                id: item["id"].intValue,
                                name: item["name"].stringValue,
                                occupation: item["occupation"].stringValue,
                                image: item["image"].stringValue)
                        )
                    }
                    
                case .failure(let error):
                    print(error)
                }
        }
    }
}



struct selection_view_Previews: PreviewProvider {
    static var previews: some View {
        SelectionView()
    }
}

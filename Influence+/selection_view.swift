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
    
    @ObservedObject var data: Observer
    var id: Int
    
    func select(){
        data.getFaces(clicked_id: data.data[id].id)
    }
    
    var body: some View {
        
        Button(action: select )
        {
            VStack {
                ZStack (alignment: .center){
                    Text("paciencia...")
                    
                    AnimatedImage(url: URL(string: data.data[id].image))
                        .resizable()
                    
                }
                
                
                VStack(alignment: .leading) {
                    Text(data.data[id].name)
                        .foregroundColor(.primary)
                    //                      .lineLimit(3)
                    
                    Text(data.data[id].occupation.uppercased())
                        .font(.caption)
                        .foregroundColor(.secondary)
                }
                .layoutPriority(100)
                
                
                Spacer()
                
            }
            .background(Color.white)
            .cornerRadius(15)
            .shadow(color: Color.black.opacity(0.3), radius: 7, x: 0, y: 2)
            .padding()
        }
    }
}

struct SelectionView: View {
    var obs = Observer()
    
    func select(){
        obs.getFaces(clicked_id: nil)
    }
    
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
            
            VStack{
                
                HStack {
                    CardView(data: obs, id: 0)
                    CardView(data: obs, id: 1)
                }
                
                HStack (){
                    CardView(data: obs, id: 2)
                    CardView(data: obs, id: 3)
                }
            }.padding(.bottom, 50)
            
            Button(action: select)
            {
                Text("PULAR")
                .font(Font.custom("Noto Sans", size: 18.0))
                .foregroundColor(Color.white)
                .multilineTextAlignment(.center)
                .padding(.vertical, 4)
                .frame(width: 250, height: 50)
                .background(Color.black)
                .cornerRadius(10)
                .shadow(radius: 10)
            }
            
        }
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
        
        if (clicked_id != nil) {
            ids.append(clicked_id!)
        }
        AF.request("https://influence-plus.herokuapp.com/",
                   method: .post,
                   parameters: ["ids": self.ids],
                   encoding: JSONEncoding.default)
            
            .responseJSON  { response in
                switch response.result {
                case .success(let value):
                    
                    //print("A resposta: ", value)
                    
                    self.data.removeAll()
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

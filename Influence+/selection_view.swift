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
    public var image = "http://commons.wikimedia.org/wiki/Special:FilePath/Premios%20Goya%202018%20-%20Bibiana%20Fern%C3%A1ndez.jpg"
    public var name = "Bibiana Fernández Chica"
    public var occupation = "television presenter"
    public var sexuality = "lesbian"
    
    var body: some View {
        
        VStack {
            AnimatedImage(url: URL(string: image))
                .resizable()
                .clipShape(Circle())
                .padding()
            
            HStack {
                VStack(alignment: .leading) {
                    Text(name)
//                        .font(.title)
//                        .fontWeight(.black)
                        .foregroundColor(.primary)
                        .lineLimit(3)
                    
                    Text(occupation.uppercased())
                        .font(.caption)
                        .foregroundColor(.secondary)
                }
                .layoutPriority(100)
                
                
            }
            .padding()
            Spacer()
        }
        .cornerRadius(10)
        .overlay(
            RoundedRectangle(cornerRadius: 10)
                .stroke(Color(.sRGB, red: 150/255, green: 150/255, blue: 150/255, opacity: 0.3), lineWidth: 1)
                        .shadow(radius: 10)
        )
            .padding()
        
    }
    
}

struct SelectionView: View {
    @ObservedObject var obs = Observer()
    
    var body: some View {
        
        VStack {
            
            Spacer()
            
            Text("Escolha o profissional que mais te inspira ou com o qual você mais se identifica.")
                .font(Font.custom("Noto Sans", size: 18.0))
                .fontWeight(.black)
                .foregroundColor(.primary)
                .lineLimit(3)
                .padding()
            
            HStack {
                CardView()
                CardView()
            }
            HStack {
                CardView()
                CardView()
            }
            
            Spacer()
            
            Text("Completar")
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

struct FaceData : Identifiable{
    public var name: String
    public var image: String
    public var id: Int
}


class Observer : ObservableObject{
    @Published var dataFromNetworking = [FaceData]()
    
    init() {
        getFaces()
    }
    
    func getFaces()
    {
        AF.request("http://127.0.0.1:8000/", method: .post, parameters: ["ids": []], encoding: JSONEncoding.default)
            .responseJSON  { response in
                switch response.result {
                case .success(let value):
                    let json = JSON(value)
                    for item in json["result"].arrayValue {
                        print(item["id"].intValue)
                        print(item["name"].stringValue)
                        print(item["image"].stringValue)
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

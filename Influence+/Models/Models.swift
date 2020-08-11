//
//  Models.swift
//  Influence+
//
//  Created by Yann Cabral on 11/08/20.
//  Copyright © 2020 Yann Cabral. All rights reserved.
//

import SwiftyJSON
import Alamofire
import SwiftUI

struct PersonModel : Identifiable {
    var id: Int
    var name: String
    var occupation: String
    var image: String
}

class RemoteData : ObservableObject{
    
    @Published var data = [PersonModel]()
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
                            PersonModel(
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

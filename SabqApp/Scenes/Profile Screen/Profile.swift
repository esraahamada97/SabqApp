//
//  Profile.swift
//  SabqApp
//
//  Created by user on 11/26/19.
//  Copyright © 2019 user. All rights reserved.
//

import Foundation

struct Profile{
    var name:String
    var email:String
    var coverImage:String
    var profileImage:String
    var id: String
     
    var dictionary: [String: Any] {
        return [
            "name": name,
            "email": email,
            "coverImage": coverImage,
            "profileImage": profileImage,
            "id": id
        ]
    }
}
 
extension Profile{
    init?(dictionary: [String : Any], id: String) {
        guard   let name = dictionary["name"] as? String,
        let email = dictionary["email"] as? String,
        let coverImage = dictionary["coverImage"] as? String,
        let profileImage = dictionary["profileImage"] as? String,
        let id = dictionary["id"] as? String
            
            else { return nil }
         
        self.init(name: name, email: email,coverImage: coverImage,profileImage: profileImage, id: id)
    }
}

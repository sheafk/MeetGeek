//
//  User.swift
//  MeetGeek
//
//  Created by MeetGeek on 10/15/16.
//  Copyright © 2016 MeeGeek. All rights reserved.
//

import Foundation
import Firebase
import FirebaseAuth

struct User {
    
    let uid: String
    let email: String
    var age : String
    var note : String
    var sex : String
    
    init(authData: FIRUser) {
        uid = authData.uid
        email = authData.email!
        
        self.age = "99"
        self.note = "I love live events"
        self.sex = ""
    }
    
    init(uid: String, email: String) {
        self.uid = uid
        self.email = email
        
        self.age = "99"
        self.note = "I love live events"
        self.sex = ""
    }
    
}

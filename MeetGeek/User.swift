//
//  User.swift
//  MeetGeek
//
//  Created by MeetGeek on 10/15/16.
//  Copyright © 2016 MeeGeek. All rights reserved.
//

import Foundation
import Firebase

struct User {
    
    let uid: String
    let email: String
    
    init(authData: FIRUser) {
        uid = authData.uid
        email = authData.email!
    }
    
    init(uid: String, email: String) {
        self.uid = uid
        self.email = email
    }
    
}

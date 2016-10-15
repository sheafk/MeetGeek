//
//  EventPickerViewController.swift
//  MeetGeek
//
//  Created by Flatiron School on 10/15/16.
//  Copyright © 2016 MeeGeek. All rights reserved.
//

import Foundation
import UIKit
import Firebase
import FirebaseDatabase

class EventPickerViewController: UIViewController {

    var user: User!
    var items: [Event] = []
    let ref = FIRDatabase.database().reference(withPath: "events")
    let usersRef = FIRDatabase.database().reference(withPath: "online")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        FIRAuth.auth()!.addStateDidChangeListener { auth, user in
            guard let user = user else { return }
            self.user = User(authData: user)
            // 1
            let currentUserRef = self.usersRef.child(self.user.uid)
            // 2
            currentUserRef.setValue(self.user.email)
            // 3
            currentUserRef.onDisconnectRemoveValue()
        }

        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

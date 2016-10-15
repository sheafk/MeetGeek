//
//  OnlineUsersViewController.swift
//  MeetGeek
//
//  Created by MeetGeek on 10/15/16.
//  Copyright © 2016 MeeGeek. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase
import FirebaseAuth

class OnlineUsersViewController: UIViewController {

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    let userCell = "UserCell"
    
    // MARK: Properties
    var currentUsers: [String] = []
    
    // MARK: UIViewController Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        currentUsers.append("hungry@person.food")
    }
    
    // MARK: UITableView Delegate methods
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return currentUsers.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: userCell, for: indexPath)
        let onlineUserEmail = currentUsers[indexPath.row]
        cell.textLabel?.text = onlineUserEmail
        return cell
    }
    
    // MARK: Actions
    
    @IBAction func signoutButtonPressed(_ sender: AnyObject) {
        dismiss(animated: true, completion: nil)
        print("Log Out")
        
        let alert = UIAlertController(title: "Log Out", message: "Are you sure you want to log out?\nYour information will be saved if you log back in.", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Yes", style: .destructive, handler: { (alertAction) in
            
            do{
                try FIRAuth.auth()?.signOut()
            }  catch {fatalError("Unable to log user out")}
            self.present(LoginViewController(), animated: true, completion: nil)
            
        }))
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: { (alertAction) in
            print("User didn't want to log out. Hide alert.")
        }))
        
        self.present(alert, animated: true, completion: {
            print("Finished presenting alert.")
        })
        
        
    }
    
}



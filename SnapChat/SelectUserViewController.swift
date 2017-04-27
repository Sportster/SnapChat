//
//  SelectUserViewController.swift
//  SnapChat
//
//  Created by Diego Gomez on 2017-04-23.
//  Copyright © 2017 Diego Gomez. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase

class SelectUserViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    
    var users : [User] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.dataSource = self
        self.tableView.delegate = self

        FIRDatabase.database().reference().child("users").observe(FIRDataEventType.childAdded, with: {(snapshot) in
            print(snapshot)
            
         
            
            let user = User()
            let value = snapshot.value as? NSDictionary
            user.email = value?["email"] as? String ?? "" //Theres a Thread 1 break point 2.1 error
            user.uid = snapshot.key
            
            self.users.append(user)
            self.tableView.reloadData()
        })
       
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        
        let user = users[indexPath.row]
        
        cell.textLabel?.text = user.email
        
        return cell
        
    
    }
    
}

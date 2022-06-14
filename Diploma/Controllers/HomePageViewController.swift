//
//  HomePageViewController.swift
//  Diploma
//
//  Created by Роман Корсак on 11.06.22.
//

import UIKit
import Firebase
class HomePageViewController: UIViewController {
    
    var user: User!

    override func viewDidLoad() {
        super.viewDidLoad()
        guard let currentUser = Auth.auth().currentUser else {return}
        user = User(user: currentUser)
        title = "Hello, " + user.email
    }
    
    @IBAction func signOutButton(_ sender: UIBarButtonItem) {
        do {
            try Auth.auth().signOut()
        } catch  {
            print(error.localizedDescription)
        }
        
        dismiss(animated: true, completion:  nil)
    }
    
    
    
    @IBAction func addButton(_ sender: UIBarButtonItem) {
    }
    

}

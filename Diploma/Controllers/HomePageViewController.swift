//
//  HomePageViewController.swift
//  Diploma
//
//  Created by Роман Корсак on 11.06.22.
//

import UIKit
import Firebase
class HomePageViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

       
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

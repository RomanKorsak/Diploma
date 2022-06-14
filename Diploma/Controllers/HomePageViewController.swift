//
//  HomePageViewController.swift
//  Diploma
//
//  Created by Роман Корсак on 11.06.22.
//

import UIKit
import Firebase
class HomePageViewController: UIViewController {
    
    
    @IBOutlet private weak var totalValueLabel: UILabel!
    
    
    @IBOutlet private weak var availableValueLabel: UILabel!
    @IBOutlet private weak var expensesValueLabel: UILabel!
    
    @IBOutlet private weak var savingsValueLabel: UILabel!
    
    @IBOutlet private weak var percentageValueLabel: UILabel!
    
    
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
    
    
    @IBAction func addMoneyButton() {
        
        
    }
    
    @IBAction func addExpenceButton() {
        
        
    }
    

}

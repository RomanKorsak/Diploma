//
//  ViewController.swift
//  Diploma
//
//  Created by Роман Корсак on 30.05.22.
//

import Firebase
import UIKit

class LoginViewController: UIViewController {
    var ref: DatabaseReference!
    
    @IBOutlet var passwordTextField: UITextField!
    @IBOutlet var emailTextField: UITextField!
    @IBOutlet var errorLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        ref = Database.database().reference(withPath: "users")
        
        Auth.auth().addStateDidChangeListener { [weak self] _, user in
            guard let  _ = user else { return }
            self?.performSegue(withIdentifier: "ToHomePageSegue", sender: nil)
        }
    }

    
    
    //MARK: - functions
    
    @IBAction private func loginButton() {
        guard let email = emailTextField.text,
              let password = passwordTextField.text,
              !email.isEmpty, !password.isEmpty
        else {
            displayWarningLabel(withText: "Empty field")
            return
        }
        
        Auth.auth().signIn(withEmail: email, password: password) { [weak self] user, error  in
            if let error = error {
                self?.displayWarningLabel(withText: "Registration error: \(error.localizedDescription)")
            }else if let _ = user{
                self?.performSegue(withIdentifier: "ToHomePageSegue", sender: nil)
            } else {
                self?.displayWarningLabel(withText: "Something Go Wrong")
            }
        }
        
        emailTextField.text = ""
        passwordTextField.text = ""
    }
    
    @IBAction private func registerButton() {
        guard let email = emailTextField.text,
              let password = passwordTextField.text,
              !email.isEmpty, !password.isEmpty
        else {
            displayWarningLabel(withText: "Empty field")
            return
        }
        
        Auth.auth().createUser(withEmail: email, password: password) { [weak self] user, error  in
            if let error = error {
                self?.displayWarningLabel(withText: "Registration error: \(error.localizedDescription)")
            }else if let user = user{
                let userRef = self?.ref.child(user.user.uid)
                userRef?.setValue(["email": user.user.email])
                self?.emailTextField.text = ""
                self?.passwordTextField.text = ""
                self?.errorLabel.textColor = .black
                self?.displayWarningLabel(withText: "u have been registered")
                
                //self?.errorLabel.textColor = .red
            }
        }
        
    }
    
    
    private func displayWarningLabel(withText text: String){
        errorLabel.text = text
        
        UIView.animate(withDuration: 3, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .autoreverse, animations: { [weak self] in
            self?.errorLabel.alpha = 1
        }, completion: { [weak self] _ in
            self?.errorLabel.alpha = 0
            
        })
    }
}

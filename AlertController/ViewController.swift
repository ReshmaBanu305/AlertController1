//
//  ViewController.swift
//  AlertController
//
//  Created by Admin on 5/16/24.
//

import UIKit

class ViewController: UIViewController {
    var myVariable = UIAlertController()
    
    @IBOutlet weak var myLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func submitButtonClicked(_ sender: Any) {
        self.configureAlertView()
    }
    
    @IBAction func destructive(_ sender: Any) {
        self.showDestructive()
    }
    
    @IBAction func submitButton(_ sender: Any) {
        let alertController = UIAlertController(title: "Submission", message: "Enter Email Address", preferredStyle: .alert)
        alertController.addTextField{(textfield)in
            textfield.placeholder = " Enter Your Email Address here"
        }
        let submit = UIAlertAction(title: "submit", style: .default){_ in
            if let email = alertController.textFields?.first?.text
            {
                self.myLabel.text = "Email: \(email)"
        }
            }
        let cancel = UIAlertAction(title: "Cancel", style: .default){_ in
            print( "OPERATION IS CANCELLED")
        }
        alertController.addAction(submit)
        alertController.addAction(cancel)
        self.present(alertController,animated: true)
    }
    
    func configureAlertView(){
        myVariable = UIAlertController(title: "Warning", message: "Do you want to logout ?", preferredStyle: .alert)
        let okButton = UIAlertAction(title: "OK", style: .default){_ in
            self.view.backgroundColor = .blue
            self.dismiss(animated: true)
        }
        let cancelButton = UIAlertAction(title: "Cancel", style: .default){_ in
            self.view.backgroundColor = .red
            self.dismiss(animated: true)
        }
        myVariable.addAction(okButton)
        myVariable.addAction(cancelButton)
        self.present(myVariable,animated: true)
    }
    func showDestructive() {
        let alert = UIAlertController(title: "Sign out", message: "You will be returned to login screen", preferredStyle: .actionSheet)
        let cancelButton = UIAlertAction(title: "CANCEL", style: .default){_ in
            print(" Cancel Action")
        }
        let signOutButton = UIAlertAction(title: "SIGN OUT", style: .destructive){_ in
            print(" SignOut Action")
        }
        alert.addAction(cancelButton)
        alert.addAction(signOutButton)
        self.present(alert,animated: true)
        
    }
    
}

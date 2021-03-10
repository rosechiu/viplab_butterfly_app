//
//  LoginViewController.swift
//  viplab_butterfly_app
//
//  Created by viplab on 2020/10/7.
//  Copyright © 2020年 viplab. All rights reserved.
//

import UIKit
import Firebase

class LoginViewController: UIViewController {

    @IBOutlet var emailTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func login(sender: UIButton) {
        guard let emailAddress = emailTextField.text,emailAddress != "",
            let password = passwordTextField.text,password != "" else {
                let alertController = UIAlertController(title: "Login Error", message: "不能空白", preferredStyle: .alert)
                let okayAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                alertController.addAction(okayAction)
                present(alertController, animated: true, completion: nil)
                return
        }
        
        Auth.auth().signIn(withEmail: emailAddress, password: password, completion: {(user,error) in
            if let error = error {
                let alertController = UIAlertController(title: "Login Error", message: error.localizedDescription, preferredStyle: .alert)
                let okayAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                alertController.addAction(okayAction)
                self.present(alertController, animated: true, completion: nil)
                return
            }
            self.view.endEditing(true)
            
            if let viewController = self.storyboard?.instantiateViewController(withIdentifier: "HomePageRoot"){
                UIApplication.shared.keyWindow?.rootViewController = viewController
                self.dismiss(animated: true, completion: nil)
            }
        })
        
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

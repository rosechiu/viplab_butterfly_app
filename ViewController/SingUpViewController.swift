//
//  SingUpViewController.swift
//  viplab_butterfly_app
//
//  Created by viplab on 2020/10/7.
//  Copyright © 2020年 viplab. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase

class SingUpViewController: UIViewController {
    
    
    @IBOutlet var nameTextField: UITextField!
    @IBOutlet var emailTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    
    @IBAction func registerAccount(_ sender: UIButton) {
        guard let name = nameTextField.text, name != "",
              let email = emailTextField.text, email != "",
              let password = passwordTextField.text, password != "" else {
                let alertController = UIAlertController(title: "註冊失敗", message: "請確認", preferredStyle: .alert)
                let okAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                alertController.addAction(okAction)
                present(alertController, animated: true, completion: nil)
                return
        }
        
        Auth.auth().createUser(withEmail: email, password: password, completion: { (user, error) in
            if let error = error {
                let alertController = UIAlertController(title: "註冊失敗", message: error.localizedDescription, preferredStyle: .alert)
                let okAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                alertController.addAction(okAction)
                self.present(alertController, animated: true, completion: nil)
                return
            }
            
            if let changeRequest = Auth.auth().currentUser?.createProfileChangeRequest() {
                changeRequest.displayName = name
                changeRequest.commitChanges(completion: {(error) in
                    if let error = error {
                        print("FAILED")
                    }
                })
            }
            
            self.view.endEditing(true)
            
            guard let userId = Auth.auth().currentUser?.uid else { return }
            let databaseRef = Database.database().reference().child(userId)
            databaseRef.child("RateOfFeed").child("egg").setValue(0)
            databaseRef.child("RateOfFeed").child("larva").setValue(0)
            databaseRef.child("RateOfFeed").child("pupa").setValue(0)
            
            databaseRef.child("butterfly_partner").child("1").setValue(0)
            databaseRef.child("butterfly_partner").child("2").setValue(0)
            databaseRef.child("butterfly_partner").child("3").setValue(0)
            
            databaseRef.child("current_partner").setValue(0)
            
            if let viewController = self.storyboard?.instantiateViewController(withIdentifier: "HomePageRoot") {
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

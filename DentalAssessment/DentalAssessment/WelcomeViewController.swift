//
//  WelcomeViewController.swift
//  DentalAssessment
//
//  Created by Arsh Agrawal on 08/10/19.
//  Copyright © 2019 student. All rights reserved.
//

import UIKit
import FirebaseAuth
import Firebase

class WelcomeViewController: UIViewController {
    var defaults = UserDefaults.standard
    var ref : DatabaseReference?
    var dbHandle: DatabaseHandle?
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBOutlet var usernameField: UITextField!
    @IBOutlet var passwordField: UITextField!
    @IBOutlet var incorrectDetailsLabel: UILabel!
    

    @IBAction func loginPressed(_ sender: Any) {
        guard let username = usernameField.text else {return}
        guard let password = passwordField.text else {return}
        let view = self;
        Auth.auth().signIn(withEmail: username, password: password){
            [weak self] authResult, error in
            guard self != nil else {return}
            if let error = error {
                print(error)
                view.incorrectDetailsLabel.isHidden = false
                return
            }
            print("No errors")
            guard let authResult = authResult else {return}
            view.defaults.set(authResult.user.uid, forKey: "userid")
            print("Valid result")
            view.ref = Database.database().reference()
            view.dbHandle = view.ref?.child("roles").child(authResult.user.uid).observe(.value, with: { (snapshot) in
                if !snapshot.exists()
                {
                    print("snapshot returned but doesn't exist")
                    return;
                }
                let value = snapshot.value as? NSDictionary
                if let role = value?["role"] as? String {
                    if role == "patient" {
                        view.performSegue(withIdentifier: "patientLoginSegue", sender: nil)
                    }
                    else {
                        view.performSegue(withIdentifier: "doctorLoginSegue", sender: nil)
                    }
                }
            })
        }
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

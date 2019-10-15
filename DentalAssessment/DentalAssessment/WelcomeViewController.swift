//
//  WelcomeViewController.swift
//  DentalAssessment
//
//  Created by Arsh Agrawal on 08/10/19.
//  Copyright © 2019 student. All rights reserved.
//

import UIKit
import FirebaseAuth

class WelcomeViewController: UIViewController {

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
            view.performSegue(withIdentifier: "patientLoginSegue", sender: nil)
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

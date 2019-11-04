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
var vSpinner: UIView?

class WelcomeViewController: UIViewController {
    var defaults = UserDefaults.standard
    var ref : DatabaseReference?
    var dbHandle: DatabaseHandle?
    override func viewDidLoad() {
        super.viewDidLoad()
        takeUserToDashboard()
    }

    @IBOutlet var usernameField: UITextField!
    @IBOutlet var passwordField: UITextField!
    @IBOutlet var incorrectDetailsLabel: UILabel!
    

    @IBAction func loginPressed(_ sender: Any) {
        
        guard let username = usernameField.text else {return}
        guard let password = passwordField.text else {return}
        let view = self;
        self.showSpinner(onView: self.view)
        Auth.auth().signIn(withEmail: username, password: password){
            [weak self] authResult, error in
            view.removeSpinner()
            guard self != nil else {return}
            if let error = error {
                print(error)
                view.incorrectDetailsLabel.isHidden = false
                return
            }
            view.incorrectDetailsLabel.isHidden = true
            print("No errors")
            guard let authResult = authResult else {return}
            view.defaults.set(authResult.user.uid, forKey: "userid")
            print("Valid result")
            view.takeUserToDashboard()
        }
    }
    func takeUserToDashboard(){
        ref = Database.database().reference()
        print("here")
        guard let uid = defaults.string(forKey: "userid") else {return}
        print("\n\n UID is: \(uid)\n\n")
        self.performSegue(withIdentifier: "doctorLoginSegue", sender: nil)
        /*dbHandle = ref?.child("roles").child(uid).observe(.value, with: { (snapshot) in
            if !snapshot.exists()
            {
                print("snapshot returned but doesn't exist")
                return;
            }
            let value = snapshot.value as? NSDictionary
            if let role = value?["role"] as? String {
                if role == "patient" {
                    self.performSegue(withIdentifier: "patientLoginSegue", sender: nil)
                }
                else {
                    self.performSegue(withIdentifier: "doctorLoginSegue", sender: nil)
                }
            }
        })
         */
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

extension UIViewController {
    func showSpinner(onView : UIView) {
        let spinnerView = UIView.init(frame: onView.bounds)
        spinnerView.backgroundColor = UIColor.init(red: 0.5, green: 0.5, blue: 0.5, alpha: 0.5)
        let ai = UIActivityIndicatorView.init(style: .whiteLarge)
        ai.startAnimating()
        ai.center = spinnerView.center
        
        DispatchQueue.main.async {
            spinnerView.addSubview(ai)
            onView.addSubview(spinnerView)
        }
        
        vSpinner = spinnerView
    }
    
    func removeSpinner() {
        DispatchQueue.main.async {
            vSpinner?.removeFromSuperview()
            vSpinner = nil
        }
    }
}

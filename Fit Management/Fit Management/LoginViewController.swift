//
//  ViewController.swift
//  Fit Management
//
//  Created by cmulab on 05/01/2020.
//  Copyright © 2020 cmulab. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    let SegueloginToWorkouts = "loginToWorkouts"
    //var usern:String? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func loginButtonClicked(_ sender: Any) {
        
        let user = usernameTextField.text!
        let pwd = passwordTextField.text!
        
        if( !user.isEmpty && !pwd.isEmpty){
            performSegue(withIdentifier: SegueloginToWorkouts, sender: self)
            //usern = user
            
        }else{
            let alert = UIAlertController(title: "Datos inválidos", message: "Asegúrate de haber introducido tus datos de forma segura.", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "Default action"), style: .default, handler: { _ in
            NSLog("The \"OK\" alert occured.")
            }))
            self.present(alert, animated: true, completion: nil)
        }
    }
    
        override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
            usernameTextField.resignFirstResponder()
            passwordTextField.resignFirstResponder()
        
    }
     /*func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let vista:WorkoutsViewController = segue.destination as! WorkoutsViewController
        vista.user = self.usern ?? "";
    }*/

}


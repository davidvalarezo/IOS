//
//  ViewController.swift
//  BookaFilmity
//
//  Created by cmu on 07/12/2019.
//  Copyright © 2019 UPV. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var userTxt: UITextField!
    @IBOutlet weak var passTxt: UITextField!
    
    @IBOutlet weak var lblError: UILabel!

    @IBAction func Btn_ingresar(_ sender: UIButton) {
        
        if (userTxt.text == "" || passTxt.text == ""){
            lblError.isHidden = false
        }else {
            performSegue(withIdentifier: "showitems", sender: self)
            let nom = userTxt.text!
            let pass = passTxt.text!
            UserDefaults.standard.set(true, forKey: "LOGINUSER")
            let ingreso = self.storyboard?.instantiateViewController(withIdentifier: "showitems") as! ItemsViewController
            self.navigationController?.pushViewController(ingreso, animated: true)
            print("usuario ", nom, "password", pass )
            
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        lblError.isHidden = true
        if UserDefaults.standard.set(true, forKey: "LOGINUSER") == true {
        let ingreso = self.storyboard?.instantiateViewController(withIdentifier: "showitems") as! ItemsViewController
        self.navigationController?.pushViewController(ingreso, animated: false)
        }
        // Do any additional setup after loading the view.
    }


}


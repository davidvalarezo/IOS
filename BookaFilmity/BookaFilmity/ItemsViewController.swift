//
//  ItemsViewController.swift
//  BookaFilmity
//
//  Created by labdisca on 18/12/2019.
//  Copyright © 2019 UPV. All rights reserved.
//

import UIKit

class ItemsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    extension ItemsViewController : UITableViewDataSource, UITableViewDelegate {
         
        
        func tabla (_ tabla: UITableView, numberOfRowsInSection section: Int) -> Int {
            return 0
        }
        func tabla (_ tabla: UITableView, cellForRowAt indexPath: IndexPath)->UITableViewCell {
            return nill
        }
    }
    
    @IBOutlet weak var tabla: UITableView!{
        didSet {
            tabla.dataSource = self
            tabla.delegate = self
            tabla.reloadData()
        }
    }
    
    @IBAction func salir(_ sender: UIBarButtonItem) {
        UserDefaults.standard.set(false, forKey: "LOGINUSER")
        self.navigationController?.popToRootViewController(animated: true)
    }
    
    @IBAction func mas(_ sender: Any) {
        performSegue(withIdentifier: "createItem", sender: self)
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

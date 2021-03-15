//
//  ViewController.swift
//  RadioStation
//
//  Created by David on 08/05/2020.
//  Copyright © 2020 David. All rights reserved.
//

import UIKit

class TagsViewController: UITableViewController {
    var tempTags = ["Jazz", "Blues", "Country", "Salsa", "Rock", "Baladas"]

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //asociar el archivo tagcell.xib con view cell pag 9 paso 1
        //tableView.register(UINib(nibName: "TagCell", bundle:nil), forCellReuseIdentifier: "TagCell")
    }
    
}

extension TagsViewController {
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       // let celda = tempTags[indexPath.row]
    }
}

extension TagsViewController {
    
        
    /*override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        <#code#>
    }*/
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tempTags.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let celda = tableView.dequeueReusableCell(withIdentifier: "TagCell")as! TagCell? else { return UITableViewCell() }
        
        celda.nameMusic.text = tempTags[indexPath.row]
        celda.inicialMusic.text = "J";
        //celda.textLabel?.text = tempTags[indexPath.row]
        return celda
    }
}

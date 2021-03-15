//
//  ViewController.swift
//  tablas
//
//  Created by Jordi Tormo Llàcer on 22/11/2019.
//  Copyright © 2019 Jordi Tormo Llàcer. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource
{
    @IBOutlet weak var tblView: UITableView!
    
    let contenido  = ["Jordi", "Javier", "Laura", "Paula", "Lirios", "Jose", "afdsfadfafsda"]
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupTableView()
    }

    func setupTableView()
    {
        tblView.delegate = self
        tblView.dataSource = self
    }
    
    
    
    ///Métodos del protocolo de Delegació de UITableViewDelegate y UITableViewDataSource
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return contenido.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let celda = UITableViewCell(style: .default, reuseIdentifier: "Celda")
        celda.textLabel?.text = contenido[indexPath.row]
        
        return celda
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        print("celda seleccionada: \(indexPath.row)")
        let mensaje = "Has seleccionado a \( contenido[indexPath.row] )"
        let alert = UIAlertController(title: "Seleccionado", message: mensaje, preferredStyle: .alert)
        let actionOK = UIAlertAction(title: "Aceptar", style: .default, handler: nil)
        alert.addAction(actionOK)
        
        self.present(alert, animated: true)
    }

}


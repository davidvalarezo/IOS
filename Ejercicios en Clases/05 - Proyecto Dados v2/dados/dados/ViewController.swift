//
//  ViewController.swift
//  dados
//
//  Created by Jordi Tormo Llàcer on 25/10/2019.
//  Copyright © 2019 UPV. All rights reserved.
//

import UIKit

class ViewController: UIViewController
{

    @IBOutlet weak var imgViewDado1: UIImageView!
    @IBOutlet weak var imgViewDado2: UIImageView!

    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        imgViewDado1.image = #imageLiteral(resourceName: "dice-5")
        imgViewDado2.image = #imageLiteral(resourceName: "dice-2")
    }
    
    
    
    @IBAction func actionLanzarDados(_ sender: UIButton)
    {
        let arrayImagenesDados = [#imageLiteral(resourceName: "dice"),#imageLiteral(resourceName: "dice-2"),#imageLiteral(resourceName: "dice-3"),#imageLiteral(resourceName: "dice-4"),#imageLiteral(resourceName: "dice-5"),#imageLiteral(resourceName: "dice-6")]
        
        // Opción A -> utilizar un número aleatorio en el índice del array
        // imgViewDado1.image = arrayImagenesDados[Int.random(in: 0...5)]
        // imgViewDado2.image = arrayImagenesDados[Int.random(in: 0...5)]
        
        
        // Opción B -> utilizar el método que dispone la clase Array para devolver un elemento de forma aleatoria.
        imgViewDado1.image = arrayImagenesDados.randomElement()
        imgViewDado2.image = arrayImagenesDados.randomElement()
    }
    
    


}


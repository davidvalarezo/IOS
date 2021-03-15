//
//  ViewController.swift
//  audio
//
//  Created by Jordi Tormo Llàcer on 28/02/2020.
//  Copyright © 2020 UPV. All rights reserved.
//

import UIKit
import AVFoundation


class ViewController: UIViewController
{
    var reproductor = AVAudioPlayer()
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let ruta = Bundle.main.path(forResource: "bach-busoni", ofType: "mp3")
        print("Ruta: " + ruta!)
        
        let rutaURL:URL = URL(fileURLWithPath: ruta!)
        
        do
        {
            try reproductor = AVAudioPlayer(contentsOf: rutaURL)
        }
        catch
        {
            // Procesar los errores encontrados
            // Capturar las excepciones
        }
    }

    
    @IBAction func actionReproducir(_ sender: UIButton)
    {
        reproductor.play()
    }
    
    
    @IBAction func actionPausa(_ sender: UIButton)
    {
        reproductor.pause()
    }
    
    
    @IBAction func actionSlider(_ sender: UISlider)
    {
        reproductor.volume = sender.value
        print(reproductor.volume)
    }
    
    
    

}


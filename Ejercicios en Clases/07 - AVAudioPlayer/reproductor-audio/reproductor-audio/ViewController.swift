//
//  ViewController.swift
//  reproductor-audio
//
//  Created by Jordi Tormo Llàcer on 28/02/2020.
//  Copyright © 2020 UPV. All rights reserved.
//

import UIKit
import AVFoundation


class ViewController: UIViewController
{
    @IBOutlet weak var sliderBarridoTiempo: UISlider!
    @IBOutlet weak var sliderVolumen: UISlider!
    
    var reproductor = AVAudioPlayer()
    let rutaMusica = Bundle.main.path(forResource: "bach-bwv806", ofType: "mp3")
    var temporizador = Timer()
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        do
        {
            try reproductor = AVAudioPlayer(contentsOf: URL(fileURLWithPath: rutaMusica!))
            sliderBarridoTiempo.maximumValue = Float(reproductor.duration)
        }
        catch
        {
            // Capturar la excepción.
        }
    }

    
    @IBAction func actionReproducir(_ sender: UIBarButtonItem)
    {
        reproductor.play()
        
        temporizador = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(actualizarBarrido(_:)), userInfo: nil, repeats: true)
    }
    
    @objc func actualizarBarrido(_ sender: Any)
    {
        sliderBarridoTiempo.value = Float(reproductor.currentTime)
    }
    
    
    @IBAction func actionVolumenCambiado(_ sender: UISlider)
    {
        reproductor.volume = sliderVolumen.value
    }
    
    
    @IBAction func actionBarridoMovido(_ sender: UISlider)
    {
        reproductor.currentTime = TimeInterval(sliderBarridoTiempo.value)
    }
    
    
    @IBAction func actionPausa(_ sender: UIBarButtonItem)
    {
        reproductor.pause()
        temporizador.invalidate()
    }
    
    
    @IBAction func actionStop(_ sender: UIBarButtonItem)
    {
        reproductor.pause()
        temporizador.invalidate()
        reproductor.currentTime = 0
    }
    

}


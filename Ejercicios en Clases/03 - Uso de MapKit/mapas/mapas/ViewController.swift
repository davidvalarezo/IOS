//
//  ViewController.swift
//  mapas
//
//  Created by Jordi Tormo Llàcer on 31/01/2020.
//  Copyright © 2020 UPV. All rights reserved.
//

import UIKit
import MapKit


class ViewController: UIViewController, MKMapViewDelegate
{
    @IBOutlet weak var mapa: MKMapView!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
        //Definir ubicación del mapa
        let latitud: CLLocationDegrees = 51.5007292
        let longitud: CLLocationDegrees = -0.1268141
        
        //Define el zoom/apertura del mapa
        let latDelta: CLLocationDegrees = 0.005
        let lonDelta: CLLocationDegrees = 0.005
        
        //creamos los objetos que combinan ubicación y amplitud
        let span: MKCoordinateSpan = MKCoordinateSpan(latitudeDelta: latDelta, longitudeDelta: lonDelta)
        let ubicacion: CLLocationCoordinate2D = CLLocationCoordinate2D(latitude: latitud, longitude: longitud)
        
        //Establecemos el area a mostrar sobre el mapa
        let region: MKCoordinateRegion = MKCoordinateRegion(center: ubicacion, span: span)
        mapa.setRegion(region, animated: true)
        
        /*------------------------------*/
        
        //Crear chincheta
        let anotacion = MKPointAnnotation()
        anotacion.title = "Big Ben"
        anotacion.subtitle = "Londres"
        anotacion.coordinate = ubicacion
        
        //Añadir anotación al mapa
        mapa.addAnnotation(anotacion)
    }


}


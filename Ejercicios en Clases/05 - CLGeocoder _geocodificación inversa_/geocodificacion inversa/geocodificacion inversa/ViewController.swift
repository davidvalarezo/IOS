//
//  ViewController.swift
//  geocodificacion inversa
//
//  Created by Jordi Tormo Llàcer on 21/02/2020.
//  Copyright © 2020 UPV. All rights reserved.
//

import UIKit
import CoreLocation

class ViewController: UIViewController, CLLocationManagerDelegate
{
    var locationManager = CLLocationManager()
    
    @IBOutlet weak var lblLatitud: UILabel!
    @IBOutlet weak var lblLongitud: UILabel!
    
    @IBOutlet weak var lblOrientacion: UILabel!
    @IBOutlet weak var lblVelocidad: UILabel!
    
    @IBOutlet weak var lblAltitud: UILabel!
    
    @IBOutlet weak var lblDireccion: UILabel!
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
    }

    
    // MARK: Métodos del protocolo CLLocationManagerDelegate
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation])
    {
        //print(locations)
        let ubicacion = locations[0]
        
        self.lblLatitud.text = String(ubicacion.coordinate.latitude)
        self.lblLongitud.text = String(ubicacion.coordinate.longitude)
        
        self.lblOrientacion.text = String(ubicacion.course)
        self.lblVelocidad.text = String(ubicacion.speed)
        
        self.lblAltitud.text = String(ubicacion.altitude)
        
        CLGeocoder().reverseGeocodeLocation(ubicacion)
        { (placemarks, error) in
            if let err = error
            {
                print(err)
            }
            else
            {
                if let placemark = placemarks?[0]
                {
                    //print(placemark)
                    var subthoroughfare = ""
                    if placemark.subThoroughfare != nil
                    {
                        subthoroughfare = placemark.subThoroughfare!
                    }
                    
                    var thoroughfare = ""
                    if placemark.thoroughfare != nil
                    {
                        thoroughfare = placemark.thoroughfare!
                    }
                    
                    var locality = ""
                    if placemark.locality != nil
                    {
                        locality = placemark.locality!
                    }
                    
                    var subadministrativearea = ""
                    if placemark.subAdministrativeArea != nil
                    {
                        subadministrativearea = placemark.subAdministrativeArea!
                    }
                    
                    var postalCode = ""
                    if placemark.postalCode != nil
                    {
                        postalCode = placemark.postalCode!
                    }
                    
                    var country = ""
                    if placemark.country != nil
                    {
                        country = placemark.country!
                    }
                    
                    print("subthoroughfare: "+subthoroughfare)
                    print("thoroughfare: "+thoroughfare)
                    
                    print("locality: "+locality)
                    
                    print("subadministrativearea: "+subadministrativearea)
                    
                    print("postalCode: "+postalCode)
                    print("country: "+country+"\n")
                    
                    print("-----------------------")
                    print("Dirección: \(thoroughfare), \(subthoroughfare)\n \(postalCode)-\(subadministrativearea) \n \(country)")
                    print("-----------------------")

                    self.lblDireccion.text = "\(thoroughfare), \(subthoroughfare)\n \(postalCode), \(locality) - \(subadministrativearea) \n \(country)"
                }
            }
        }
    }
}


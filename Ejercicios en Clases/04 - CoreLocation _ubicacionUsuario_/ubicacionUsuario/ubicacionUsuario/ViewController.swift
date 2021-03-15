//
//  ViewController.swift
//  ubicacionUsuario
//
//  Created by Jordi Tormo Llàcer on 14/02/2020.
//  Copyright © 2020 UPV. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation


class ViewController: UIViewController, CLLocationManagerDelegate
{
    @IBOutlet weak var mapView: MKMapView!
    
    let locationManager = CLLocationManager()
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
    }
    
    
    override func viewDidAppear(_ animated: Bool)
    {
        super.viewDidAppear(animated)
        
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest

        
        pedirPermisoLocalizacionUsuario()
    }

    
    func pedirPermisoLocalizacionUsuario()
    {
        let alerta = UIAlertController(title: "La App quiere acceder a tu ubicación.", message: "Necesitamos conocer tu ubicación para ofrecerte resultados de búsqueda personalizados", preferredStyle: .alert)
        
        let actionOK = UIAlertAction(title: "Permitir", style: .default)
        { (actionOK) in
            self.locationManager.requestWhenInUseAuthorization()
            self.locationManager.startUpdatingLocation()
        }
        let actionCancel = UIAlertAction(title: "Cancelar", style: .cancel, handler: nil)
        
        alerta.addAction(actionOK)
        alerta.addAction(actionCancel)
        
        self.present(alerta, animated: true, completion: nil)
    }
    
    
    
    
    // MARK: Métodos del protocolo CLLocationManagerDelegate
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation])
    {
        //print(locations[0])
        
        let ubicacionUsuario:CLLocation = locations[0]
        
        let latitud = ubicacionUsuario.coordinate.latitude
        let longitud = ubicacionUsuario.coordinate.longitude
        
        let latDelta:CLLocationDegrees = 0.02
        let lonDelta:CLLocationDegrees = 0.02
        
        let span:MKCoordinateSpan = MKCoordinateSpan(latitudeDelta: latDelta, longitudeDelta: lonDelta)
        
        let ubicacion = CLLocationCoordinate2D(latitude: latitud, longitude: longitud)
        
        let region = MKCoordinateRegion(center: ubicacion, span: span)
        
        self.mapView.setRegion(region, animated: true)
        print(ubicacion)
        
        /*
        let anotacion = MKPointAnnotation()
        anotacion.coordinate = ubicacion
        mapView.addAnnotation(anotacion)
        */
        
        CLGeocoder().reverseGeocodeLocation(ubicacionUsuario)
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
                    
                    var sublocality = ""
                    if placemark.subLocality != nil
                    {
                        sublocality = placemark.subLocality!
                    }
                    
                    var subadministrativearea = ""
                    if placemark.subAdministrativeArea != nil
                    {
                        subadministrativearea = placemark.subAdministrativeArea!
                    }
                    
                    var administrativearea = ""
                    if placemark.administrativeArea != nil
                    {
                        administrativearea = placemark.administrativeArea!
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
                    
                    print("sublocality: "+sublocality)
                    print("locality: "+locality)
                    
                    print("subadministrativearea: "+subadministrativearea)
                    print("administrativearea: "+administrativearea)
                    
                    print("postalCode: "+postalCode)
                    print("country: "+country+"\n")
                    
                    print("-----------------------")
                    print("Dirección: \(thoroughfare), \(subthoroughfare)\n \(postalCode)-\(subadministrativearea) \n \(country)")
                    print("-----------------------")
                    
                }
            }
        }
    }
    

}


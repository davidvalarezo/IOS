//
//  ViewController.swift
//  Persistencia Datos
//
//  Created by Jordi Tormo Llàcer on 13/03/2020.
//  Copyright © 2020 UPV. All rights reserved.
//

import UIKit
import CoreData


class ViewController: UIViewController
{

    override func viewDidLoad()
    {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let contexto = appDelegate.persistentContainer.viewContext
        
        
        
        // INSERTAR DATOS EN LA BASE DE DATOS DE CORE DATA
        
        let nuevoUsuario = NSEntityDescription.insertNewObject(forEntityName: "Usuarios", into: contexto)
        nuevoUsuario.setValue("jordi", forKey: "username")
        nuevoUsuario.setValue("1234", forKey: "password")
        nuevoUsuario.setValue(34, forKey: "edad")
        
        do
        {
            try contexto.save()
            print("Guardado correctamente en persistencia")
        }
        catch
        {
            print("Ocurrió un error al guardar en persistencia")
        }
        
        //--------------------------------------------------------//
        
        
        // LEER DATOS DESDE LA BASE DE DATOS DE CORE DATA
        
        let peticion = NSFetchRequest<NSFetchRequestResult>(entityName: "Usuarios")
        peticion.returnsObjectsAsFaults = false
        
        do
        {
            let resultados = try contexto.fetch(peticion)
            
            if resultados.count > 0
            {
                for resultado in resultados as! [NSManagedObject]
                {
                    if let username = resultado.value(forKey: "username")
                    {
                        print(username)
                    }
                }
            }
            else
            {
                print("No hay resultados en CoreData")
            }
        }
        catch
        {
            print("Ha ocurrido un error al leer desde CoreData")
        }
        
    }


}


//
//  ViewController.swift
//  Login con CoreData
//
//  Created by Jordi Tormo Llàcer on 27/03/2020.
//  Copyright © 2020 UPV. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController
{
    @IBOutlet weak var txtUsuario: UITextField!
    @IBOutlet weak var lblDato: UILabel!
    @IBOutlet weak var btnLogin: UIButton!
    @IBOutlet weak var btnLogout: UIButton!
    var estaLogueado = false
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        
        /*
        //Añadimos dos usuarios de prueba
         
        let u = NSEntityDescription.insertNewObject(forEntityName: "Usuarios", into: context)
        u.setValue("Javier", forKey: "nombre")
        u.setValue("1234", forKey: "pass")
        
        let us = NSEntityDescription.insertNewObject(forEntityName: "Usuarios", into: context)
        us.setValue("Paula", forKey: "nombre")
        us.setValue("5678", forKey: "pass")
        
        do
        {
            //Ejecutar el Query
            try context.save()
        }
        catch
        {
            print("Ocurrió un error al guardar los dos nuevos usuarios")
        }
        */
        
        // actualizarUsuario()
        // eliminarUsuario()
        
        // Equivalente a preparar el Query de tipo SELECT en SQL
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Usuarios")
        // Equivalente a añadir WHERE a un Query
        //request.predicate = NSPredicate(format: "nombre = %@", "Jordi")
        
        request.returnsObjectsAsFaults = false
        
        do
        {
            //Ejecutamos el Query SELECT
            let results = try context.fetch(request)
            
            for result in results as! [NSManagedObject]
            {
                
                if let nombre = result.value(forKey: "nombre") as? String
                {
                    print(nombre)
                    
                    //txtUsuario.alpha = 0
                    //btnLogin.alpha = 0
                    btnLogin.setTitle("Actualizar nombre", for: [])
                    
                    btnLogout.alpha = 1
                    lblDato.alpha = 1
                    lblDato.text = "Bienvenido " + nombre + "!"
                }
                
                if let pass = result.value(forKey: "pass") as? String
                {
                    print(pass)
                }
            }
        }
        catch
        {
            print("Ocurrió un error al leer de la base de datos.")
        }
    }

    
    @IBAction func actionAcceder(_ sender: UIButton)
    {
        print("ACCEDER")
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        
        if estaLogueado
        {
            let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Usuarios")
            //request.returnsObjectsAsFaults = true
            do
            {
                let resultados = try context.fetch(request)
                
                if resultados.count > 0
                {
                    for resultado in resultados as! [NSManagedObject]
                    {
                        resultado.setValue(txtUsuario.text, forKey: "nombre")
                        do
                        {
                            try context.save()
                            lblDato.text = "Bienvenido \(txtUsuario.text!)"
                        }
                        catch
                        {
                            print("Ocurrió un error al intentar escribir los cambios en CoreData")
                        }
                    }
                }
            }
            catch
            {
                print("Ocurrió un error al intentar actualizar el usuario.")
            }
            
        }
        else
        {
            //Si no está logueado
            //Equivalente a a preparar el Query de tipo INSERT en SQL
            let nuevoUsuario = NSEntityDescription.insertNewObject(forEntityName: "Usuarios", into: context)
            nuevoUsuario.setValue(txtUsuario.text, forKey: "nombre")
            
            do
            {
                //Ejecutar el Query
                try context.save()
                
                //txtUsuario.alpha = 0
                //btnLogin.alpha = 0
                btnLogin.setTitle("Actualizar nombre", for: [])
                
                btnLogout.alpha = 1
                lblDato.alpha = 1
                
                estaLogueado = true
                
                lblDato.text = "Bienvenido " + txtUsuario.text! + "!"
            }
            catch
            {
                print("Error al guardar en base de datos.")
            }
        }
        
    }
    
    
    @IBAction func actionCerrarSesion(_ sender: UIButton)
    {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Usuarios")
        
        do
        {
            let results = try context.fetch(request)
            
            if results.count > 0
            {
                for result in results as! [NSManagedObject]
                {
                    context.delete(result)
                    
                    do
                    {
                        try context.save()
                        
                        lblDato.alpha = 0
                        btnLogout.alpha = 0
                        //txtUsuario.alpha = 1
                        //btnLogin.alpha = 1
                        btnLogin.setTitle("Acceder", for: [])
                        
                        txtUsuario.text = ""
                    }
                    catch
                    {
                        print("Error al intentar eliminar el usuario.")
                    }
                }
                
                
            }
            else
            {
                print("No se han encontrado usuarios que cumplan con el predicado.")
            }
        }
        catch
        {
            print("Ocurrió un error al consultar CoreData")
        }
    }
    

    
    func actualizarUsuario()
    {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Usuarios")
        request.predicate = NSPredicate(format: "nombre = %@", "Jordi")
        request.returnsObjectsAsFaults = false
        
        do
        {
            let results = try context.fetch(request)
            
            for result in results as! [NSManagedObject]
            {
                result.setValue("111111", forKey: "pass")
                do
                {
                    try context.save()
                    print("Usuario actualizado correctamente")
                }
                catch
                {
                    print("Error al actualizar usuario en base de datos")
                }
            }
        }
        catch
        {
            print("Error al obtener resultados")
        }
    }
    
    
    func eliminarUsuario()
    {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Usuarios")
        request.predicate = NSPredicate(format: "nombre = %@", "Javier")
        request.returnsObjectsAsFaults = false
        
        do
        {
            let results = try context.fetch(request)
            if results.count > 0
            {
                for result in results as! [NSManagedObject]
                {
                    //Equivalente a preparar el Query DELETE de SQL
                    context.delete(result)
                    
                    do
                    {
                        //Ejecución del query
                        try context.save()
                        print("Usuario eliminado correctamente")
                    }
                    catch
                    {
                        print("Error al eliminar de CoreData")
                    }
                }
            }
            else
            {
                print("No se han encontrado usuarios que cumplan con el Predicado")
            }
        }
        catch
        {
            print("Error al leer datos de CoreData")
        }
    }
}


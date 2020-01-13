//
//  WorkoutDetailsViewController.swift
//  Fit Management
//
//  Created by cmulab on 08/01/2020.
//  Copyright © 2020 cmulab. All rights reserved.
//

import UIKit

class WorkoutDetailsViewController: UIViewController {
    var workout: Workout! = nil

    @IBOutlet weak var lblWDduration: UILabel!
    @IBOutlet weak var lblWDduracion: UILabel!
    @IBOutlet weak var lblWDfecha: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(workout ??  "")

        // Do any additional setup after loading the view.
    }
    
    func showWorkoutDetails(){
        lblWDduration.text = "Tipo: \(workout.type.rawValue)"
        lblWDduracion.text = "Duración: \(workout.duration) Min"
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "es_ES")
        dateFormatter.dateFormat = "MMMM dd, yyyy"
        let fecha = dateFormatter.string(from: workout.date)
        lblWDfecha.text = "Fecha: \(fecha)"
        
    }
        
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

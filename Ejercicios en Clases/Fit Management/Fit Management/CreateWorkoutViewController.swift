//
//  CreateWorkoutViewController.swift
//  Fit Management
//
//  Created by cmulab on 07/01/2020.
//  Copyright © 2020 cmulab. All rights reserved.
//

import UIKit

class CreateWorkoutViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
 
    @IBOutlet weak var fechaPicker: UIDatePicker!
    @IBOutlet weak var labelDuracion: UILabel!
    @IBOutlet weak var sliderDuracion: UISlider!
    @IBOutlet weak var workoutPicker: UIPickerView!{
        didSet {
            workoutPicker.delegate = self
            workoutPicker.dataSource = self
        }
    }
        
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        //let workoutType = ["EMOM", "Tabata", "AMRAP", "ForTime"]
        return WorkoutType.wtype.count
    }
       
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return WorkoutType.wtype[row].rawValue
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func sliderValueChanged(_ sender: UISlider) {
        labelDuracion.text = "Duración: \(Int(sliderDuracion.value*100)) minutos"
    }
    
    var workoutCreatedHandler: ((Workout) -> Void)?
    @IBAction func createWorkout(_ sender: Any) {
        let duration = Int(sliderDuracion.value)
        let date = fechaPicker.date
        let type = WorkoutType.wtype[workoutPicker.selectedRow(inComponent: 1)].rawValue
        
        let entrenamiento:Workout = Workout(duration: duration, date: date, type: WorkoutType(rawValue: type)!)
        print(entrenamiento)
        
        workoutCreatedHandler?(entrenamiento)
        
        let regreso = self.storyboard?.instantiateViewController(withIdentifier: "workoutsToCreate") as! WorkoutsViewController
        self.navigationController?.pushViewController(regreso, animated: true)
        
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

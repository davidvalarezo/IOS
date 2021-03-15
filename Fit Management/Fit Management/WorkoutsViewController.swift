//
//  WorkoutsViewController.swift
//  Fit Management
//
//  Created by cmulab on 06/01/2020.
//  Copyright © 2020 cmulab. All rights reserved.
//

import UIKit

class WorkoutsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var user:String = "";
    private var workoutList:[Workout] = []
    @IBOutlet weak var workoutTableView: UITableView!{
        didSet {
            workoutTableView.delegate = self
            workoutTableView.dataSource = self
        }
    }
              
    override func viewDidLoad() {
        super.viewDidLoad()
        let salir = UIBarButtonItem(title: "Salir", style: .plain, target: self, action: #selector(logout))
        navigationItem.rightBarButtonItem = salir
        //workoutTableView.rowHeight = UITableView.automaticDimension
        //workoutTableView.estimatedRowHeight = 600
        // Do any additional setup after loading the view.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return workoutList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //let celda = UITableViewCell(style: .default, reuseIdentifier: "Celda")
        //celda.textLabel?.text = workoutList[indexPath.row].description

        let celda:WorkoutCellTableViewCell = tableView.dequeueReusableCell(withIdentifier: "WorkoutCellTableViewCell", for: indexPath) as! WorkoutCellTableViewCell
            celda.workoutCell(workout: workoutList[indexPath.row])
            celda.lblNum.text = "\(indexPath.row + 1 )"
                
            return celda

        
        
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if(editingStyle == UITableViewCell.EditingStyle.delete){
            workoutList.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: UITableView.RowAnimation.automatic)
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "workoutsToDetails", sender: workoutList[indexPath.row])
    }
    
    @objc func logout() {
        dismiss(animated: true, completion: nil)
    }
    
    //var workoutCreatedHandler: ((Workout) -> Void)?
    func onWorkoutCreated(workout: Workout){
        workoutList.append(workout)
        workoutTableView.reloadData()
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "workoutsToCreate"{
            guard let createVC = segue.destination as? CreateWorkoutViewController else { return }
            //createVC.workoutCreatedHandler = workoutCreatedHandler
            createVC.workoutCreatedHandler = onWorkoutCreated
        }
        if segue.identifier == "workoutsToDetails" {
            let sgdestantion = segue.destination as! WorkoutDetailsViewController
            if let nav = sender as? Workout
            {
                sgdestantion.workout = nav
            }
        }
        
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

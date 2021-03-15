//
//  WorkoutCellTableViewCell.swift
//  Fit Management
//
//  Created by cmulab on 08/01/2020.
//  Copyright © 2020 cmulab. All rights reserved.
//

import UIKit

class WorkoutCellTableViewCell: UITableViewCell {

    @IBOutlet weak var lblType: UILabel!
    @IBOutlet weak var lblDate: UILabel!
    @IBOutlet weak var lblDuration: UILabel!
    @IBOutlet weak var lblNum: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func workoutCell(workout: Workout){
        lblType.text = workout.type.rawValue
        lblDuration.text = "\(workout.duration) Min"
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMMM dd, yyyy"
        let fecha = dateFormatter.string(from: workout.date)
        lblDate.text = fecha

    }

}

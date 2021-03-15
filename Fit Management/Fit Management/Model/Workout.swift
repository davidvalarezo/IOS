//
//  Workout.swift
//  Fit Management
//
//  Created by cmulab on 07/01/2020.
//  Copyright © 2020 cmulab. All rights reserved.
//

import Foundation

struct Workout {
    var duration:Int
    var date:Date
    var type:WorkoutType
}

enum WorkoutType: String {
    case EMOM, Tabata, AMRAP, ForTime
    static var wtype: Array<WorkoutType> = [WorkoutType.EMOM, WorkoutType.Tabata, WorkoutType.AMRAP, WorkoutType.ForTime]
}

extension Workout: CustomStringConvertible {
    var description: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd MMMMM yyyy"
        let fecha = dateFormatter.string(from: date)
        return "Tipo: \(type.rawValue), Duración: \(duration), Fecha: \(fecha)"
    }
}

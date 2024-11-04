//
//  Exercise.swift
//  DailyWorx1.0
//
//  Created by Joseph DeWeese on 11/4/24.
//

import SwiftUI
import SwiftData

@Model
class Exercise {
    var name: String = ""
    var workouts: [Workout]?
    
    init(name: String) {
        self.name = name
      
    }
    
    
}

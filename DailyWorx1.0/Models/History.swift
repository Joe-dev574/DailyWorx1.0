//
//  History.swift
//  DailyWorx1.0
//
//  Created by Joseph DeWeese on 11/4/24.
//

import Foundation
import SwiftData

@Model
class History {
    var creationDate: Date = Date.now
    var exerciseList: [Exercise] = []
    var transcription: String? = ""
    var page: String? = ""
    
    init(
        creationDate: Date = Date.now,
        exerciseList: [Exercise],
        page: String? = nil,
        workout: Workout? = nil,
        transcription: String? = nil
    ) {
        self.creationDate = creationDate
        self.exerciseList = exerciseList
        self.page = page
        self.workout = workout
        self.transcription = transcription
    }
    
    var workout: Workout?
}

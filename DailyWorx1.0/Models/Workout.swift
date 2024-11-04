//
//  DailyWorkout.swift
//  DailyWorx1.0
//
//  Created by Joseph DeWeese on 11/4/24.
//

import SwiftUI
import SwiftData

@Model
final class Workout {
    var timestamp: Date
    var title: String = ""
    var remarks: String = ""
    var workoutType: WorkoutType.RawValue = WorkoutType.StrengthTraining.rawValue
    var lengthInMinutes: Int = 0
    var color: String = "FF0000"
    @Relationship(inverse: \Exercise.workouts)
    var exercises: [Exercise]?
    @Relationship(deleteRule: .cascade)
    var historyList: [History]?
    
    init(
        timestamp: Date,
        title: String,
        remarks: String,
        workoutType: WorkoutType = .StrengthTraining,
        lengthInMinutes: Int,
        color: String,
        exercises: [Exercise]? = nil,
        historyList: [History]? = nil
    ) {
        self.timestamp = timestamp
        self.title = title
        self.remarks = remarks
        self.workoutType = workoutType.rawValue
        self.lengthInMinutes = lengthInMinutes
        self.color = color
        self.exercises = exercises
        self.historyList = historyList
    }
    var icon: Image {
        switch WorkoutType(rawValue: workoutType)! {
            case .StrengthTraining:
            return Image(systemName: "hand.pump.fill")
        case .CardioTraining:
            return Image(systemName: "heart.pulse.fill")
        case .PowerTraining:
            return Image(systemName: "bolt.fill")
        case .HIITTraining:
            return Image(systemName: "fire.fill")
            case .YogaTraining:
            return Image(systemName: "yoga.fill")
        case .PilatesTraining:
            return Image(systemName: "pilates.fill")
        case .CyclingTraining:
            return Image(systemName: "cycle.fill")
        case .SwimmingTraining:
            return Image(systemName: "swim.fill")
        case .WalkingTraining:
            return Image(systemName: "walk.fill")
        case .FlexibilityTraining:
            return Image(systemName: "flexibility.fill")
        }
    }
}
enum WorkoutType: Int, Codable, Identifiable, CaseIterable {
    case  StrengthTraining, CardioTraining, PowerTraining, HIITTraining, YogaTraining, PilatesTraining, CyclingTraining, SwimmingTraining, WalkingTraining, FlexibilityTraining
    var id: Self {
        self
    }
    var descr: LocalizedStringResource {
       switch self {
        case .StrengthTraining:
            return "Strength Training"
        case .CardioTraining:
            return "Cardio Training"
        case .PowerTraining:
            return "Power Training"
        case .HIITTraining:
            return "HIIT Training"
        case .YogaTraining:
           return "Yoga Training"
       case .PilatesTraining:
           return "Pilates Training"
       case .CyclingTraining:
           return "Cycling Training"
       case .SwimmingTraining:
           return "Swimming Training"
       case .WalkingTraining:
           return "Walking Training"
       case .FlexibilityTraining:
           return "Flexibility Training"
        }
        }
    }
    



//
//  WorkoutCardView.swift
//  DailyWorx1.0
//
//  Created by Joseph DeWeese on 11/4/24.
//

import SwiftUI

struct WorkoutCardView: View {
    //MARK:  PROPERTIES
    let workout: Workout
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 7)
                .fill(.ultraThickMaterial)
            VStack(alignment: .leading){
                HStack{
                    ZStack {
                        RoundedRectangle(cornerRadius: 7)
                            .fill(.ultraThinMaterial)
                            .frame(height: 30)
                    }
                    Spacer( )
                }
                //MARK:  MAIN BODY OF CARD
                HStack{
                    //MARK:  ICON
                    workout.icon
                        .font(.title)
                        .padding(.leading, 5)
                        .padding(.horizontal, 10)
                        .padding(.bottom, 30)
                    VStack(alignment: .leading){
                        Text(workout.title )
                            .foregroundStyle(.primary)
                            .padding(.horizontal, 2)
                        Text(workout.remarks)
                            .foregroundStyle(.blue)
                            .padding(.horizontal, 4)
                            .padding(.bottom, 10)
                            .lineLimit(3)
                        HStack {
                            //MARK:  DATE CREATED DATA LINE
                            Text("Date Created: ")
                                .foregroundStyle(.gray)
                            Image(systemName: "calendar.badge.clock")
                                .font(.caption)
                                .foregroundStyle(.gray)
                            Text(workout.timestamp, format: Date.FormatStyle(date: .numeric, time: .standard))
                                .foregroundStyle(.gray)
                        }
                        }
                    }
                }
                .padding(.horizontal,2)
            }
        }
    }


#Preview {
    ContentView()
}

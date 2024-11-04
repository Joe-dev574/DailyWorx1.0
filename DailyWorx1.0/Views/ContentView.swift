//
//  ContentView.swift
//  DailyWorx1.0
//
//  Created by Joseph DeWeese on 11/4/24.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    //MARK:  PROPERTIES
@Environment(\.modelContext) private var modelContext
@Query private var workouts: [Workout]
@State private var showAddWorkout: Bool = false
    
    
    
    var body: some View {
        NavigationSplitView {
            //MARK: LIST START
            List {
                ForEach(workouts) { workout in
                    NavigationLink {
                        WorkoutDetailView()
                    } label: {
                        WorkoutCardView(workout: workout)
                    }
                }
                .onDelete(perform: deleteItems)
            }
#if os(macOS)
            .navigationSplitViewColumnWidth(min: 180, ideal: 200)
#endif
            .toolbar {
#if os(iOS)
                ToolbarItem(placement: .navigationBarLeading) {
                    EditButton()
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button{
                        showAddWorkout = true
                    } label: {
                        Image(systemName: "plus")
                    }
                }
                
#endif
            }
            .sheet(isPresented: $showAddWorkout) {
                AddWorkoutView()
                    .presentationDetents([.medium])
            }
            
        } detail: {
            
        }
    }

    

    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            for index in offsets {
                modelContext.delete(workouts[index])
            }
        }
    }
}

#Preview {
    ContentView()
        .modelContainer(for: Workout.self, inMemory: true)
}

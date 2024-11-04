//
//  DailyWorx1_0App.swift
//  DailyWorx1.0
//
//  Created by Joseph DeWeese on 11/4/24.
//

import SwiftUI
import SwiftData

@main
struct DailyWorx1_0App: App {
    var sharedModelContainer: ModelContainer = {
        let schema = Schema([
            Workout.self,
        ])
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)

        do {
            return try ModelContainer(for: schema, configurations: [modelConfiguration])
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }()

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(sharedModelContainer)
    }
}

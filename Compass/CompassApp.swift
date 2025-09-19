//
//  CompassApp.swift
//  Compass
//
//  Created by Ayush Biswas on 17/09/25.
//

import SwiftUI

@main
struct CompassApp: App {
    @State private var problem: Problem = Problem()
    @State private var verdicts: Verdicts = Verdicts()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .problem(problem)
                .verdicts(verdicts)
                .task {
                    do {
                        try await Entrypoint
                            .main(
                                state: AppState(
                                    problem: problem,
                                    verdicts: verdicts
                                )
                            )
                    } catch {
                        print("Entrypoint failed: \(error)")
                    }
                }
                .containerBackground(.thinMaterial, for: .window)
        }
        .windowStyle(.hiddenTitleBar)
        .windowBackgroundDragBehavior(.enabled)
    }
}

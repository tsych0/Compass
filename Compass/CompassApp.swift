//
//  CompassApp.swift
//  Compass
//
//  Created by Ayush Biswas on 17/09/25.
//

import SwiftUI

@main
struct CompassApp: App {
    @State private var state: AppState = AppState()

    var body: some Scene {
        Window("Welcome", id: "welcome") {
            WelcomeView()
                .frame(width: 600, height: 400)
                .containerBackground(.ultraThickMaterial, for: .window)
        }
        .defaultLaunchBehavior(.presented)
        .windowStyle(.hiddenTitleBar)
        .windowResizability(.contentSize)
        .windowBackgroundDragBehavior(.enabled)

        // Then: the main content view window
        Window("Main", id: "main") {
            ContentView().state(state)
                .task {
                    do {
                        try await Entrypoint
                            .main(state: state)
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

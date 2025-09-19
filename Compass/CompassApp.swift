//
//  CompassApp.swift
//  Compass
//
//  Created by Ayush Biswas on 17/09/25.
//

import SwiftUI

@main
struct CompassApp: App {
    @State private var verdictList: [Verdict] = [
        Verdict(input: "4\n2\not\n2\nad\nDV\n3\nefo\n7\nrdcoecs\nDVDVDVD\n3\naca\n4\nbbaa\nDVDV\n3\nbiz\n4\nabon\nVVDD\n",
                output: "dota\ncodeforces\nabacaba\nbabizon\n",
                status_id: 1,
                status: "AC"),
        Verdict(input: "5\n11\n5 5 5 5 2 2 2 8 6 1 7\n6\n3 3 3 3 3 3\n5\n2 1 3 5 4\n8\n1 1 1 2 3 4 5 6\n1\n1\n",
                output: "3 3 2 2 2 1 1 1 1 1 1\n1 1 1 1 1 1\n1 1 1 1 1\n2 2 1 1 1 1 1 1\n1\n",
                status_id: 69,
                status: "WA")
    ]
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .verdicts(verdictList)
                .containerBackground(.thinMaterial, for: .window)
        }
        .windowStyle(.hiddenTitleBar)
        .windowBackgroundDragBehavior(.enabled)
    }
}

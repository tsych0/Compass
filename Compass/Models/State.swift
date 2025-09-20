//
//  state.swift
//  Compass
//
//  Created by Ayush Biswas on 19/09/25.
//

import SwiftUI

@Observable
public class AppState {
    var problem: Problem
    var verdicts: Verdicts
    var directory: String = ""
    var language_id: Int = 0
    var languages: [String: Language] = [:]
    
    init(problem: Problem = Problem(), verdicts: Verdicts = Verdicts()) {
        self.languages = load("Languages.toml")
        self.problem = problem
        self.verdicts = verdicts
    }
}

extension EnvironmentValues {
    @Entry var state: AppState = AppState()
}

extension View {
    func state(_ state: AppState) -> some View {
        environment(\.state, state)
    }
}

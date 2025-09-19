//
//  state.swift
//  Compass
//
//  Created by Ayush Biswas on 19/09/25.
//

import Foundation

@Observable
public class AppState {
    var problem: Problem
    var verdicts: Verdicts
    
    init(problem: Problem, verdicts: Verdicts) {
        self.problem = problem
        self.verdicts = verdicts
    }
}

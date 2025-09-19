//
//  routes.swift
//  Compass
//
//  Created by Ayush Biswas on 19/09/25.
//

import Vapor
import SwiftUI

func routes(_ app: Application, state: AppState) throws {
    app.post { req async throws in
        let data = try req.content.decode(Info.self)
        await MainActor.run {
            state.problem.title = data.name
            state.problem.url = data.url
            state.problem.time_limit = data.timeLimit
            state.problem.memory_limit = data.memoryLimit
            
            state.verdicts.items = data.tests.map { test in
                let v = Verdict()
                v.input = test.input
                v.output = test.output
                return v
            }
        }
        return "Ok"
    }
}

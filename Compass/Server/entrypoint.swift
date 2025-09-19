//
//  Server.swift
//  Compass
//
//  Created by Ayush Biswas on 19/09/25.
//

import Vapor

enum Entrypoint {
    static func main(state: AppState) async throws {
        var env = try Environment.detect()
        try LoggingSystem.bootstrap(from: &env)
        
        let app = try await Application.make(env)
        app.http.server.configuration.port = 6174
        
        do {
            try await configure(app, state: state)
            try await app.execute()
        } catch {
            app.logger.report(error: error)
            try? await app.asyncShutdown()
            throw error
        }
        try await app.asyncShutdown()
    }
}

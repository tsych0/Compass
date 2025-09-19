//
//  configure.swift
//  Compass
//
//  Created by Ayush Biswas on 19/09/25.
//

import Vapor

// configures your application
public func configure(_ app: Application, state: AppState) async throws {
    // uncomment to serve files from /Public folder
    // app.middleware.use(FileMiddleware(publicDirectory: app.directory.publicDirectory))
    
    // register routes
    try routes(app, state: state)
}

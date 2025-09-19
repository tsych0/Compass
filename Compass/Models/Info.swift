//
//  Info.swift
//  Compass
//
//  Created by Ayush Biswas on 18/09/25.
//

import Foundation
import Vapor

struct Info: Content  {
    var name: String
    var group: String
    var url: String
    var interactive: Bool
    var memoryLimit: Int64
    var timeLimit: Int64
    var tests: [Test]
}

struct Test: Content {
    var input: String
    var output: String
}


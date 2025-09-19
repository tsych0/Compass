//
//  Info.swift
//  Compass
//
//  Created by Ayush Biswas on 18/09/25.
//

import Foundation

struct Info: Codable  {
    var name: String
    var group: String
    var url: String
    var interactive: Bool
    var memory_limit: Int64
    var time_limit: Int64
    var tests: [Test]
}

struct Test: Codable {
    var input: String
    var output: String
}


//
//  Problem.swift
//  Compass
//
//  Created by Ayush Biswas on 18/09/25.
//

import Foundation

@Observable
class Problem {
    var title: String
    var url: String
    var memory_limit: Int64
    var time_limit: Int64
    
    init(title: String, url: String, memory_limit: Int64, time_limit: Int64) {
        self.title = title
        self.url = url
        self.memory_limit = memory_limit
        self.time_limit = time_limit
    }
}

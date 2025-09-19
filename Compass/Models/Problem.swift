//
//  Problem.swift
//  Compass
//
//  Created by Ayush Biswas on 18/09/25.
//

import Foundation
import SwiftUI

@Observable
public class Problem {
    var title: String
    var url: String
    var memory_limit: Int64
    var time_limit: Int64

    init(
        title: String = "",
        url: String = "",
        memory_limit: Int64 = 0,
        time_limit: Int64 = 0
    ) {
        self.title = title
        self.url = url
        self.memory_limit = memory_limit
        self.time_limit = time_limit
    }
}

extension EnvironmentValues {
    @Entry var problem: Problem = Problem()
}

extension View {
    func problem(_ problem: Problem) -> some View {
        environment(\.problem, problem)
    }
}

//
//  Verdict.swift
//  Compass
//
//  Created by Ayush Biswas on 18/09/25.
//

import Foundation
import SwiftUI

@Observable
class Verdict {
   var input: String
   var output: String
   var stderr: String
   var answer: String
   var status_id: Int64
   var status: String
   var time: Float32
   var memory: Float32
    
   init(
        input: String = "",
        output: String = "",
        stderr: String = "",
        answer: String = "",
        status_id: Int64 = 0,
        status: String = "",
        time: Float32 = 0.0,
        memory: Float32 = 0.0
    ) {
        self.input = input
        self.output = output
        self.stderr = stderr
        self.answer = answer
        self.status_id = status_id
        self.status = status
        self.time = time
        self.memory = memory
    }
}

extension EnvironmentValues {
    @Entry var verdicts: [Verdict] = []
}

extension View {
    func verdicts(_ value: [Verdict]) -> some View {
        environment(\.verdicts, value)
    }
}

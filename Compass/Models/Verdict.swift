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

@Observable
class Verdicts {
    var items: [Verdict]
    
    init(_ items: [Verdict] = []) {
        self.items = items
    }
    
    subscript(index: Int) -> Verdict {
        get { items[index] }
        set { items[index] = newValue }
    }
    
    var isEmpty: Bool { items.isEmpty }
    var count: Int { items.count }
}

extension Verdict {
    var statusColor: Color {
        switch self.status_id {
        case 0:
            .gray
        case 1:
            .green
        default:
            .red
        }
    }
    
    var statusSymbol: String {
        switch self.status_id {
        case 0:
            "circle"
        case 1:
            "checkmark"
        default:
            "xmark"
        }
    }
}

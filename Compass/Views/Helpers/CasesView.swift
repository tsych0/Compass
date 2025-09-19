//
//  CasesView.swift
//  Compass
//
//  Created by Ayush Biswas on 19/09/25.
//

import SwiftUI

struct CasesView: View {
    @Binding var selectedCase: Int
    @Environment(\.verdicts) private var verdicts: [Verdict]
    var numCases: Int {
        verdicts.count
    }

    var body: some View {
        Menu {
            Picker("Test Case", selection: $selectedCase) {
                ForEach(verdicts.enumerated(), id: \.self.offset) { v in
                    HStack {
                        Label(
                            "Case \(v.offset + 1)",
                            systemImage: v.element.status_id == 0 ? "circle" :
                            v.element.status_id == 1 ? "checkmark" : "xmark"
                        )
                            .foregroundStyle(.green)
                            .tag(v.offset + 1)
                    }
                }
            }.pickerStyle(.inline)
            
            Button(action: {selectedCase = numCases}) {
                Label("Add Case", systemImage: "plus")
            }
        } label: {
            Label(
                selectedCase == numCases ? "Case \(numCases + 1)" : "Case \(selectedCase + 1)",
                systemImage: "slider.horizontal.3"
            )
        }.frame(width: 115).padding([.leading], 15)
    }
}

#Preview {
    @Previewable @State var selectedCase: Int = 0
    var verdictList: [Verdict] = [
        Verdict(status_id: 69),
        Verdict(status_id: 1)
    ]

    CasesView(selectedCase: $selectedCase).verdicts(verdictList)
}

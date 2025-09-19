//
//  CasesView.swift
//  Compass
//
//  Created by Ayush Biswas on 19/09/25.
//

import SwiftUI

struct CasesView: View {
    @Binding var selectedCase: Int
    @Environment(\.verdicts) private var verdicts: Verdicts
    private var numCases: Int { verdicts.count }

    private var currentCaseLabel: String {
        if selectedCase == numCases {
            "Case \(numCases + 1)"
        } else {
            "Case \(selectedCase + 1)"
        }
    }

    var body: some View {
        Menu {
            Picker("Test Case", selection: $selectedCase) {
                ForEach(verdicts.items.enumerated(), id: \.offset) { v in
                    Label(
                        "Case \(v.offset + 1)",
                        systemImage: v.element.statusSymbol
                    ).tag(v.offset)
                }
            }.pickerStyle(.inline)

            Button(action: { selectedCase = numCases }) {
                Label("Add Case", systemImage: "plus")
            }
        } label: {
            Label(currentCaseLabel, systemImage: "slider.horizontal.3")
        }
        .frame(width: 115)
        .padding(.leading, 15)
    }
}

#Preview {
    @Previewable @State var selectedCase: Int = 0
    var verdictList: [Verdict] = [
        Verdict(status_id: 69),
        Verdict(status_id: 1),
        Verdict(),
    ]

    CasesView(selectedCase: $selectedCase).verdicts(Verdicts(verdictList))
}

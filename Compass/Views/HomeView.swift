//
//  HomeView.swift
//  Compass
//
//  Created by Ayush Biswas on 18/09/25.
//

import SwiftUI

struct HomeView: View {
    @Environment(\.state) private var state: AppState

    private var problem: Problem { state.problem }
    private var verdicts: Verdicts { state.verdicts }

    @State private var selectedCase: Int = 0
    @State private var newInput: String = ""
    @State private var newOutput: String = ""

    var addingTestCase: Bool {
        selectedCase == verdicts.count
    }

    var verdict: Verdict {
        verdicts.isEmpty || selectedCase == verdicts.count
            ? Verdict() : verdicts[selectedCase]
    }

    var body: some View {
        VStack {
            HStack {
                CasesView(selectedCase: $selectedCase)

                Button(action: {}) {
                    Image(systemName: "plus.circle")
                }.buttonStyle(.plain)
                    .disabled(!addingTestCase)
                    .help("Add test case")

                Spacer()

                Text(problem.title)
                    .font(.system(size: 24))
                    .monospaced()
                    .tracking(0)
                    .padding([.bottom], 8)

                Spacer()

                Text(verdict.status)
                    .font(.caption)
                    .foregroundStyle(verdict.statusColor)
                    .fontWeight(.semibold)
                    .monospaced()

                Spacer()
            }
            .padding(.top, 15)
            .padding(.bottom, 6)

            HStack {
                Spacer()
                IOView(
                    type: "Input",
                    text: addingTestCase ? $newInput : .constant(verdict.input)
                )
                IOView(
                    type: "Output",
                    text: addingTestCase
                        ? $newOutput : .constant(verdict.output)
                )
                IOView(type: "Answer", text: .constant(verdict.answer))
                Spacer()
            }

        }.frame(minWidth: 500)
    }
}

#Preview {
    HomeView()
        .state(
            AppState(
                problem:
                    Problem(
                        title: "Two Sum",
                        url: "",
                        memory_limit: 0,
                        time_limit: 0
                    )
            )
        )
        .padding()
        .frame(width: 900)
}

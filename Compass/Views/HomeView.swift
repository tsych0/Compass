//
//  HomeView.swift
//  Compass
//
//  Created by Ayush Biswas on 18/09/25.
//

import SwiftUI

struct HomeView: View {
    @Environment(\.verdicts) private var verdicts: [Verdict]
    
    @State private var selectedCase: Int = 0
    
    var verdict: Verdict {
        verdicts.isEmpty || selectedCase == verdicts.count ? Verdict() : verdicts[selectedCase]
    }
    
    var body: some View {
        
        VStack {
            HStack {
                CasesView(selectedCase: $selectedCase)
                
                Button(action: {}) {
                     Image(systemName: "plus.circle")
                }.buttonStyle(.plain)
                    .disabled(selectedCase != 0)

                Spacer()
                
                Text("B. Rock and Lever")
                    .font(.system(size: 30))
                    .monospaced()
                    .tracking(0)
                    .padding([.bottom], 8)
                
                Spacer()
                
                Text(verdict.status)
                    .font(.caption)
                    .foregroundStyle(
                        verdict.status_id == 0 ? .gray : verdict.status_id == 1 ? .green : .red
                    )
                    .fontWeight(.semibold)
                    .monospaced()
                
                Spacer()
            }
            
            HStack {
                Spacer()
                IOView(type: "Input", text: verdict.input)
                IOView(type: "Output", text: verdict.output)
                IOView(type: "Answer", text: verdict.answer)
                Spacer()
            }
            
        }.frame(minWidth: 500)
    }
}

#Preview {
    HomeView().padding().frame(width: 900)
}

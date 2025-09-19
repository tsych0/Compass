//
//  IOView.swift
//  Compass
//
//  Created by Ayush Biswas on 17/09/25.
//

import SwiftUI

struct IOView: View {
    var type: String
    @Binding var text: String
    
    var body: some View {
        VStack {
            Text(type)
                .font(.largeTitle)
                .monospaced()
                .padding([.top, .bottom], 5)
                .frame(maxWidth: .infinity)
                .glassEffect(.regular)
            
            TextEditor(text: $text)
                .font(.title3)
                .monospaced()
                .padding(10)
                .scrollContentBackground(.hidden)
                .frame(
                    maxWidth: .infinity,
                    maxHeight: .infinity,
                    alignment: .topLeading,
                )
                .glassEffect(.regular, in: .rect(cornerRadius: 16))
                .offset(y: -5)
        }
    }
}

#Preview {
    @Previewable @State var text = "9\n0 1 4\n1 2 3\n2 -1 -1\n3 -1 -1\n4 5 8\n5 6 7\n6 -1 -1\n7 -1 -1\n8 -1 -1"
    IOView(
        type: "Input",
        text: $text
    ).padding()
}

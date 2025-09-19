//
//  IOView.swift
//  Compass
//
//  Created by Ayush Biswas on 17/09/25.
//

import SwiftUI
    
struct IOView: View {
    var type: String
    var text: String
    
    var body: some View {
        
        VStack {
            Text(type)
                .font(.largeTitle)
                .monospaced()
                .padding([.top, .bottom], 5)
                .frame(maxWidth: .infinity)
                .glassEffect(.regular)

            Text(text)
                .font(.title2)
                .monospaced()
                .padding(10)
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
    IOView(type: "Input",
           text: "9\n0 1 4\n1 2 3\n2 -1 -1\n3 -1 -1\n4 5 8\n5 6 7\n6 -1 -1\n7 -1 -1\n8 -1 -1").padding()
}

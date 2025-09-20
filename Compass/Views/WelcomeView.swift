//
//  LandingView.swift
//  Compass
//
//  Created by Ayush Biswas on 19/09/25.
//

import SwiftUI

struct WelcomeView: View {
    @Environment(\.openWindow) private var openWindow
    
    var body: some View {
        HStack(spacing: 24) {
            
            VStack {
                AppIconView()
                
                Text("Compass")
                    .font(.system(size: 38).weight(.semibold))
                Text("Version 0.69")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }
            
            VStack {
                Button(action: {}) {
                    HStack {
                        Image(systemName: "plus.square")
                            .font(.title2)
                            .foregroundStyle(.gray)
                        Text("Create New Project…")
                            .font(.title3)
                            .padding(4)
                    }
                }.buttonStyle(.plain)
                    .frame(width: 250, alignment: .leading)
                    .padding(.leading, 10)
                    .padding(.vertical, 8)
                    .glassEffect(.clear)
                        .controlSize(.extraLarge)

                Button(action: {
                    let panel = NSOpenPanel()
                    panel.canChooseDirectories = true
                    panel.canChooseFiles = false
                    panel.allowsMultipleSelection = false
                    if panel.runModal() == .OK, let url = panel.url {
                        print(url.path())
                        // handle folder URL as needed...
                        NSApp.keyWindow?.close()
                        openWindow(id: "main")
                    }
                }) {
                    HStack {
                        Image(systemName: "folder")
                            .font(.title2)
                            .foregroundStyle(.gray)
                        Text("Open Existing Project…")
                            .font(.title3)
                            .padding(4)
                    }
                }.buttonStyle(.plain)
                    .frame(width: 250, alignment: .leading)
                    .padding(.leading, 10)
                    .padding(.vertical, 8)
                    .glassEffect(.clear)
                        .controlSize(.extraLarge)

            }
        }.padding(40)
    }
}


#Preview {
    WelcomeView()
        .frame(width: 650, height: 450)
}

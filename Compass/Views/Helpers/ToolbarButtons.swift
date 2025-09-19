//
//  ToolbarButtons.swift
//  Compass
//
//  Created by Ayush Biswas on 18/09/25.
//

import SwiftUI

struct PlayButton: View {
    @State var isRunning = false
    
    var body: some View {
        Button(action: {
            isRunning.toggle()
        }) {
            Image(systemName: isRunning ? "stop.fill" : "play.fill")
                .contentTransition(.symbolEffect(.replace.magic(fallback: .replace)))
                .font(.title2)
        }
        .controlSize(.small)
        .help(isRunning ? "Stop" : "Run")
    }
}

struct SubmitButton: View {
    @State var isSubmitting = false
    
    var body: some View {
        Button(action: { isSubmitting.toggle() }) {
            Image(systemName: isSubmitting ? "square.and.arrow.up.badge.clock" : "square.and.arrow.up")
                .offset(y: isSubmitting ? -1 : -2)
                .font(.title2)
        }.controlSize(.mini)
    }
}

struct CopyButton: View {
    @State private var copied = false
    
    var body: some View {
        Button {
            // Perform the copy action
            //            UIPasteboard.general.string = "Your text"
            
            // Trigger feedback animation
            withAnimation {
                copied = true
            }
            
            // After a delay, reset back to normal
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                withAnimation {
                    copied = false
                }
            }
        } label: {
            Image(systemName: copied ? "checkmark" : "doc.on.doc")
            // One-off checkmark animation
                .symbolEffect(.bounce, value: copied)
        }
    }
}

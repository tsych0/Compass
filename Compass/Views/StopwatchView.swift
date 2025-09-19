//
//  StopWatchView.swift
//  Compass
//
//  Created by Ayush Biswas on 19/09/25.
//

import SwiftUI

import SwiftUI
internal import Combine

struct StopwatchView: View {
    @State private var elapsedTime: TimeInterval = 0
    @State private var isRunning = false
    @State private var startTime: Date?
    
    private var formattedTime: String {
        let minutes = Int(elapsedTime) / 60
        let seconds = Int(elapsedTime) % 60
        return String(format: "%02d:%02d", minutes, seconds)
    }
    
    var body: some View {
        HStack(spacing: 8) {
             Button(action: {
                if isRunning {
                    isRunning = false
                } else {
                    startTime = Date().addingTimeInterval(-elapsedTime)
                    isRunning = true
                }
            }) {
                Image(systemName: isRunning ? "pause.fill" : "play.fill")
                    .font(.title3)
                    .foregroundColor(.white)
                    .contentTransition(.symbolEffect(.replace.magic(fallback: .replace)))
            }
            .controlSize(.small)
            .offset(x: 5)
            
            Divider().frame(height: 20)
            
            Text(formattedTime)
                .font(.system(size: 14, weight: .medium, design: .monospaced))
                .foregroundColor(.white)
                .frame(width: 50)

            
            Divider().frame(height: 20)
            
            Button(action: {
                elapsedTime = 0
                isRunning = false
            }) {
                Image(systemName: "stop.fill")
                    .font(.title3)
                    .foregroundColor(.white)
            }
            .controlSize(.mini)
                .offset(x: -5)
        }
//        .padding(8)
//        .cornerRadius(12)
//        .padding(.top, 10)
//        .padding(.horizontal, 16)
        .onReceive(Timer.publish(every: 0.1, on: .main, in: .common).autoconnect()) { _ in
            guard isRunning else { return }
            elapsedTime = Date().timeIntervalSince(startTime ?? Date())
        }
    }
}

#Preview {
    StopwatchView()
}

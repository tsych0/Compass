//
//  ContentView.swift
//  Compass
//
//  Created by Ayush Biswas on 17/09/25.
//

import SwiftUI

struct ContentView: View {
    @Environment(\.problem) private var problem: Problem

    var body: some View {
        NavigationStack {
            if problem.title.isEmpty {
                NoInfoView()
            } else {
                HomeView()
                    .navigationTitle("Home")
                    .toolbar {
                        HomeToolbar()
                    }
            }
        }
    }
}


#Preview {
    var verdictList: [Verdict] = [
        Verdict(
            input:
                "4\n2\not\n2\nad\nDV\n3\nefo\n7\nrdcoecs\nDVDVDVD\n3\naca\n4\nbbaa\nDVDV\n3\nbiz\n4\nabon\nVVDD\n",
            output: "dota\ncodeforces\nabacaba\nbabizon\n",
            status_id: 1,
            status: "AC"
        ),
        Verdict(
            input:
                "5\n11\n5 5 5 5 2 2 2 8 6 1 7\n6\n3 3 3 3 3 3\n5\n2 1 3 5 4\n8\n1 1 1 2 3 4 5 6\n1\n1\n",
            output:
                "3 3 2 2 2 1 1 1 1 1 1\n1 1 1 1 1 1\n1 1 1 1 1\n2 2 1 1 1 1 1 1\n1\n",
            status_id: 69,
            status: "WA"
        ),
    ]

    ContentView()
        .verdicts(Verdicts(verdictList))
        .problem(Problem(title: "Sum of Subarrays", url: "", memory_limit: 0, time_limit: 0))
}

//
//  ToolbarItems.swift
//  Compass
//
//  Created by Ayush Biswas on 19/09/25.
//

import SwiftUI

struct HomeToolbar: ToolbarContent {
    var body: some ToolbarContent {
        ToolbarItem(placement: .principal) {
            HStack {
                PlayButton().offset(x: 5)
                Divider().frame(height: 24)
                SubmitButton().offset(x: -5)
            }
        }
        ToolbarItem {
            Spacer()
        }
        ToolbarItem {
            Stopwatch()
        }
        ToolbarItem {
            Spacer()
        }
        ToolbarItem {
            CopyButton()
        }
    }
}

//
//  AppIconView.swift
//  Compass
//
//  Created by Ayush Biswas on 20/09/25.
//

import SwiftUI

import SwiftUI

struct AppIconView: View {
    var body: some View {
        Image("AppIconInsider")
            .resizable()
            .scaledToFit()
            .shadow(radius: 4)
            .padding([.horizontal], 45)
    }
}



#Preview {
    AppIconView()
}


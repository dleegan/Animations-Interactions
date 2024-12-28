//
//  ContentView.swift
//  Animations Interactions
//
//  Created by dleegan on 26/12/2024.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            Tab("Loading", systemImage: "timer") {
                LoadingCircle()
            }

            Tab("Loading", systemImage: "trash") {
                RemovableCell()
            }

            Tab("Card", systemImage: "menucard") {
                ReturnableCard()
            }
        }
    }
}

#Preview {
    ContentView()
}

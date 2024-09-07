//
//  ContentView.swift
//  little-lemon-final-assigment
//
//  Created by Nguyen Ngoc Binh on 8/29/24.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @StateObject private var viewModel = ViewModel()
    var body: some View {
        Group {
            if viewModel.shouldShowOnboarding {
                OnboardingScreen()
            } else {
                HomeScreen()
            }
        }
        .onAppear {
            viewModel.checkOnboardingStatus()
        }
    }
}

#Preview {
    ContentView()
        .modelContainer(for: Item.self, inMemory: true)
}

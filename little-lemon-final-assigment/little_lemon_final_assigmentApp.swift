//
//  little_lemon_final_assigmentApp.swift
//  little-lemon-final-assigment
//
//  Created by Nguyen Ngoc Binh on 8/29/24.
//

import SwiftUI
import SwiftData

@main
struct little_lemon_final_assigmentApp: App {
    let persistenceController = PersistenceController.shared
    var body: some Scene {
        WindowGroup {
            ContentView().environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}

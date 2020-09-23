//
//  coredata_sampleApp.swift
//  coredata_sample
//
//  Created by Andrew Miotke on 9/22/20.
//

import SwiftUI

@main
struct coredata_sampleApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}

//
//  InstagridTutorialApp.swift
//  InstagridTutorial
//
//  Created by Djiveradjane Canessane on 16/02/2021.
//

import SwiftUI

@main
struct InstagridTutorialApp: App {
    var layoutViewModel = LayoutViewModel()

    var body: some Scene {
        WindowGroup {
            MainView()
                // On transmet le layoutViewModel non seulement au MainView mais aussi à tous ses sous vues
                .environmentObject(layoutViewModel)
        }
    }
}

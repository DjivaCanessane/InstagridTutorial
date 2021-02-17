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
    // Comme pour le layoutViewModel, on crée ici imagePickerViewModel pour que ce soit une variable d'environnement
    var imagePickerViewModel = ImagePickerViewModel()

    var body: some Scene {
        WindowGroup {
            MainView()
                .environmentObject(layoutViewModel)
                .environmentObject(imagePickerViewModel)
        }
    }
}

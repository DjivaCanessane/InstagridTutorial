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
    var imagePickerViewModel = ImagePickerViewModel()

    var body: some Scene {
        WindowGroup {
            MainView()
                .environmentObject(layoutViewModel)
                .environmentObject(imagePickerViewModel)
        }
    }
}

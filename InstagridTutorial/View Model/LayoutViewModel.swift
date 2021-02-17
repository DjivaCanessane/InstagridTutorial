//
//  LayoutViewModel.swift
//  InstagridTutorial
//
//  Created by Djiveradjane Canessane on 17/02/2021.
//

import Foundation

class LayoutViewModel: ObservableObject {
    //Le property wrapper @Published permet de notifier lorsque sa valeur change à toutes les vues qui utlisent celle-ci
    @Published var showTopLeftButton = false
    @Published var showBottomRightButton = true
}
